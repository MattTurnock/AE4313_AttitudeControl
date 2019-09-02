% runner.m - Run this script to do required simulations, and save the data

clc, clear, close all

model_name = 'main';

% Run clean non-tracking
with_noise = false;
with_tracking = false;
run constants
sim(model_name)
run runafter

% Run clean tracking
with_noise = false;
with_tracking = true;
run constants
sim(model_name)
run runafter

% Run noisy tracking
with_noise = true;
with_tracking = true;
run constants
sim(model_name)
run runafter