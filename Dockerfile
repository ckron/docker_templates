FROM osrf/ros:noetic-desktop-full

MAINTAINER ckron

# for gnu screen
ENV SHELL /bin/bash

RUN apt-get update && apt-get install -y --no-install-recommends \
  git \
  vim \
  screen \
  ngetty \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir -p ~/catkin_ws/src && \
    cd ~/catkin_ws/src && \
    /bin/bash -c "source /opt/ros/noetic/setup.bash; catkin_init_workspace" && \
    cd ~/catkin_ws && \
    /bin/bash -c "source /opt/ros/noetic/setup.bash; catkin_make" && \
    echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
