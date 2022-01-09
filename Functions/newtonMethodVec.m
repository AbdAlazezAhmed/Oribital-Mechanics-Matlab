function E = newtonMethodVec(e,M,error)
%NEWTONMETHODVEC Summary of this function goes here
%   Detailed explanation goes here
if M < pi
E = M + e/2;
else
E = M - e/2;
end
ratio = 1;
while abs(ratio) > error
ratio = (E - e*sin(E) - M)./(1 - e*cos(E));
E = E - ratio;
end
end %kepler_E

