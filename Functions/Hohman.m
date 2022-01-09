function [dv1,dv2] = Hohman(a1,a2)
R_e = 6378;
mu = 398600;
r1 = a1+R_e;
r2 = a2+R_e;
dv1 = sqrt(mu/r1)*(sqrt(2*r2/(r1+r2))-1);
dv2 = -sqrt(mu/r2)*(sqrt(2*r1/(r1+r2))-1);
end

