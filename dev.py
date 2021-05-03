#!/usr/bin/python3
import fire
import subprocess

class Build(object):

    def build_image(self, tag, path, build_args):
        subprocess.run(['docker', 'build',
            '-t', tag,
            '--build-arg', build_args[0],
            '--build-arg', build_args[1],
            '-f', path,
            '.'
            ])

    def base(self):
        tag = 'thib_base'
        path = './docker/base/Dockerfile'
        subprocess.run(['docker', 'build',
            '-t', tag,
            '-f', path,
            '.'
            ])

    def thib(self):
        tag = 'dev_thib'
        dockerfile_path = './docker/dev/Dockerfile'
        build_args=[
                'user=thib',
                'BASE_IMAGE=thib_base:latest'
        ]
        self.build_image(tag, dockerfile_path, build_args)

    def sv(self):
        tag = 'dev_thib'
        dockerfile_path = './docker/dev/Dockerfile'
        build_args=[
                'user=sv',
                'BASE_IMAGE=seervision/development:latest'
        ]
        self.build_image(tag, dockerfile_path, build_args)

class Start(object):

    def thib(self):
        subprocess.run(['docker', 'run',
            '--dti',
            '--privileged',
            '--name', 'thib_dev',
            '--net', 'host'])
        subprocess.run(['docker', 'exec',
            '-ti',
            '-u', 'thib',
            'thib_dev',
            'zsh'])

    def sv(self):
        subprocess.run(['git', 'checkout',
            'thib_dev_image',
            '--',
            'docker/run_containers/run_dev.sh'])
        subprocess.run(['bash', '~/main/docker/run_containers/run_dev.sh'])
        return 'start dev sv image'

class Dev(object):

    def __init__(self):
        self.build = Build()
        self.start = Start()

if __name__ == '__main__':
    fire.Fire(Dev)
