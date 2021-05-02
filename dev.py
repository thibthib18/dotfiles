#!/usr/bin/python3
import fire
import docker

class Build(object):

  def thib(self):
    return 'build dev thib image'

  def sv(self):
    return 'build dev sv image'
docker build -t dev_thib --build-arg user=thib --build-arg BASE_IMAGE=thib_base:latest .

class Start(object):

  def thib(self):
    return 'start dev thib image'

  def sv(self):
    return 'start dev sv image'

class Pipeline(object):

  def __init__(self):
    self.build = Build()
    self.start = Start()

if __name__ == '__main__':
  fire.Fire(Pipeline)
