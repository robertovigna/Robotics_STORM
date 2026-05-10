clear all; clc;

% 1. Inizializza
ros_io = storm_setup();

% 2. Mettilo in posizione di partenza
disp('Reset...');
storm_resetWorld(ros_io);

% 3. Fagli fare 20 passi (es. azione 8 = sterza leggermente a sinistra)
disp('Inizio movimento...');
for i = 1:20
    storm_applyAction(ros_io, 8);
    obs = storm_getObservation(ros_io);
    [isDone, reward] = storm_checkReward(obs);
    
    fprintf('Step %d: Min Dist = %.2f m, Reward = %d\n', i, min(obs), reward);
    if isDone
        disp('SBANG! Muro preso.');
        break;
    end
end

disp('Finito! Rimetto a posto...');
storm_resetWorld(ros_io);