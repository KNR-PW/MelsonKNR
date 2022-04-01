%wykres left ankleX
joint = 12;

timebase = 0:0.01:11.99;
timebase(end)  = 12;

% define figure properties
opts.figure_name = 'left_ankleX';
opts.Colors     = get(groot,'defaultAxesColorOrder');
opts.saveFolder = 'img/';
opts.width      = 12.6;
opts.height     = 6; %9 for both
opts.fontType   = 'Times';
opts.fontSize   = 9;
% create new figure
fig = figure; clf

    % PLOT - both
    % Torque
    subplot(1,2,1);
    hold on
    grid on
    
    load('final\k00_g00_new.mat')
    hk00_g00 = plot(timebase,Torque(:,joint),'-.','LineWidth',1.5);

    load('final\k10_g00_new.mat')
    hk10_g00 = plot(timebase,Torque(:,joint),':','LineWidth',1.5);
    
    load('final\k035_g16_trapez03.mat')
    hk035_g16 = plot(timebase,Torque(:,joint),'--','LineWidth',1.5);
   
    axis tight
    xlabel('time [s]')
    ylabel('torque [Nm]')
    set(gca,'xtick', [3 6 9 12])

    legend({'$S1$','$S2$','$S3$'},'Interpreter','latex','Location',  'NorthWest')
    legend('boxoff')
    
    % Position
    subplot(1,2,2);
    hold on
    grid on
    
    load('final\k00_g00_new.mat')
    hk00_g00 = plot(timebase,180/pi*GaitJointAngles(joint,:),'-.','LineWidth',1.5);

    load('final\k10_g00_new.mat')
    hk10_g00 = plot(timebase,180/pi*GaitJointAngles(joint,:),':','LineWidth',1.5);
    
    load('final\k035_g16_trapez03.mat')
    hk035_g16 = plot(timebase,180/pi*GaitJointAngles(joint,:),'--','LineWidth',1.5);
    
 
    axis tight
    xlabel('time [s]')
    ylabel('position [degree]')
    set(gca,'xtick', [3 6 9 12])

%     legend({'$k=0.0~g=0.0$','$k=1.0~g=0.0$','$k=0.35~g=1.6$'},'Interpreter','latex','Location', 'Best')


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