ldos_conductance_Together__Constants
map = loadMapdt(2);
views(map.Zfinal0T)
colormap gray
sqpts = xyxyr(5)*[0 1 1 0 0;0 0 1 1 0] + (xyxyr([1 2]))';
sqpts = [sqpts [nan; nan] xyxyr(5)*[0 1 1 0 0;0 0 1 1 0] + (xyxyr([3 4]))'];
hold on
plot(sqpts(1,:),sqpts(2,:),'r')
hold off
f = gcf;
f.Position = [1 1 1800 900]
yline(y_tipChange,'g')
