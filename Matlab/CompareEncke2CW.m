%% Compare 42's Encke vs EH for drift
% Load and compare results from 42 for two spacecraft. Assumes that SC[0]
% in 42 is propagated using 42 EULER_HILL and that SC[1] in 42 is
% propagated using 42 ENCKE. Both SC must have the same Orb_ref and
% starting states.

%% Load 42 results
time = load('..\EnckeVsEH\time.42')/60;           % Time [min]
PosEH = load('..\EnckeVsEH\PosEH00.42')/1000;     % Euler-Hill Position [km]
VelEH = load('..\EnckeVsEH\VelEH00.42');          % Euler-Hill Velocity [m/s]
PosEncke = load('..\EnckeVsEH\PosEH01.42')/1000;  % Encke Position [km]
VelEncke = load('..\EnckeVsEH\VelEH01.42');       % Encke Velocity [m/s]

%% Plot

% Plot difference between EH and Encke 42 propagation
figure(1);
subplot(3,2,1);
plot(time, PosEncke(:,1)-PosEH(:,1));   ylabel('dx [km]');
title('Encke vs EH Position');
subplot(3,2,3);
plot(time, PosEncke(:,2)-PosEH(:,2));   ylabel('dy [km]');
subplot(3,2,5);
plot(time, PosEncke(:,3)-PosEH(:,3));   ylabel('dz [km]'); 
xlabel('Time [min]');
subplot(3,2,2);
plot(time, VelEncke(:,1)-VelEH(:,1));   ylabel('dv_x [m/s]');
title('Encke vs EH Velocity');
subplot(3,2,4);
plot(time, VelEncke(:,2)-VelEH(:,2));   ylabel('dv_y [m/s]');
subplot(3,2,6);
plot(time, VelEncke(:,3)-VelEH(:,3));   ylabel('dv_z [m/s]');
xlabel('Time [min]');

% Plot 3D view
figure(2);
plot3(PosEncke(:,1),PosEncke(:,2),PosEncke(:,3))
hold on
plot3(PosEH(:,1),PosEH(:,2),PosEH(:,3));
legend('Encke','Euler-Hill','Location','Best');
title('Position in the Formation Frame');