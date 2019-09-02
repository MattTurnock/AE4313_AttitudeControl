% plotter.m - Used to load saved data, and plot for report presentation

clc, clear, close all
%%%%%%%%%%%%%%%%%%%%%LOAD THINGS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

set(0,'DefaultFigureVisible','on')
set(0, 'DefaultLineLineWidth', 2);
doall = true;
doM = false;

noisywidth = 0.1;
fatwidth = 2;
fig_position = [0 0 1280 720];


'start'

%%%%%%%%%%%%%%%%%%%%%%%%% Load clean-untracked %%%%%%%%%%%%%%%%%%%%%%%%%
load('timeseries/X_clean_untracked', 'X_clean')
X_clean_untracked = X_clean.data;
times = X_clean.time;
clear X_clean

load('timeseries/w_clean_untracked', 'w_clean')
w_clean_untracked = w_clean.data;
clear w_clean

load('timeseries/xhat_clean_untracked', 'xhat')
xhat_clean_untracked = xhat;
clear xhat

load('timeseries/M__T_d_clean_untracked', 'M__T_d')
M_all_clean_untracked = M__T_d.data;
clear M__T_d;

load('timeseries/M_clean_untracked', 'M')
M_clean_untracked = M.data;
clear M

%%%%%%%%%%%%%%%%%%%%%%%%% Load clean-tracked %%%%%%%%%%%%%%%%%%%%%%%%%
load('timeseries/X_clean_tracked', 'X_clean')
X_clean_tracked = X_clean.data;
clear X_clean

load('timeseries/w_clean_tracked', 'w_clean')
w_clean_tracked = w_clean.data;
clear w_clean

load('timeseries/xhat_clean_tracked', 'xhat')
xhat_clean_tracked = xhat;
clear xhat

load('timeseries/M__T_d_clean_tracked', 'M__T_d')
M_all_clean_tracked = M__T_d.data;
clear M__T_d;

load('timeseries/M_clean_tracked', 'M')
M_clean_tracked = M.data;
clear M


%%%%%%%%%%%%%%%%%%%%%%%%% Load noisy-tracked %%%%%%%%%%%%%%%%%%%%%%%%%
load('timeseries/X_noisy_tracked', 'X_noisy')
X_noisy_tracked = X_noisy.data;
clear X_clean

load('timeseries/w_noisy_tracked', 'w_noisy')
w_noisy_tracked = w_noisy.data;
clear w_clean

load('timeseries/xhat_noisy_tracked', 'xhat')
xhat_noisy_tracked = xhat;
clear xhat

load('timeseries/M__T_d_noisy_tracked', 'M__T_d')
M_all_noisy_tracked = M__T_d.data;
clear M__T_d;

load('timeseries/M_noisy_tracked', 'M')
M_noisy_tracked = M.data;
clear M

% Load reference for both untracked and tracked

load('timeseries/X_ref_clean_untracked', 'X_ref')
X_ref_untracked = X_ref.data;
clear X_ref

load('timeseries/X_ref_clean_tracked', 'X_ref')
X_ref_tracked = X_ref.data;
clear X_ref

if doall == true
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                        %PLOT CLEAN UNTRACKED
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % Plot euler angles for clean untracked (is also error of untracked)

    X_clean_untracked_deg = rad2deg(X_clean_untracked);
    fig1 = figure('NumberTitle','off', 'Name','1', 'Position',fig_position);
    hold on
    plot(times, X_clean_untracked_deg);
    hold off
    legend('\phi', '\theta', '\Psi')
    xlabel('Elapsed Time [s]')
    ylabel('X [deg]')
    grid on
    set(findall(gcf,'-property','FontSize'),'FontSize',30)
    saveas(fig1, 'plots\X_clean_untracked.png')

    % Trim above plot to show accuracy
    fig101 = figure('NumberTitle','off', 'Name','101', 'Position',fig_position);
    hold on
    plot(times, X_clean_untracked_deg);
    hold off
    legend('\phi', '\theta', '\Psi', 'Location','southeast')
    xlabel('Elapsed Time [s]')
    ylabel('X [deg]')
    grid on
    xlim([40,100]);
    ylim([-0.6,0.2]);
    set(findall(gcf,'-property','FontSize'),'FontSize',30)
    saveas(fig101, 'plots\X_clean_untracked_trim.png')





    if doM == true
        % Plot applied torques clean untracked

        fig2 = figure('NumberTitle','off', 'Name','2', 'Position',fig_position);
        hold on
        plot(times, M_clean_untracked);
        hold off
        legend('M_1', 'M_2', 'M_3')
        xlabel('Elapsed Time [s]')
        ylabel('M [N]')
        grid on
        set(findall(gcf,'-property','FontSize'),'FontSize',30)
        saveas(fig2, 'plots\M_clean_untracked.png')
    end


    % Plot omega clean untracked

    fig3 = figure('NumberTitle','off', 'Name','3', 'Position',fig_position);
    hold on
    plot(times, rad2deg(w_clean_untracked));
    hold off
    legend('\omega_1', '\omega_2', '\omega_3', 'Location','southeast')
    xlabel('Elapsed Time [s]')
    ylabel('\omega [deg/s]')
    grid on
    set(findall(gcf,'-property','FontSize'),'FontSize',30)
    saveas(fig3, 'plots\w_clean_untracked.png')



    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                        %PLOT CLEAN TRACKED
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % Plot euler angles for clean tracked

    X_clean_tracked_deg = rad2deg(X_clean_tracked);
    fig4 = figure('NumberTitle','off', 'Name','4', 'Position',fig_position);
    hold on
    plot(times, X_clean_tracked_deg);
    hold off
    legend('\phi', '\theta', '\Psi')
    xlabel('Elapsed Time [s]')
    ylabel('X [deg]')
    grid on
    set(findall(gcf,'-property','FontSize'),'FontSize',30)
    saveas(fig4, 'plots\X_clean_tracked.png')

    % Plot euler angle error for clean tracked

    X_err_clean_tracked_deg = rad2deg(X_clean_tracked - X_ref_tracked);
    fig5 = figure('NumberTitle','off', 'Name','5', 'Position',fig_position);
    hold on
    plot(times, X_err_clean_tracked_deg);
    hold off
    legend('\phi_{err}', '\theta_{err}', '\Psi_{err}')
    xlabel('Elapsed Time [s]')
    ylabel('X_{err} [deg]')
    grid on
    set(findall(gcf,'-property','FontSize'),'FontSize',30)
    saveas(fig5, 'plots\X_err_clean_tracked.png')

    % Trim above plot to show error
    fig501 = figure('NumberTitle','off', 'Name','501', 'Position',fig_position);
    hold on
    plot(times, X_err_clean_tracked_deg);
    hold off
    legend('\phi_{err}', '\theta_{err}', '\Psi_{err}', 'Location','southeast')
    xlabel('Elapsed Time [s]')
    ylabel('X_{err} [deg]')
    grid on
    xlim([40,100]);
    ylim([-0.6,0.2]);
    set(findall(gcf,'-property','FontSize'),'FontSize',30)
    saveas(fig501, 'plots\X_err_clean_tracked_trim.png')

    if doM == true
        % Plot applied torques clean tracked

        fig6 = figure('NumberTitle','off', 'Name','6', 'Position',fig_position);
        hold on
        plot(times, M_clean_tracked);
        hold off
        legend('M_1', 'M_2', 'M_3')
        xlabel('Elapsed Time [s]')
        ylabel('M [N]')
        grid on
        set(findall(gcf,'-property','FontSize'),'FontSize',30)
        saveas(fig6, 'plots\M_clean_tracked.png')
    end


    % Plot omega clean tracked

    fig7 = figure('NumberTitle','off', 'Name','7', 'Position',fig_position);
    hold on
    plot(times, rad2deg(w_clean_tracked));
    hold off
    legend('\omega_1', '\omega_2', '\omega_3', 'Location','southeast')
    xlabel('Elapsed Time [s]')
    ylabel('\omega [deg/s]')
    grid on
    set(findall(gcf,'-property','FontSize'),'FontSize',30)
    saveas(fig7, 'plots\w_clean_tracked.png')




    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                        %PLOT NOISY TRACKED
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % Plot euler angles for noisy tracked

    X_noisy_tracked_deg = rad2deg(X_noisy_tracked);
    fig8 = figure('NumberTitle','off', 'Name','8', 'Position',fig_position);
    hold on
    plot(times, X_noisy_tracked_deg);
    hold off
    legend('\phi', '\theta', '\Psi')
    xlabel('Elapsed Time [s]')
    ylabel('X [deg]')
    grid on
    set(findall(gcf,'-property','FontSize'),'FontSize',30)
    saveas(fig8, 'plots\X_noisy_tracked.png')

    % Plot euler angle error for noisy tracked

    X_err_noisy_tracked_deg = rad2deg(X_noisy_tracked - X_ref_tracked);
    fig9 = figure('NumberTitle','off', 'Name','9', 'Position',fig_position);
    hold on
    plot(times, X_err_noisy_tracked_deg);
    hold off
    legend('\phi_{err}', '\theta_{err}', '\Psi_{err}')
    xlabel('Elapsed Time [s]')
    ylabel('X_{err} [deg]')
    grid on
    set(findall(gcf,'-property','FontSize'),'FontSize',30)
    saveas(fig9, 'plots\X_err_noisy_tracked.png')

    % Plot above trimmed
    fig901 = figure('NumberTitle','off', 'Name','901', 'Position',fig_position);
    hold on
    plot(times, X_err_noisy_tracked_deg);
    hold off
    legend('\phi_{err}', '\theta_{err}', '\Psi_{err}', 'Location','southeast')
    xlabel('Elapsed Time [s]')
    ylabel('X_{err} [deg]')
    grid on
    xlim([40,100]);
    ylim([-2,2]);
    set(findall(gcf,'-property','FontSize'),'FontSize',30)
    saveas(fig901, 'plots\X_err_noisy_tracked_trim.png')

    if doM == true
        % Plot applied torques noisy tracked

        fig10 = figure('NumberTitle','off', 'Name','10', 'Position',fig_position);
        hold on
        plot(times, M_noisy_tracked);
        hold off
        legend('M_1', 'M_2', 'M_3')
        xlabel('Elapsed Time [s]')
        ylabel('M [N]')
        grid on
        set(findall(gcf,'-property','FontSize'),'FontSize',30)
        saveas(fig10, 'plots\M_noisy_tracked.png')
    end


    % Plot omega noisy tracked

    fig11 = figure('NumberTitle','off', 'Name','11', 'Position',fig_position);
    hold on
    plot(times, rad2deg(w_noisy_tracked));
    hold off
    legend('\omega_1', '\omega_2', '\omega_3', 'Location','southeast')
    xlabel('Elapsed Time [s]')
    ylabel('\omega [deg/s]')
    grid on
    set(findall(gcf,'-property','FontSize'),'FontSize',30)
    saveas(fig11, 'plots\w_noisy_tracked.png')





    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                        %PLOT xhat THINGS
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % Plot clean tracked, xhat tracked, noisy tracked, on same plot FOR PHI

    fig12 = figure('NumberTitle','off', 'Name','12', 'Position',fig_position);
    hold on
    plot(times, X_clean_tracked_deg(:, 1), 'linewidth', fatwidth);
    plot(times(1:10001), rad2deg(xhat_noisy_tracked(:, 1)), 'linewidth', fatwidth);
    plot(times, X_noisy_tracked_deg(:,1), 'linewidth', noisywidth);
    hold off
    legend('\phi_{clean}', '\phi_{xhat}', '\phi_{noisy}', 'Location','southeast')
    xlabel('Elapsed Time [s]')
    ylabel('Euler Angle [deg]')
    grid on
    set(findall(gcf,'-property','FontSize'),'FontSize',30)
    saveas(fig12, 'plots\xhat_phi_noisy_tracked.png') 

    % Plot clean tracked, xhat tracked, noisy tracked, on same plot FOR THETA

    fig13 = figure('NumberTitle','off', 'Name','13', 'Position',fig_position);
    hold on
    plot(times, X_clean_tracked_deg(:, 2), 'linewidth', fatwidth);
    plot(times(1:10001), rad2deg(xhat_noisy_tracked(:, 2)), 'linewidth', fatwidth);
    plot(times, X_noisy_tracked_deg(:,2), 'linewidth', noisywidth);
    hold off
    legend('\theta_{clean}', '\theta_{xhat}', '\theta_{noisy}')
    xlabel('Elapsed Time [s]')
    ylabel('Euler Angle [deg]')
    grid on
    set(findall(gcf,'-property','FontSize'),'FontSize',30)
    saveas(fig13, 'plots\xhat_theta_noisy_tracked.png') 

    % Plot clean tracked, xhat tracked, noisy tracked, on same plot FOR PSI
    fig14 = figure('NumberTitle','off', 'Name','14', 'Position',fig_position);
    hold on
    plot(times, X_clean_tracked_deg(:, 3), 'linewidth', fatwidth);
    plot(times(1:10001), rad2deg(xhat_noisy_tracked(:, 3)), 'linewidth', fatwidth);
    plot(times, X_noisy_tracked_deg(:,3), 'linewidth', noisywidth);
    hold off
    legend('\Psi_{clean}', '\Psi_{xhat}', '\Psi_{noisy}')
    xlabel('Elapsed Time [s]')
    ylabel('Euler Angle [deg]')
    grid on
    set(findall(gcf,'-property','FontSize'),'FontSize',30)
    saveas(fig14, 'plots\xhat_Psi_noisy_tracked.png') 

end

X_err_clean_tracked_deg = rad2deg(X_clean_tracked - X_ref_tracked);
X_err_noisy_tracked_deg = rad2deg(X_noisy_tracked - X_ref_tracked);
xhat_X_err_noisy_tracked_deg = xhat_noisy_tracked(:,1:3) - X_ref_tracked(1:10001, :);
%%%% Do above 3 plots with errors and trim %%%%%%%%

trim_yticks = [-1.0:0.1:1.1];

% phi err
fig15 = figure('NumberTitle','off', 'Name','15', 'Position',fig_position);
hold on
plot(times, X_err_clean_tracked_deg(:, 1), 'linewidth', fatwidth);
plot(times(1:10001), rad2deg(xhat_X_err_noisy_tracked_deg(:, 1)), 'linewidth', fatwidth);
plot(times, X_err_noisy_tracked_deg(:,1), 'linewidth', noisywidth);
hold off
legend('\phi_{err,clean}', '\phi_{err,xhat}', '\phi_{err,noisy}')
xlabel('Elapsed Time [s]')
ylabel('Euler Angle [deg]')
grid on
set(findall(gcf,'-property','FontSize'),'FontSize',30)
saveas(fig15, 'plots\xhat_phi_err_noisy_tracked.png') 

fig1501 = figure('NumberTitle','off', 'Name','1501', 'Position',fig_position);
hold on
plot(times, X_err_clean_tracked_deg(:, 1), 'linewidth', fatwidth);
plot(times(1:10001), rad2deg(xhat_X_err_noisy_tracked_deg(:, 1)), 'linewidth', fatwidth);
plot(times, X_err_noisy_tracked_deg(:,1), 'linewidth', noisywidth);
hold off
legend('\phi_{err,clean}', '\phi_{err,xhat}', '\phi_{err,noisy}', 'Location','southeast')
xlabel('Elapsed Time [s]')
ylabel('Euler Angle [deg]')
grid on
xlim([40,100]);
ylim([-1.0,0.5]);
yticks(trim_yticks);
set(findall(gcf,'-property','FontSize'),'FontSize',30)
saveas(fig1501, 'plots\xhat_phi_err_noisy_tracked_trim.png') 


% theta err
fig16 = figure('NumberTitle','off', 'Name','16', 'Position',fig_position);
hold on
plot(times, X_err_clean_tracked_deg(:, 2), 'linewidth', fatwidth);
plot(times(1:10001), rad2deg(xhat_X_err_noisy_tracked_deg(:, 2)), 'linewidth', fatwidth);
plot(times, X_err_noisy_tracked_deg(:,2), 'linewidth', noisywidth);
hold off
legend('\theta_{err,clean}', '\theta_{err,xhat}', '\theta_{err,noisy}')
xlabel('Elapsed Time [s]')
ylabel('Euler Angle [deg]')
grid on
set(findall(gcf,'-property','FontSize'),'FontSize',30)
saveas(fig16, 'plots\xhat_theta_err_noisy_tracked.png') 

fig1601 = figure('NumberTitle','off', 'Name','1601', 'Position',fig_position);
hold on
plot(times, X_err_clean_tracked_deg(:, 2), 'linewidth', fatwidth);
plot(times(1:10001), rad2deg(xhat_X_err_noisy_tracked_deg(:, 2)), 'linewidth', fatwidth);
plot(times, X_err_noisy_tracked_deg(:,2), 'linewidth', noisywidth);
hold off
legend('\theta_{err,clean}', '\theta_{err,xhat}', '\theta_{err,noisy}', 'Location','southeast')
xlabel('Elapsed Time [s]')
ylabel('Euler Angle [deg]')
grid on
xlim([40,100]);
ylim([-1.0,0.5]);
yticks(trim_yticks);
set(findall(gcf,'-property','FontSize'),'FontSize',30)
saveas(fig1601, 'plots\xhat_theta_err_noisy_tracked_trim.png') 


% Psi err
fig17 = figure('NumberTitle','off', 'Name','17', 'Position',fig_position);
hold on
plot(times, X_err_clean_tracked_deg(:, 3), 'linewidth', fatwidth);
plot(times(1:10001), rad2deg(xhat_X_err_noisy_tracked_deg(:, 3)), 'linewidth', fatwidth);
plot(times, X_err_noisy_tracked_deg(:,3), 'linewidth', noisywidth);
hold off
legend('\Psi_{err,clean}', '\Psi_{err,xhat}', '\Psi_{err,noisy}')
xlabel('Elapsed Time [s]')
ylabel('Euler Angle [deg]')
grid on
set(findall(gcf,'-property','FontSize'),'FontSize',30)
saveas(fig17, 'plots\xhat_Psi_err_noisy_tracked.png') 

fig1701 = figure('NumberTitle','off', 'Name','1701', 'Position',fig_position);
hold on
plot(times, X_err_clean_tracked_deg(:, 3), 'linewidth', fatwidth);
plot(times(1:10001), rad2deg(xhat_X_err_noisy_tracked_deg(:, 3)), 'linewidth', fatwidth);
plot(times, X_err_noisy_tracked_deg(:,3), 'linewidth', noisywidth);
hold off
legend('\Psi_{err,clean}', '\Psi_{err,xhat}', '\Psi_{err,noisy}', 'Location','southeast')
xlabel('Elapsed Time [s]')
ylabel('Euler Angle [deg]')
grid on
xlim([40,100]);
ylim([-1.0,0.5]);
yticks(trim_yticks);
set(findall(gcf,'-property','FontSize'),'FontSize',30)
saveas(fig1701, 'plots\xhat_Psi_err_noisy_tracked_trim.png') 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
%%%%%%%%%%%%%%%% Do xhat things for w %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xhat_w_noisy_tracked_deg = rad2deg(xhat_noisy_tracked(:,4:6));

fig18 = figure('NumberTitle','off', 'Name','18', 'Position',fig_position);
hold on
plot(times(1:10001), xhat_w_noisy_tracked_deg);
hold off
legend('\omega_1_{xhat}', '\omega_2_{xhat}', '\omega_3_{xhat}')
xlabel('Elapsed Time [s]')
ylabel('Angular Velocity [deg/s]')
grid on
set(findall(gcf,'-property','FontSize'),'FontSize',30)
saveas(fig18, 'plots\xhat_omega_noisy_tracked.png') 

fig19 = figure('NumberTitle','off', 'Name','19', 'Position',fig_position);
hold on
plot(times(1:10001), xhat_w_noisy_tracked_deg);
hold off
legend('\omega_1_{xhat}', '\omega_2_{xhat}', '\omega_3_{xhat}')
xlabel('Elapsed Time [s]')
ylabel('Angular Velocity [deg/s]')
grid on
xlim([40,100]);
ylim([-0.3,0.5]);
set(findall(gcf,'-property','FontSize'),'FontSize',30)
saveas(fig19, 'plots\xhat_omega_noisy_tracked_trim.png') 






'done'















