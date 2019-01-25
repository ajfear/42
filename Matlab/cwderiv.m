function xdot = cwderiv(~,x,w,u)
A = [zeros(3,3)     eye(3,3);
   3*w^2 0   0    0   2*w  0;
     0   0   0   -2*w  0   0;
     0   0 -w^2   0    0   0];
 
B = [0 0 0;
     0 0 0;
     0 0 0;
     1 0 0;
     0 1 0;
     0 0 1];
    
xdot = A*x + B*u';