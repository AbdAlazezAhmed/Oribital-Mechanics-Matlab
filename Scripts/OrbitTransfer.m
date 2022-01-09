[x, fx, exitflag] = fminbnd('minTransfer', 0, 9999999999999); %%Must be bounded
disp(['Optimal BiElliptic transfer: rb=',num2str(x),...
    'km, total Velocity change = ',num2str(fx),'km/s'])
[dv1,dv2]=Hohman(s,f);
disp(['Hohmann total Velocity change: ',num2str(abs(dv1)+abs(dv2)),'km/s']);
[dv1,dv2,dv3]=BiElliptic(s,b,f);
disp(['BiElliptic total Velocity change: ',...
    num2str(abs(dv1)+abs(dv2)+abs(dv3)),'km/s']);
