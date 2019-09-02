function x = state_estimatation(x, u)
% STate estimator function, which just applies Euler equations for the
% Kalman filter
% u is commanded torque
% x is state

w1 = x(4);
w2 = x(5);
w3 = x(6);

I = [2500 2300 3000]; 

I11 = I(1);
I22 = I(2);
I33 = I(3);

M = (1/cos(x(2)))*[0        sin(x(3)),          cos(x(3)); 
                 0,       cos(x(3))*cos(x(2)), -sin(x(3))*cos(x(2));
                 cos(x(2)), sin(x(3))*sin(x(2)), cos(x(3))*sin(x(2))]*[w1;w2;w3];

w1_dot = (u(1) - (I33 - I22)*w3*w2)/I11;
w2_dot = (u(2) - (I11 - I33)*w1*w3)/I22;
w3_dot = (u(3) - (I22 - I11)*w2*w1)/I33;

dt = 0.01;

x = x + dt*[M(1); M(2); M(3); w1_dot; w2_dot; w3_dot];

end


