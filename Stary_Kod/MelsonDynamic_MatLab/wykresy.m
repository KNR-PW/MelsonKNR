% define figure properties
opts.Colors     = get(groot,'defaultAxesColorOrder');
opts.saveFolder = 'img/';
opts.width      = 8;
opts.height     = 6; %9 for both
opts.fontType   = 'Times';
opts.fontSize   = 9;
opts.figure_name = 'default_name';
% create new figure
fig = figure; clf
figure_plot = 1; % 1-torque, 2-position, 3-both
if figure_plot == 1
    % PLOT - Torque
    opts.height = 5;
    load('final\H.mat')
    hk10_g00 = plot(timebase,H,'-.','LineWidth',1.5);
    hold on
    grid on
    load('final\H_optim.mat')
    hk02_g08 = plot(timebase,H,':','LineWidth',1.5);
    axis tight
    xlabel('time [s]')
    ylabel('H_{grav} function')
    legend({'$k=1.0~g=0.0$','$k=0.35~g=1.6$'},'Interpreter','latex','Location', 'Best')
    opts.figure_name = 'figure_torque11';
elseif figure_plot == 2 
    % PLOT - Position
    load('final\k10_g00.mat')
    hk10_g00 = plot(GaitJointAngles(1,:),'-.','LineWidth',1.5);
    hold on
    grid on
    load('final\k02_g08.mat')
    hk02_g08 = plot(GaitJointAngles(1,:),':','LineWidth',1.5);
    axis tight
    xlabel('time sample')
    ylabel('position [rad]')
    legend({'$k=1.0~g=0.0$','$k=0.2~g=0.8$'},'Interpreter','latex')
    opts.figure_name = 'figure_position';
elseif figure_plot == 3
    opts.height = 10;
    joint = 10;
    % PLOT - both
    % Torque
    load('final\k10_g00_new.mat')
    subplot(2,1,1);
    hk10_g00 = plot(timebase,Torque(:,joint),'-.','LineWidth',1.5);
    hold on
    grid on
    load('final\k035_g16_new.mat')
    hk02_g08 = plot(timebase,Torque(:,joint),':','LineWidth',1.5);
    axis tight
    xlabel('time [s]')
    ylabel('torque [Nm]')
%     legend({'$k=1.00~g=0.0$','$k=0.35~g=1.6$'},'Interpreter','latex','Location', 'Best')
    
    % Position
    load('final\k10_g00_new.mat')
    subplot(2,1,2);
    hk10_g00 = plot(timebase,180/pi*GaitJointAngles(joint,:),'-.','LineWidth',1.5);
    hold on
    grid on
    load('final\k035_g16_new.mat')
    hk02_g08 = plot(timebase,180/pi*GaitJointAngles(joint,:),':','LineWidth',1.5);
    axis tight
    xlabel('time [s]')
    ylabel('position [degree]')
    legend({'$k=1.00~g=0.0$','$k=0.35~g=1.6$'},'Interpreter','latex','Location', 'Best')
    opts.figure_name = 'figure_both8';
else
    opts.height = 10;
    % PLOT - both
    % pozycja bez optymalizacji
    load('final\long_long.mat')
    subplot(2,1,1);
    
    TimeIter = 1
    HelpfulPlots.robot_RF(RobotModelParameters, GaitJointAngles(:,TimeIter), X_Planned(:,TimeIter));
    TimeIter = N
    HelpfulPlots.robot_RF(RobotModelParameters, GaitJointAngles(:,TimeIter), X_Planned(:,TimeIter/3));
    
    set(gca, 'xticklabel', []);
    set(gca, 'yticklabel', []);
    set(gca, 'zticklabel', []);
    
    title('k = 0.0')
    hold on
    grid on
    
    % pozycja z optymalizacja
    load('final\long_k1.mat')
    subplot(2,1,2);
   
    TimeIter = 1
    HelpfulPlots.robot_RF(RobotModelParameters, GaitJointAngles(:,TimeIter), X_Planned(:,TimeIter));
    TimeIter = N
    HelpfulPlots.robot_RF(RobotModelParameters, GaitJointAngles(:,TimeIter), X_Planned(:,TimeIter));
    
    set(gca, 'xticklabel', []);
    set(gca, 'yticklabel', []);
    set(gca, 'zticklabel', []);
    
    title('k = 1.0')
    opts.figure_name = 'figure_long';

end
%% Plot configuration
% scaling
fig.Units               = 'centimeters';
fig.Position(3)         = opts.width;
fig.Position(4)         = opts.height;
% set text properties
set(fig.Children, ...
    'FontName',     'Times', ...
    'FontSize',     9);
% remove unnecessary white space
set(gca,'LooseInset',max(get(gca,'TightInset'), 0.02))
% export to png
fig.PaperPositionMode   = 'auto';
print([opts.saveFolder opts.figure_name], '-dpng', '-r600')
% print([opts.saveFolder 'my_figure'], '-dpdf', '-r600')