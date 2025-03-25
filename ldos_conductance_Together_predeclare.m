close all

ldos_conductance_Together__Constants
map = loadMapdt(2);
Z = map.Zfinal0T;
views(Z)
colormap gray
sqpts_0 = [r;r].*[0 1 1 0 0;0 0 1 1 0];
boxClrs = ["r" "r" "b" "b"];
hold on
for ind = 1:size(xyT,1)
    sqpts = sqpts_0 + (xyT{ind,1})';    
    plot(sqpts(1,:),sqpts(2,:),boxClrs(ind),LineWidth=3)    
end
hold off
f = gcf;
f.Position = [1 1 1800 900]
yline(y_tipChange,'g', "Tip Change",LineWidth=5)
title('New Crop Window')

f2 =figure(2)
f2.Position = [50 50 1000 900];
msb =2;nsb=2
psb = 0
for ind = 1:2;
    for jnd = 1:nsb
        psb = psb + 1;
        ind_xyT = mod(psb+2-1,msb*nsb)+1;
        sbs(ind,jnd) = subplot(msb,nsb,psb);
        ax = sbs(ind,jnd);
        xrng = (0:r) + xyT{ind_xyT,1}(1);
        yrng = (0:r) + xyT{ind_xyT,1}(2);        
        Zcrop = Z(xrng,yrng);
        views(Zcrop)
        title(xyT.Row{ind_xyT})
        colormap gray
        ax.XColor = boxClrs(ind_xyT)
        ax.YColor = boxClrs(ind_xyT)
        ax.LineWidth =5;
        xticks([])
        yticks([])
        SoD.draw(xyT{ind_xyT,2},sclSoD,thtSoD,1)
    end
end
sgtitle('SoD Registration')
