clc, clear, close all

% Set the Vc
muE = 3.986004418E14; % m^3/s^2
RE = 6378*1000; % m
R = (RE + 700*1000); % radius in m
Vc = sqrt(muE / R); % m/s

% Calculate local gravity
g = 9.8; %m/s^2
g_h = g * (RE/R)^2; % local gravity, m/s^2
g_h_km = g_h * 10^-3; % local gravity, km/s^2

% Initial conditions
mass_0 = 1; %kg (not real, just for gravity shizz)
F_grav = mass_0 * g_h; % in N
F_0 = [0 0 0];
Vm_0 = [0 Vc 0];
pm_0 = [0 0 0];
xme_0 = [R 0 0];


tendeg = deg2rad(10);
eul_ref = [0 0 0]; % radians
eul_0 = [tendeg tendeg tendeg]; %radians

% Satellite inertia matrix
inertia = [2500 0 0; 
    0 2300 0; 
    0 0 3000]; % kgm^2

% Disturbance torques vector
Td_on = 0;
T_d = Td_on * [0.001 0.001 0.001];  % Nm

% Attitude noise (1 or 0 for on or off)
noise_att_on = 0;
noise_att_mag = deg2rad(0.1); % radiasn
phi_noise = noise_att_on * noise_att_mag; 
theta_noise = noise_att_on * noise_att_mag; 
Psi_noise = noise_att_on * noise_att_mag; 

% Rotation rate noise (1 or 0 for on or off)
noise_ome_on = 0;
p_noise = noise_ome_on * deg2rad(0.1); % radians / s
q_noise = noise_ome_on * deg2rad(-0.1); % radians / s
r_noise = noise_ome_on * deg2rad(0.15); % radians / s


%%%% NEWER %%%

xme_0 = [1 2 3]







