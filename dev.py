#!/usr/bin/python3
import fire
import subprocess
from typing import List
import time
import sys
import os
import json

BASE_IMAGE_TAG = 'thib_base'
DEV_IMAGE_TAG = 'seervision/build:dev_thib'
DEV_CONTAINER_NAME = 'sv-app-1'
DEV_USER = os.getenv('DEV_USER', 'thib')
HOST_HOMEDIR = os.path.expanduser('~')
CONTAINER_HOMEDIR = f'/home/{DEV_USER}'

SCRIPT_DIR = sys.path[0]

with open(f'{SCRIPT_DIR}/personal/ips.json') as f:
    IPS = json.load(f)


class Build(object):

    def build_image(self, tag, path, build_args):

        def _concat_build_args(build_args):
            args = []
            for arg in build_args:
                args.append('--build-arg')
                args.append(arg)
            return args

        print(_concat_build_args(build_args))
        subprocess.run([
            'docker', 'build', '-t', tag, *_concat_build_args(build_args),
            '-f', path, '.'
        ])

    def base(self):
        path = f'{SCRIPT_DIR}/docker/base/Dockerfile'
        subprocess.run(
            ['docker', 'build', '-t', BASE_IMAGE_TAG, '-f', path, '.'])

    def thib(self):
        dockerfile_path = f'{SCRIPT_DIR}/docker/dev/Dockerfile'
        build_args = ['user=thib', f'BASE_IMAGE={BASE_IMAGE_TAG}:latest']
        self.build_image(DEV_IMAGE_TAG, dockerfile_path, build_args)

    def sv(self):
        dockerfile_path = f'{SCRIPT_DIR}/docker/dev/Dockerfile'
        build_args = [
            'user=sv', 'BASE_IMAGE=seervision/build:latest',
            f'GROUP_ID={os.getegid()}', f'USER_ID={os.geteuid()}'
        ]
        self.build_image(DEV_IMAGE_TAG, dockerfile_path, build_args)


def attach(container_name=DEV_CONTAINER_NAME):
    subprocess.run(['docker', 'start', container_name])
    subprocess.run(
        ['docker', 'exec', '-ti', '-u', 'thib', container_name, 'zsh'])


class Start(object):

    def _add_mount_args(self, src, dest) -> List[str]:
        return ['--mount', f'type=bind,source={src},target={dest}']

    def _add_sv_mount_args(self, src, dest) -> List[str]:
        return ['--volume', f'{src}:{dest}']

    def _add_mirror_mount(self, run_args: List[str], path: str) -> None:
        run_args += self._add_mount_args(path, path)

    def _add_sv_mount(self, run_args: List[str], src: str, dest: str) -> None:
        run_args += self._add_sv_mount_args(src, dest)

    def thib(self,
             container_name=DEV_CONTAINER_NAME,
             image_tag=DEV_IMAGE_TAG,
             mount_dotfiles=True,
             mount_ssh=True,
             mount_gitconfig=True,
             mount_zsh_history=True,
             mount_nvim_history=True,
             mount_glab_cache=True,
             mount_projects_dir=True):
        subprocess.run(['docker', 'rm', '-f', container_name])
        run_args = [
            'docker', 'run', '-dti', '--privileged', '--name', container_name,
            '--net', 'host', '--volume',
            '/var/run/docker.sock:/var/run/docker.sock'
        ]
        if mount_dotfiles:
            self._add_mirror_mount(run_args, f'{HOST_HOMEDIR}/dotfiles')
        if mount_ssh:
            self._add_mirror_mount(run_args, f'{HOST_HOMEDIR}/.ssh')
        if mount_gitconfig:
            self._add_mirror_mount(run_args, f'{HOST_HOMEDIR}/.gitconfig')
        if mount_zsh_history:
            self._add_mirror_mount(run_args, f'{HOST_HOMEDIR}/.zsh_history')
        if mount_nvim_history:
            self._add_mirror_mount(run_args,
                                   f'{HOST_HOMEDIR}/.local/share/nvim/lazy')
        if mount_projects_dir:
            self._add_mirror_mount(run_args, f'{HOST_HOMEDIR}/Projects')
        subprocess.run(run_args + [image_tag])
        attach()

    def _add_sv_home_mirror_mount(self, run_args: List[str],
                                  relative_path: str) -> None:
        self._add_sv_mount(run_args, f'{HOST_HOMEDIR}/{relative_path}',
                           f'/home/sv/{relative_path}')

    def sv(self):
        run_args = []
        self._add_sv_home_mirror_mount(run_args, '.local/share/nvim/lazy')
        self._add_sv_home_mirror_mount(run_args, '.zsh_history')
        self._add_sv_home_mirror_mount(run_args, 'Projects')
        self._add_sv_home_mirror_mount(run_args, 'code')
        self._add_sv_home_mirror_mount(run_args, 'dotfiles')
        self._add_sv_home_mirror_mount(run_args, '.config/github-copilot')
        print(run_args)
        subprocess.run([
            'python3',
            f'{HOST_HOMEDIR}/main/docker/run_containers/compose/launch.py',
            '--tag',
            'dev_thib',
            '--volume',
            '/tmp/.X11-unix:/tmp/.X11-unix',
            '--variable',
            'DISPLAY',
            *run_args,
        ])


def ping(host: str) -> bool:
    timeout_ms = 500
    is_reachable = subprocess.call(
        ['fping', '-c', '1', '-t',
         str(timeout_ms), host],
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL) == 0
    return is_reachable


def sv_notify(title: str, text: str) -> None:
    subprocess.run([
        'notify-send', title, text, '--icon',
        '/home/thib/main/frontend/interface/npm/src/assets/logo.svg'
    ])


def wake_on_lan(host: str) -> None:
    with open(f'{SCRIPT_DIR}/personal/dops_mac.json') as f:
        macs = json.load(f)
    mac = macs[host]
    subprocess.run(['ssh', f'sv@{IPS["pc2"]}', 'wakeonlan', mac])


def connect(host: str) -> None:
    wake_on_lan(host)
    while not ping(host):
        print(f'Waiting for {host}... ')
        time.sleep(1)
    sv_notify("Server is ready ✅", f"Connection to {host} established")
    subprocess.run(['ssh', f"thib@{host}"])


def scout() -> None:
    for i in range(1, 22):
        is_reachable = ping(f'{IPS["zt_prefix"]}{i}')
        if is_reachable:
            print(f'DOP {i} reachable ✅')
        else:
            print(f'DOP {i} unreachable ❌')


def waitfor(ip: str) -> None:
    while not ping(ip):
        print(f'Waiting for {ip}... ')
        time.sleep(1)
    sv_notify("Server is online ✅", f"{ip} is ready")


class Dev(object):

    def __init__(self):
        self.build = Build()
        self.start = Start()
        self.connect = connect
        self.attach = attach
        self.scout = scout
        self.waitfor = waitfor
        self.wake_on_lan = wake_on_lan


if __name__ == '__main__':
    fire.Fire(Dev)
