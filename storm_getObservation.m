function obs = storm_getObservation(ros_io)
    scanData = receive(ros_io.scanSub, 5);
    rawScans = scanData.ranges;
    
    % Pulisce i dati: se il laser non tocca nulla (Inf o NaN), mettiamo 5 metri
    rawScans(isinf(rawScans) | isnan(rawScans)) = 5.0;
    
    % Sottocampiona da 512 a 50 valori
    idx = round(linspace(1, length(rawScans), 50));
    obs = rawScans(idx);
    
    % Il toolbox DRL vuole un vettore colonna di double
    obs = double(obs(:));
end