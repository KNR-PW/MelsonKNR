ScoreMat = zeros(size(results));

for IterGrav = 1:length(gamma_grav_vector)
    for IterJoint = 1:length(gamma_joint_vector)
        ScoreMat(IterGrav,IterJoint) = sum(sum(abs(results(IterGrav,IterJoint).JointTorque)));
    end
end

[X,Y] = meshgrid(gamma_joint_vector,gamma_grav_vector);
surfc(X,Y,ScoreMat)

xlabel('\gamma_{joint}');
ylabel('\gamma_{grav}');
zlabel('wynik');
