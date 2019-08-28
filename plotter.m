%%%%%%%%%%%%%%%%%%%%%LOAD THINGS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


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



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                    %PLOT THINGS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fig1 = figure(1);
hold on
plot(times, X_clean_tracked);
plot(times, X_noisy_tracked);
legend('mean', 'boys', 'eat', 'the', 'yellow', 'cheese')
grid on
saveas(fig1, 'this.pdf')
































