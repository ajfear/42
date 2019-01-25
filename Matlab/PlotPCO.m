%% Load Relative Positions
load('..\SWARMS\time.42');
PosEH = load('..\SWARMS\PosEH00.42')/1000;
VelEH = load('..\SWARMS\VelEH00.42')/1000;

%% Calculate PCO variables
a0 = 6978.145;
n = sqrt(3.98604e5/a0^3);
x0 = PosEH(1,1);
y0 = PosEH(1,2);
z0 = PosEH(1,3);
vx0 = VelEH(1,1);
vy0 = VelEH(1,2);
vz0 = VelEH(1,3);
px = sqrt(vx0^2 + n^2*x0^2)/n;
py = y0 - 2*vx0/n;
pz = sqrt(vz0^2 + n^2*z0^2)/n;
ax = atan2(n*x0,vx0);
az = atan2(n*z0,vz0);

% Create reference orbit
x = (-2:0.01:0)';
y = [sqrt(1 - (x+1).^2); -sqrt(1 - (x(end-1:-1:1)+1).^2)];
x = [x; x(end-1:-1:1)];
z = zeros(401,1);

%% Plot
figure(1);
plot3(x,y,z); hold on
axis([-2 0.1 -1 1 -0.1 0.1])
plot3(PosEH(:,1)/a0, PosEH(:,2)/a0, PosEH(:,3)/a0);
title('PCO Orbit'); xlabel('x/a_0'); ylabel('y/a_0'); zlabel('z/a_0');
legend('Reference Orbit', 'PCO', 'Location', 'Best');

figure(2);
subplot(221);
plot(PosEH(:,1)/a0, PosEH(:,2)/a0);
subplot(222);
plot(PosEH(:,1)/a0, PosEH(:,3)/a0);
subplot(223);
plot(PosEH(:,2)/a0, PosEH(:,3)/a0);
subplot(224);
plot3(PosEH(:,1)/a0, PosEH(:,2)/a0, PosEH(:,3)/a0);