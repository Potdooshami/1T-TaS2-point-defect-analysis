% refer to map(2,1) 
% xyxyr = [50 300 1000 200 100];
r = 100;
xyArr = [1 1;838 41;183 303;889 438] +[0;0;20;20];% row index:
xyDS = [17 33;10 31;11 32;18 33];
vFcss = [-600 -480 -60 0 130 200 520;
    -600 -380 -180 0 80 230 550];
thtSoD = -pi/2 + atan(sqrt(3)/7);
sclSoD = 4.2;
y_tipChange = 284;


xyT = table(xyArr );
xyT.Properties.RowNames = {'beforeC' 'beforeA'...
    'afterC' 'afterA'};
xyT.Properties.VariableNames ={'xy_crop'};
xyDST = table(xyDS);
xyT = [xyT xyDST];

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"onright"}
%---
