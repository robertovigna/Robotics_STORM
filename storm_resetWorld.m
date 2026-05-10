function storm_resetWorld(ros_io)
    % Frena il robot
    ros_io.velMsg.linear.x = 0.0;
    ros_io.velMsg.angular.z = 0.0;
    send(ros_io.velPub, ros_io.velMsg);
    pause(0.2);

    % Invia il comando al Relay su Ubuntu
    send(ros_io.resetPub, ros_io.resetMsg);
    pause(0.5); % Aspetta che il teletrasporto avvenga
end