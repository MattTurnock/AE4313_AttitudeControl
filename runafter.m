% runafter.m - Used in runner.m to save the data from workspace to file
%              for various required variables

run constants;
if and( (with_noise == false), (with_tracking == false))
    save('timeseries/X_clean_untracked.mat', 'X_clean')
    save('timeseries/w_clean_untracked', 'w_clean')
    save('timeseries/X_ref_clean_untracked', 'X_ref')
    save('timeseries/xhat_clean_untracked', 'xhat')
    save('timeseries/M__T_d_clean_untracked', 'M__T_d')
    save('timeseries/M_clean_untracked', 'M')
elseif and( (with_noise == false), (with_tracking == true))
    save('timeseries/X_clean_tracked', 'X_clean')
    save('timeseries/w_clean_tracked', 'w_clean')
    save('timeseries/X_ref_clean_tracked', 'X_ref')
    save('timeseries/xhat_clean_tracked', 'xhat')
    save('timeseries/M__T_d_clean_tracked', 'M__T_d')
    save('timeseries/M_clean_tracked', 'M')
elseif and( (with_noise == true), (with_tracking == true))
    save('timeseries/X_noisy_tracked', 'X_noisy')
    save('timeseries/w_noisy_tracked', 'w_noisy')
    save('timeseries/X_ref_noisy_tracked', 'X_ref')
    save('timeseries/xhat_noisy_tracked', 'xhat')
    save('timeseries/M__T_d_noisy_tracked', 'M__T_d')
    save('timeseries/M_noisy_tracked', 'M')
end