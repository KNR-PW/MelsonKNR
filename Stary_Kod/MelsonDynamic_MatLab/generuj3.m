global gamma_joint
global gamma_grav

gamma_joint = 0.0;
gamma_grav  = 0.0;

MainFrame2;

N = size(Torque,1);

for Iter = 1:N
    if Motion.SupportLeg(Iter) == "Both"
        Torque(Iter,:) = zeros(1,12);
    end
end

% energia
max(max(Torque))
min(min(Torque))

save('final\k00_g00_new.mat');

global gamma_joint
global gamma_grav

gamma_joint = 1.0;
gamma_grav  = 0.0;

MainFrame2;

N = size(Torque,1);
for Iter = 1:N
    if Motion.SupportLeg(Iter) == "Both"
        Torque(Iter,:) = zeros(1,12);
    end
end

% energia
max(max(Torque))
min(min(Torque))


save('final\k10_g00_new.mat');

global gamma_joint
global gamma_grav

gamma_joint = 0.35;
gamma_grav  = 1.6;

MainFrame2;

N = size(Torque,1);
for Iter = 1:N
    if Motion.SupportLeg(Iter) == "Both"
        Torque(Iter,:) = zeros(1,12);
    end
end

% energia
max(max(Torque))
min(min(Torque))

save('final\k035_g16_trapez03.mat');

