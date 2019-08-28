clc, clear, close all

with_noise = false;
with_tracking = false;
run constants
sim('test1_v6')
run runafter

with_noise = false;
with_tracking = true;
run constants
sim('test1_v6')
run runafter

with_noise = true;
with_tracking = true;
run constants
sim('test1_v6')
run runafter