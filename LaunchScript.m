clear all
close all
%% Defining Orbits
%{
    Orbits can be defined with input as follows:
    'OE'    --> Orbital Eleents
    'RV'    --> R and V Vectors
    'TLE'   --> Two Line Elements of the object
    'GIBBS' --> Gibbs method with 3 R vectors

    Supported Orbit Propagation methods are:
    'f(t)'  --> as in Chapter 3
    'Cowell'--> as in Chapter 10 using integration
    *Only Cowell support Drag effect
    **f(t) is the fastest method due to vectorization and pagenation
%}
orb1 = Orbit('OE','f(t)',r_p = 6700,r_a = 10000,...
    theta_0 = 230*pi/180, Omega_0 = 270*pi/180,i = 60*pi/180,...
    omega_0 = 45*pi/180, dt = 5.1610e5);
orb2 = Orbit('RV','f(t)',R_0 = [-3670,-3870,4400],V_0 = [4.7,-7.4,1], dt = 5.1610e5);
orb3 = Orbit('TLE','f(t)',drag = false,tle='ISS.txt', dt =  5.1610e5);
orb4 = Orbit('GIBBS','f(t)',R1 = [-294.32,4265.1,4265.1],...
    R2 = [ -1365.5,3637.6,6346.8],R3 = [-2940.3,2473.7, 6555.8], dt = 5.1610e4);

%%Orbit Propagation
orb1 = orb1.solveOrbit();
orb2 = orb2.solveOrbit();
orb3 = orb3.solveOrbit();
orb4 = orb4.solveOrbit();
%%Plotting
%{
    These functions are a shortcut to plot on new figures, they can be
    modified to fit them in a single figure but I had no need to do so as I
    was working on a single orbit at a time
%}
orb1.plot3();
orb1.plot();
orb2.plot3();
orb2.plot();
orb3.plot3();
orb3.plot();
orb4.plot3();
orb4.plot();
%% Solve for drag over orbit as in Chapter 10
orb = Orbit('OE','Cowell',drag = true,r_p = 65930,r_a = 7317,...
    theta_0 = 332*pi/180, Omega_0 = 350*pi/180,i = 65.1*pi/180,...
    omega_0 = 58*pi/180, dt = 60*60*24*130);
orb = orb.solveOrbit();
%% Run Orbit transfere script
s=7000;
f=105000;
b=210000;
%%To change the optimal start and end 'r' change it inside the function
OrbitTransfer