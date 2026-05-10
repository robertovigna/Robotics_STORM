function [isDone, reward] = storm_checkReward(obs)
    minDist = min(obs);
    collisionThreshold = 0.25; % Se un raggio è sotto i 25cm, è un muro!
    
    if minDist <= collisionThreshold
        isDone = true;
        reward = -1000;
    else
        isDone = false;
        reward = 5;
    end
end