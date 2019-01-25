load('..\SWARMS\time.42');
load('..\SWARMS\PosEH00.42');
load('..\SWARMS\VelEH00.42');
% load('..\SWARMS\accel.42');

F = [load('..\SWARMS\PosEH00.42') ...        
     load('..\SWARMS\VelEH00.42')]/1000;     % [km km/s]

n = sqrt(3.98604e5/6978.145^3);
x0 = F(1,:)';
t = time(1:end);
% [~,r] = ode45(@nlcirc,t,x0,[],6978.145);
[~,r] = rk4(@cwderiv, t, x0, [], n, zeros(length(time),3)/1000);
% r = r(1:10:end,:);
x = (-2:0.01:0)';
y = [sqrt(1 - (x+1).^2); -sqrt(1 - (x(end-1:-1:1)+1).^2)];
x = [x; x(end-1:-1:1)];
z = zeros(401,1);

%% Plot
figure(1);
plot3(x,y,z); hold on
axis([-2 0.1 -1 1 -0.1 0.1])
% plot3(r(:,1)/6978,r(:,2)/6978,r(:,3)/6978)
plot3(F(:,1)/6978,F(:,2)/6978,F(:,3)/6978);

figure(2);
subplot(311);
plot(t,r(:,1)-F(:,1));
subplot(312);
plot(t,r(:,2)-F(:,2));
subplot(313);
plot(t,r(:,3)-F(:,3));