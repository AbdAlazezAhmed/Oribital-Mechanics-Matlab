function dy = gravity(y,mu,args)
arguments
y
mu
args.drag = false
args.omega_e = []
args.C_d = []
args.A = []
args.R_e = []
args.m =[]
end
R = y(1:3);
V = y(4:6);
Rmag = norm(R);

RDOT = V;
if args.drag == true
    V_rel = V-cross([0;0;args.omega_e],R);
    rho = atmosphere(Rmag-args.R_e);
    VDOT = -mu * R / Rmag^3 - 1/2*rho*1000*norm(V_rel)*(args.C_d * args.A / args.m)*V_rel;
else
    VDOT = -mu * R / Rmag^3 ;
end
dy = [RDOT;VDOT];
end