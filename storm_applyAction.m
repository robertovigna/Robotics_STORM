function storm_applyAction(ros_io, actionIdx)
    % actionIdx va da 1 a 11. Convertiamo in m (da 0 a 10)
    m = actionIdx - 1; 
    
    % Formula del paper: omega = -0.8 + 0.16 * m
    omega = -0.8 + 0.16 * m; 
    
    ros_io.velMsg.linear.x = 0.2; % Velocità in avanti costante
    ros_io.velMsg.angular.z = omega;
    send(ros_io.velPub, ros_io.velMsg);
end