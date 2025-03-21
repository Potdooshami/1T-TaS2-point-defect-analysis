% xyxyr = [50 300 1000 200 100]
% 
% ldos_c(xyxyr);

function ldos_conductance_Together_predeclare(xyxyr)
map = loadMapdt(2);
views(map.Zfinal0T)
colormap gray
sqpts = xyxyr(5)*[0 1 1 0 0;0 0 1 1 0] + (xyxyr([1 2]))';
sqpts = [sqpts [nan; nan] xyxyr(5)*[0 1 1 0 0;0 0 1 1 0] + (xyxyr([3 4]))'];
hold on
plot(sqpts(1,:),sqpts(2,:),'r')
hold off
end