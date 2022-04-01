wymiary;
vect_left = [rand rand rand]'*2-1;
vect_left = vect_left/norm(vect_left); %wersor
vect_left = vect_left*(193-25)*rand + vect_left*25;

norm(vect_left)
LeftHand = humanoid.r_CH_LA + vect_left;
q_left = OZK_korpus_rekaL(LeftHand);
ans = q_left *180/pi

q = [zeros(1,15) q_left 0];
clf;
stick_robot(real(q));
hold on;
plot3(LeftHand(1),LeftHand(2),LeftHand(3),'r+')
hold off;