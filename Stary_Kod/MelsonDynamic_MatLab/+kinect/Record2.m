function [ CurrentRecord ] = Record2( VidInput )
%RECORD Summary of this function goes here
%   Detailed explanation goes here
    
%% Rozruch
    vid.FramesPerTrigger = 100000;
    vid.TriggerRepeat = 20000;
    

    start(VidInput);
    
    disp('Czekam na rozpoczêcie nagrywania')
   
    pause();
    
    gcf = figure();
    set(gcf,'currentchar','~');         % set a dummy character
    preview(VidInput);
    
    trigger(VidInput);
    while get(gcf,'currentchar')=='~'  % which gets changed when key is pressed
    end
    
    stop(VidInput)
    
    %%%%%%%%%%%%%%%%%%% Tutaj dalszy kod
    
  
    

end

