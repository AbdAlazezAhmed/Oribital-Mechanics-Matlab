function [dv1,dv2,dv3] = BiElliptic(d1,d2,d3)
R_e = 6378;
mu = 398600;
r1 = R_e + d1;
rb = R_e + d2;
r2 = R_e + d3;
a1 = (r1+rb)/2;
a2 = (r2+rb)/2;
dv1 = sqrt(mu*(2/r1-1/a1))-sqrt(mu/r1);
dv2 = sqrt(mu*(2/rb-1/a2))-sqrt(mu*(2/rb-1/a1));
dv3 = sqrt(mu*(2/r2-1/a2))-sqrt(mu/r2);
end

