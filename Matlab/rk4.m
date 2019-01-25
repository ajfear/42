function [tout,yout] = rk4(ode,tspan,y0,options,varargin)

% Check inputs
if nargin < 4
  options = [];
  if nargin < 3
    y0 = [];
    if nargin < 2
      tspan = [];
      if nargin < 1
        error(message('MATLAB:rk4:NotEnoughInputs'));
      end  
    end
  end
else
    args = varargin;
    n = varargin{1};
    accel = varargin{2};
end

t0 = tspan(1);
tfinal = tspan(end);
ntspan = length(tspan);
h = tspan(2) - tspan(1);
neq = length(y0);

tout = zeros(ntspan,1);
yout = zeros(ntspan,neq);
nout = 1;
tout(nout) = t0;
yout(nout,:) = y0;

y = y0(:);
t = t0;
done = 0;
while ~done
    if h >= (tfinal - t)
%         h = tfinal - t;
        done = true;
    end
    
    f(:,1) = feval(ode,t,y,n,accel(nout,:));
    f(:,2) = feval(ode,t+h/2,y+f(:,1)*h/2,n,accel(nout,:));
    f(:,3) = feval(ode,t+h/2,y+f(:,2)*h/2,n,accel(nout,:));
    f(:,4) = feval(ode,t+h,y+f(:,3)*h,n,accel(nout,:));
    
    tnew = t + h;
    ynew = y + (f(:,1)+2*f(:,2)+2*f(:,3)+f(:,4))*h/6;
    
    nout = nout + 1;
    tout(nout) = tnew;
    yout(nout,:) = ynew;
    
    t = tnew;
    y = ynew;
end