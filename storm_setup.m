function ros_io = storm_setup()
    setenv('ROS_DOMAIN_ID','0');
    ros_io.node = ros2node("/matlab_drl_agent");
    
    % Publisher & Subscriber standard
    ros_io.velPub = ros2publisher(ros_io.node, "/model/storm/cmd_vel", "geometry_msgs/Twist");
    ros_io.velMsg = ros2message(ros_io.velPub);
    ros_io.scanSub = ros2subscriber(ros_io.node, "/model/storm/scan", "sensor_msgs/LaserScan");
    
    % IL NUOVO PONTE PER IL RESET
    ros_io.resetPub = ros2publisher(ros_io.node, "/matlab_reset", "std_msgs/Empty");
    ros_io.resetMsg = ros2message(ros_io.resetPub);
    
    disp('Setup ROS 2 completato!');
end