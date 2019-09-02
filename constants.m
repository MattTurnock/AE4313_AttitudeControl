% constants.m - used to define a bunch of constants and other misc stuff
% for main.slx


% if-elses so simulink can be run without using runner
if (exist('with_noise')) == 0
    with_noise = true;
end
if (exist('with_tracking')) ==0
    with_tracking = true;
end
if (exist('use_xhat')) ==0
    use_xhat = false;
end

    

% Sets legacy variables using new variables defined in runner
if with_noise == true
    noise_att_on = 1;
    noise_ome_on = 1;
else
    noise_att_on = 0;
    noise_ome_on = 0;
end

if with_tracking == true
    tracking = 1;
else
    tracking = 0;
end


% Set and calculate Orbit-based variables
muE = 3.986004418E14; % m^3/s^2
RE = 6378*1000; % m
R = (RE + 700*1000); % radius in m

% Used for getting position
n_magnitude = sqrt(muE/R^3);
n = tracking * n_magnitude;
T=2*pi/n;

% Initial spacecraft conditions
pm_0 = [0 0 0]; % equivalent to w_0
tendeg = deg2rad(10);
eul_0 = [tendeg tendeg tendeg]; %radians
w_0 = [0 0 0]; 
state_init = [eul_0 w_0];

% Satellite inertia matrix
inertia = [2500 0 0; 
    0 2300 0; 
    0 0 3000]; % kgm^2

% Disturbance torques vector (1 or 0 for on or off)
Td_on = 1; 
T_d = Td_on * [0.001 0.001 0.001];  % Nm

% Timesteps
dt_noise=0.1;
dt = 0.01;

% Attitude noise (1 or 0 for on or off)
noise_att_mag = noise_att_on * (deg2rad(0.1))^2; % radiasn

% Rotation rate noise (1 or 0 for on or off)
p_noise = noise_ome_on * deg2rad(0.1); % radians / s
q_noise = noise_ome_on * deg2rad(-0.1); % radians / s
r_noise = noise_ome_on * deg2rad(0.15); % radians / s
pqr_noise = [p_noise q_noise r_noise];

% Gains for the PID controllers %%
phi_P = -465;
phi_I =-21;
phi_D = -2434;

theta_P = -568;
theta_I = -28.5;
theta_D = -2213;

Psi_P = -7886;
Psi_I = -460;
Psi_D = -30035;



% COVARIANCES
measure_covar = [3.0462e-06 3.0462e-06 3.0462e-06 1e-12 1e-12 1e-12];
float_error = 1e-12;
init_covar = float_error*[1 1 1 1 1 1];
float_error = 1e-12;
state_covar = [float_error float_error float_error float_error float_error float_error];
