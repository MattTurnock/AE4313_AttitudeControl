function x = state_estimatation(x, u)


ic = [2500 2300 3000]; 

ic11 = ic(1);
ic22 = ic(2);
ic33 = ic(3);

t1 = x(1);
t2 = x(2);
t3 = x(3);
w1 = x(4);
w2 = x(5);
w3 = x(6);


Torq = u;
w1_dot = (Torq(1) - (ic33 - ic22)*w3*w2)/ic11;
w2_dot = (Torq(2) - (ic11 - ic33)*w1*w3)/ic22;
w3_dot = (Torq(3) - (ic22 - ic11)*w2*w1)/ic33;

M = (1/cos(t2))*[0        sin(t3),          cos(t3); 
                 0,       cos(t3)*cos(t2), -sin(t3)*cos(t2);
                 cos(t2), sin(t3)*sin(t2), cos(t3)*sin(t2)]*[w1;w2;w3];

t1_dot = M(1);
t2_dot = M(2);
t3_dot = M(3);

dt = 0.01;

x = x + dt*[t1_dot; t2_dot; t3_dot; w1_dot; w2_dot; w3_dot];

end


