timebase = 0:0.01:119.99;
timebase(end)  = 120;

% define figure properties
opts.figure_name = 'gamma_grav';
opts.Colors     = get(groot,'defaultAxesColorOrder');
opts.saveFolder = 'img/';
opts.width      = 12.6;
opts.height     = 6; %9 for both
opts.fontType   = 'Times';
opts.fontSize   = 9;
% create new figure
fig = figure; clf


%prostok¹ty
    myax = axes;
    rectangle('Position',[2.77,0,4.61-2.77,2.5],'FaceColor',[204 255 204]/255,'EdgeColor','w','LineWidth',0.01)
    rectangle('Position',[7.35,0,9.23-7.35,2.5],'FaceColor',[204 255 204]/255,'EdgeColor','w','LineWidth',0.01)
    
    hold on
    grid on
    
    load('final\k035_g16_trapez03.mat')
    hk00_g00 = plot(timebase,Motion.SolverOptions.k_torque,'-','LineWidth',1);
        one_leg = (Motion.SupportLeg == 'Left')
    one_leg = one_leg + (Motion.SupportLeg == 'Right')
%         grid on
%     hk00_g02 = plot(timebase,one_leg,'-.','LineWidth',1);
    myax.Layer = 'top';
    
%     axis tight
    ylim([0 2.5])
    xlabel('time [s]')
%     ylabel('\gamma_{grav} value')
    legend('$\gamma_{grav}(t)$ in S3','Interpreter','latex','Location',  'NorthWest')
%     set(gca,'xtick', [3 6 9 12])
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