H = zeros(1,N);
R = diag( [ones(1,12) zeros(1,7)] );
for i=1:N
    tor = Motion.JointTorque(:,i);
    H(i) = 0.5 * tor' *R*tor;
end