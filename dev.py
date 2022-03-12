#!/usr/bin/python3
import fire
import subprocess
from typing import List
import os

BASE_IMAGE_TAG = 'thib_base'
DEV_IMAGE_TAG = 'dev_thib'
DEV_CONTAINER_NAME = 'thib_dev'
DEV_USER = os.getenv('DEV_USER', 'thib')
HOST_HOMEDIR = os.path.expanduser('~')
CONTAINER_HOMEDIR = f'/home/{DEV_USER}'


class Build(object):
    def build_image(self, tag, path, build_args):
        def _concat_build_args(build_args):
            args = []
            for arg in build_args:
                args.append('--build-arg')
                args.append(arg)
            return args
        print(_concat_build_args(build_args))
        subprocess.run(
            ['docker', 'build', '-t', tag, *_concat_build_args(build_args), '-f', path, '.'])

    def base(self):
        path = './docker/base/Dockerfile'
        subprocess.run(['docker', 'build', '-t', BASE_IMAGE_TAG, '-f', path, '.'])

    def thib(self):
        dockerfile_path = './docker/dev/Dockerfile'
        build_args = ['user=thib', f'BASE_IMAGE={BASE_IMAGE_TAG}:latest']
        self.build_image(DEV_IMAGE_TAG, dockerfile_path, build_args)

    def sv(self):
        dockerfile_path = './docker/dev/Dockerfile'
        build_args = ['user=sv', 'BASE_IMAGE=seervision/development:latest', f'GROUP_ID={os.getegid()}', f'USER_ID={os.geteuid()}']
        self.build_image(DEV_IMAGE_TAG, dockerfile_path, build_args)


def attach(container_name=DEV_CONTAINER_NAME):
    subprocess.run(['docker', 'start', container_name])
    subprocess.run(['docker', 'exec', '-ti', '-u', 'thib', container_name, 'zsh'])


class Start(object):
    def _add_mount_args(self, src, dest):
        return ['--mount', f'type=bind,source={src},target={dest}']

    def _add_mirror_mount(self, run_args: List[str], path: str) -> None:
        run_args += self._add_mount_args(path, path)

    def thib(self,
             container_name=DEV_CONTAINER_NAME,
             image_tag=DEV_IMAGE_TAG,
             mount_dotfiles=True,
             mount_ssh=True,
             mount_gitconfig=True,
             mount_zsh_history=True,
             mount_glab_cache=True,
             mount_projects_dir=True):
        subprocess.run(['docker', 'rm', '-f', container_name])
        run_args = [
            'docker', 'run', '-dti', '--privileged', '--name', container_name, '--net', 'host', '--volume',
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
        if mount_projects_dir:
            self._add_mirror_mount(run_args, f'{HOST_HOMEDIR}/Projects')
        subprocess.run(run_args + [image_tag])
        attach()

    def sv(self):
        subprocess.run([
            'bash',
            f'{HOST_HOMEDIR}/main/docker/run_containers/run_dev.sh',
            '--image',
            'dev_thib',
            '--mount-zsh-history',
            #'--wait-for-entrypoint',
            '--restart-tmux-session',
        ])


class Dev(object):
    def __init__(self):
        self.build = Build()
        self.start = Start()

    def attach(self):
        attach()


if __name__ == '__main__':
    fire.Fire(Dev)
