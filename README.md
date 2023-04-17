# Oribital-Mechanics-Matlab
Some Orbital Mechanics Matlab Codes. Heavily based on the "Orbital Mechanics for Engineers, Howard D. Curtis" book.
## Orbit Initialization
---
You can initialize an Orbit in these ways depending on the available input/initial conditions:
* **$R_0$ and $V_0$**
* **Orbital Elements**
* **Two Line Elements *(TLE)***
* **Orbit Determination**
   * **GIBBS**

You must choose the method used to solve for future epochs from:
* **Kepler Equation**
* **Cowell Method**

You can specify the time-span of the calculation using the `dt` arguement

### Code Example
* An **Orbit** with **Orbital Elements** of the starting state and **Kepler Equation** as the solving method:
```matlab
orb1 = Orbit('OE','f(t)',r_p = 6700,r_a = 10000,...
    theta_0 = 230*pi/180, Omega_0 = 270*pi/180,i = 60*pi/180,...
    omega_0 = 45*pi/180, dt = 5.1610e5);
```

* An **Orbit** with **$R_0$ and $V_0$** of the starting state and **Cowell Method** as the solving method with **Atmospheric Drag** effect :
```matlab
orb2 = Orbit('RV','Cowell',drag = true,R_0 = [-3670,-3870,4400],V_0 = [4.7,-7.4,1], dt = 5.1610e5);
```

* An **Orbit** with **Two Line Elements *(TLE)*** of the starting state and **Kepler Equation** as the solving method:
```matlab
orb3 = Orbit('TLE','f(t)',drag = false,tle='ISS.txt', dt =  5.1610e5);
```

* An **Orbit** with **GIBBS** method used to determine the starting state and **Kepler Equation** as the solving method:
```matlab
orb4 = Orbit('GIBBS','f(t)',R1 = [-294.32,4265.1,4265.1],...
    R2 = [ -1365.5,3637.6,6346.8],R3 = [-2940.3,2473.7, 6555.8], dt = 5.1610e4);
```
## Solving Orbit
---
To solve the orbit problem call the `solveOrbit()` method
### Code Examples
```matlab
orb3 = orb3.solveOrbit();
```
## Plotting Ground Tracks
---
To plot the **Ground Tracks** use the `plot()` method

For 3D tracks use `plot3()` method
### Code Examples
For plotting **Ground Tracks**:
```matlab
orb3.plot();
```
![alt text](/Images/orb3_2d.jpg??raw=true "2D Ground track")

For plotting 3D tracks:
```matlab
orb3.plot3();
```
![alt text](/Images/orb3_3d.jpg??raw=true "2D Ground track")

## Orbit Perturbation
---
This code takes in consideration **J2** perturbation 
with optional terms being : 
- **Atmospheric Drag**

# Progress
### Todo

- [ ] Clean the class code
- [ ] Improve Orbit Transfer code, use the method in chapter 6, and write its Documentation

### Done ✓

- [x] Working code foundation *(tested on the textbook's examples)*.
