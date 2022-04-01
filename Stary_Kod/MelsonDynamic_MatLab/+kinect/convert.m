function [ humanoid ] = convert2humanoid( kinect )
% Transformacja wektorów z kinecta do poprawnych z Wojtyrologi¹
    for i=1: length(kinect)
       humanoid(:,i) = [-kinect(i,3); -kinect(i,1); kinect(i,2)]; 
    end
end

