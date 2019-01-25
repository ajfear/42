%% Comparison between 42 Euler-Hill and Matlab CW using ode45 and rk4
% Compare the results of Euler-Hill propagation from 42 with propagation
% in MATLAB using ode45 and rk4 functions.

% Load 42 Position and Velocity in EH frame
time = load('..\SWARMS\time.42');            % Time [s]
F = [load('..\SWARMS\PosEH00.42') ...        
     load('..\SWARMS\VelEH00.42')]/1000;     % [km km/s]
% accel = load('..\InOut\accel.42')/1000;     % [km/s^2]
n = sqrt(3.98604e5/6978.145^3);             % Mean motion

%Propagate using ode45
[~,x_ode] = ode45(@cwderiv, time, F(1,:), [], n, zeros(1,3));
dx_ode = (x_ode - F)*1000;  % [m m/s]

% Propagate using rk4
[~,x_rk4] = rk4(@cwderiv, time, F(1,:), [], n, zeros(length(time),3)/1000);
dx_rk4 = (x_rk4 - F)*1000;  % [m m/s]

%% Plots

% Plot 42 vs ode45
figure(1);
subplot(321); 
plot(time, dx_ode(:,1));  ylabel('x [m]'); title('42 vs ODE45 Position');
subplot(323);
plot(time, dx_ode(:,2));  ylabel('y [m]');
subplot(325);
plot(time, dx_ode(:,3));  ylabel('z [m]'); xlabel('Time [s]');
subplot(322);
plot(time, dx_ode(:,4));  ylabel('v_x [m/s]'); title('42 vs ODE45 Velocity');
subplot(324);
plot(time, dx_ode(:,5));  ylabel('v_y [m/s]');
subplot(326);
plot(time, dx_ode(:,6)); ylabel('v_z [m/s]'); xlabel('Time [s]');


% Plot 42 vs rk4
figure(2);
subplot(321);
plot(time, dx_rk4(:,1));  ylabel('x [m]'); title('42 vs RK4 Position');
subplot(323);
plot(time, dx_rk4(:,2));  ylabel('y [m]');
subplot(325);
plot(time, dx_rk4(:,3));  ylabel('z [m]'); xlabel('Time [s]');
subplot(322);
plot(time, dx_rk4(:,4));  ylabel('x [m/s]'); title('42 vs RK4 Velocity');
subplot(324);
plot(time, dx_rk4(:,5));  ylabel('y [m/s]');
subplot(326);
plot(time, dx_rk4(:,6));  ylabel('z [m/s]'); xlabel('Time [s]');