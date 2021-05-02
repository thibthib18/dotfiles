#!/usr/bin/python3
import fire
import docker

api = docker.from_env()
class Build(object):

    def base(self):
        tag = 'thib_base'
        path = './docker/base'
        api.images.build(path=path,tag=tag)
        return 'build dev base image'

    def thib(self):
        tag = 'dev_thib'
        path = './docker/dev'
        build_args={
                "user": "thib",
                "BASE_IMAGE": "thib_base:latest"
        }
        api.images.build(path=path,tag=tag, buildargs=build_args)
        return 'build dev thib image'

    def sv(self):
        tag = 'dev_thib'
        path = './docker/dev/Dockerfile'
        build_args={
                "user": "sv",
                "BASE_IMAGE": "seervision/development:latest"
        }
        api.images.build(path=path,tag=tag, buildargs=build_args)
        return 'build dev sv image'

class Start(object):

    def thib(self):
        api.containers.run(
                image='dev_thib:latest',
                name='thib_dev',
                command='zsh',
                user='thib',
                tty=True,
                detach=True,
                privileged=True,
                network_mode='host',
                )
        return 'start dev thib image'

    def sv(self):
        #  checkout run_dev file from my branch
        #  call it
        return 'start dev sv image'

class Dev(object):

    def __init__(self):
        self.build = Build()
        self.start = Start()

if __name__ == '__main__':
    fire.Fire(Dev)
