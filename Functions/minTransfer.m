function fx = minTransfer(rb)
[dv1,dv2,dv3]=BiElliptic(300 ,rb,(300+6378)*7-6378);
fx = abs(dv1)+abs(dv2)+abs(dv3);
end

