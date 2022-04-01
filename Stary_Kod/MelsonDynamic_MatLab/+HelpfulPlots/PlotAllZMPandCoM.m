figure

subplot(1,2,1);
hold on
plot(GaitZMPReferenceTrajectory(1,:));
plot(GaitZMPPlannedTrajectory(1,:));
% plot(GaitCoMTrajectory(1,:));

subplot(1,2,2);
hold on
plot(GaitZMPReferenceTrajectory(2,:));
plot(GaitZMPPlannedTrajectory(2,:));
% plot(GaitCoMTrajectory(2,:));

