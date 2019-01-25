load('..\Rendezvous\time.42');
load('..\Rendezvous\PosEH00.42');
load('..\Rendezvous\VelEH00.42');
% load('..\Rendezvous\accel.42');

F = [load('..\Rendezvous\PosEH00.42') ...        
     load('..\Rendezvous\VelEH00.42')]/1000;     % [km km/s]

%% Plot
figure(1);
plot3(F(:,1),F(:,2),F(:,3)); grid on;
xlabel('x [km]'); ylabel('y [km]'); zlabel('z [km]');
title(['CW Position, T = ',num2str(time(end)),' s']);

figure(2);
plot(F(1,2),F(1,1),'kx'); hold on;
plot(F(end,2),F(end,1),'k^');
plot(F(:,2),F(:,1)); grid on
xlabel('x [km]'); ylabel('y [km]');
title(['CW Position X-Y Plane, T = ',num2str(time(end)),' s']);
legend('Start','End','Location','best')

figure(3);
subplot(311);
plot(time, F(:,1)); ylabel('x [km]'); grid on;
title('CW Position vs Time');
subplot(312);
plot(time, F(:,2)); ylabel('y [km]'); grid on;
subplot(313);
plot(time, F(:,3)); ylabel('z [km]'); xlabel('Time [s]'); grid on;