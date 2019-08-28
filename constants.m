% clc, clear, close all



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

% % Set the Vc
muE = 3.986004418E14; % m^3/s^2
RE = 6378*1000; % m
R = (RE + 700*1000); % radius in m
% Vc = sqrt(muE / R); % m/s

% Used for getting position
n_magnitude = sqrt(muE/R^3);

n = tracking * n_magnitude;
T=2*pi/n;

% % Calculate local gravity
% g = 9.8; %m/s^2
% g_h = g * (RE/R)^2; % local gravity, m/s^2
% g_h_km = g_h * 10^-3; % local gravity, km/s^2

% Initial conditions
mass_0 = 1; %kg (not real, just for gravity shizz)
% F_grav = mass_0 * g_h; % in N
F_0 = [0 0 0];
Vm_0 = [0 0 0];
pm_0 = [0 0 0];
xme_0 = [0 0 0];


tendeg = deg2rad(10);
eul_0 = [tendeg tendeg tendeg]; %radians
w_0 = [0 0 0]; 
state_init = [eul_0 w_0];

% Satellite inertia matrix
inertia = [2500 0 0; 
    0 2300 0; 
    0 0 3000]; % kgm^2

% Disturbance torques vector (1 or 0 for on or off)
Td_on = 1; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
T_d = Td_on * [0.001 0.001 0.001];  % Nm


dt_noise=0.1;
dt = 0.01;
% Attitude noise (1 or 0 for on or off)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
noise_att_mag = (deg2rad(0.1))^2; % radiasn
phi_noise = noise_att_on * noise_att_mag; 
theta_noise = noise_att_on * noise_att_mag; 
Psi_noise = noise_att_on * noise_att_mag; 

% Rotation rate noise (1 or 0 for on or off)
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p_noise = noise_ome_on * deg2rad(0.1); % radians / s
q_noise = noise_ome_on * deg2rad(-0.1); % radians / s
r_noise = noise_ome_on * deg2rad(0.15); % radians / s
pqr_noise = [p_noise q_noise r_noise];

% Gains for the PID controllers %%
% phi_P = -465.198158177747;
% phi_I = -21.7313338529705;
% phi_D = -2434.80245399495;
% 
% theta_P = -568.423410964435;
% theta_I = -28.5001924417647;
% theta_D = -2213.03320065217;
% 
% Psi_P = -7886.12074600839;
% Psi_I = -460.070676690981;
% Psi_D = -30034.6975048403;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
measure_covar = [3.0462e-06 3.0462e-06 3.0462e-06 deg2rad(0.1) deg2rad(0.1) deg2rad(0.15)];
init_covar = [1 1 1 1 1 1];
float_error = 1e-12;
state_covar = [float_error float_error float_error float_error float_error float_error];
% state_covar = measure_covar;





