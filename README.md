Roslaunch for ROS2 Java
=======================

This project is a quick-and-dirty hack to adapt https://github.com/bponsler/rosjava_roslaunch project to ros2_java

It was created in 2 hours by removing references to roscore, logging to file, etc and by making parameters being passed through command line.

It requires exporting ROS2_JAVA_PATH=path1:path2 which will be searched for executable specified in `type` tag inside launchfile

Example
-------

In the example below ROS2_JAVA_PATH will be searched for the file called ros2-java-maven-example.sh
The file will be executed with the working directory where it resides, so it is ok to use a bash file with relative paths.

```
<?xml version="1.0"?>

<launch>

  <arg name="host" default="192.168.0.201" />

  <node pkg="ros2_java_maven_example" name="ros2_java_maven_example" type="ros2-java-maven-example.sh">
    <param name="frame_id" value="base_laser_link"/>
    <param name="host" value="$(arg host)" />
    <param name="topic" value="/scan" />
  </node>

</launch>
```

The contents of the file

```
#!/bin/bash

java -jar target/ros2-java-maven-example-*-SNAPSHOT-jar-with-dependencies.jar $@
```

TODO
----

* Rewite the code
* Allow directly executing jar files (with wildcards in names)
* Make a library out of it so it can be used by orchestrator
