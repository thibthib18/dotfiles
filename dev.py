#!/usr/bin/python3
import fire
import subprocess
import os

base_image_tag = 'thib_base'
dev_image_tag = 'dev_thib'
dev_container_name = 'thib_dev'
dev_user = os.getenv('DEV_USER', 'thib')
host_homedir = os.path.expanduser('~')
container_homedir = f'/home/{dev_user}'


class Build(object):
    def build_image(self, tag, path, build_args):
        subprocess.run(
            ['docker', 'build', '-t', tag, '--build-arg', build_args[0], '--build-arg', build_args[1], '-f', path, '.'])

    def base(self):
        path = './docker/base/Dockerfile'
        subprocess.run(['docker', 'build', '-t', base_image_tag, '-f', path, '.'])

    def thib(self):
        dockerfile_path = './docker/dev/Dockerfile'
        build_args = ['user=thib', f'BASE_IMAGE={base_image_tag}:latest']
        self.build_image(dev_image_tag, dockerfile_path, build_args)

    def sv(self):
        dockerfile_path = './docker/dev/Dockerfile'
        build_args = ['user=sv', 'BASE_IMAGE=seervision/development:latest']
        self.build_image(dev_image_tag, dockerfile_path, build_args)


def attach():
    subprocess.run(['docker', 'start', dev_container_name])
    subprocess.run(['docker', 'exec', '-ti', '-u', 'thib', dev_container_name, 'zsh'])


class Start(object):
    def _add_mount_args(self, src, dest):
        return ['--mount', f'type=bind,source={src},target={dest}']

    def thib(self,
             mount_dotfiles=True,
             mount_ssh=True,
             mount_gitconfig=True,
             mount_zsh_history=True,
             mount_projects_dir=True):
        subprocess.run(['docker', 'rm', '-f', dev_container_name])
        run_args = [
            'docker', 'run', '-dti', '--privileged', '--name', dev_container_name, '--net', 'host', '--volume',
            '/var/run/docker.sock:/var/run/docker.sock'
        ]
        if mount_dotfiles:
            dotfiles_src = f'{host_homedir}/dotfiles'
            dotfiles_dest = f'{container_homedir}/dotfiles'
            run_args += self._add_mount_args(dotfiles_src, dotfiles_dest)
        if mount_ssh:
            src = f'{host_homedir}/.ssh'
            dest = f'{container_homedir}/.ssh'
            run_args += self._add_mount_args(src, dest)
        if mount_gitconfig:
            src = f'{host_homedir}/.gitconfig'
            dest = f'{container_homedir}/.gitconfig'
            run_args += self._add_mount_args(src, dest)
        if mount_zsh_history:
            src = f'{host_homedir}/.zsh_history'
            dest = f'{container_homedir}/.zsh_history'
            run_args += self._add_mount_args(src, dest)
        if mount_projects_dir:
            src = f'{host_homedir}/Projects'
            dest = f'{container_homedir}/Projects'
            run_args += self._add_mount_args(src, dest)
        subprocess.run(run_args + [dev_image_tag])
        attach()

    def sv(self):
        subprocess.run([
            'bash',
            f'{host_homedir}/main/docker/run_containers/run_dev.sh',
            '--image',
            'dev_thib',
            '--mount-zsh-history',
            '--wait-for-entrypoint',
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
