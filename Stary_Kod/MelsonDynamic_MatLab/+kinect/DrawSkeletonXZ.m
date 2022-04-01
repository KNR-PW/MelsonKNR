function [ ] = DrawSkeleton( skeleton )
%DRAW_SKELETON Summary of this function goes here
%   Detailed explanation goes here

SkeletonConnectionMap = [[1 2]; % Spine
                         [2 3];
                         [3 4];
                         [3 5]; %Left Hand
                         [5 6];
                         [6 7];
                         [7 8];
                         [3 9]; %Right Hand
                         [9 10];
                         [10 11];
                         [11 12];
                         [1 17]; % Right Leg
                         [17 18];
                         [18 19];
                         [19 20];
                         [1 13]; % Left Leg
                         [13 14];
                         [14 15];
                         [15 16]];

    hold on;

    
    axis equal;
    
    for i = 1:19
        X = [skeleton(SkeletonConnectionMap(i,1),1) skeleton(SkeletonConnectionMap(i,2),1)];
        Z = [skeleton(SkeletonConnectionMap(i,1),3) skeleton(SkeletonConnectionMap(i,2),3)];
        line(X,Z, 'LineWidth', 1.5, 'LineStyle', '-', 'Marker', '+', 'Color', 'r');  
    end

    hold off;


end

