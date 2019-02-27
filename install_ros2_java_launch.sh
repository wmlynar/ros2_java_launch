#!/bin/sh

mvn -o install

sudo chown -R $(id -u):$(id -g) /opt
mkdir -p /opt/ros2_java/bin
echo "export PATH=/opt/ros2_java/bin:\${PATH}" >> ~/.bashrc
export PATH=/opt/ros2_java/bin:${PATH}

cp target/ros2-java-launch-*-jar-with-dependencies.jar /opt/ros2_java/bin
cp ros2launch /opt/ros2_java/bin
