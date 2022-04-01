%wykres hipX
joint = 2;

timebase = 0:0.01:119.99;
timebase(end)  = 120;

% define figure properties
opts.figure_name = 'joint_drift';
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
%     subplot(1,2,1);
    hold on
    grid on
    
    load('final\long_none.mat')
    hk00_g00 = plot(timebase,180/pi*GaitJointAngles(joint,:),'-','LineWidth',1);

    load('final\long_k1.mat')
    hk00_g00 = plot(timebase,180/pi*GaitJointAngles(joint,:),'-.','LineWidth',1);
   
    axis tight
    xlabel('time [s]')
    ylabel('position [degree]')
    legend({'$\gamma_{joint}=0.0$','$\gamma_{joint}=1.0$'},'Interpreter','latex','Location',  'NorthWest')
    set(gca,'xtick', [30 60 90 120])
%     legend('boxoff')
    % Position
    
%     subplot(1,2,2);
%     hold on
%     grid on
%     
%     load('final\long_k1.mat')
%     hk00_g00 = plot(timebase,180/pi*GaitJointAngles(joint,:),'-','LineWidth',1);
% 
%    
%     axis tight
%     xlabel('time [s]')
%     ylabel('position [degree]')
%     legend({'$S1$'},'Interpreter','latex','Location',  'NorthWest')
%     set(gca,'xtick', [30 60 90 120])
% %     legend('boxoff')
%     % Position

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