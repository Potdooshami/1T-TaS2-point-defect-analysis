    close all
clearvars -except mapCD
load RawData\'1T-TaS2(point defect)'\lattCoord.mat %[output:6669320c]
addpath myFunction\myftn\
fn = 'RawData\1T-TaS2(point defect)\mapCD.mat';
loadif(fn);
addpath ..\..\..\gitTmp\
addpath D:\github\climsc\clim-scaling-Robust-Standard-Minmax\
%%
%[text] ## Masked FFT filter
%[text] ### Cal
iph = 1
Z = mapCD.dt(iph).Z;
fZ = fft2(Z);

%%
plt_Fourier_filtered_synthesis(Z,true(size(Z)))
%%
%[text] ### graphic
f_maskedFFT = figure(3);
f= f_maskedFFT;
msb = 2;
nsb = 3;
p = 0;
for isb = 1:msb
    for jsb = 1:nsb
        p = p + 1;
        sbs(isb,jsb)=subplot(msb,nsb,p)
    end
end
sgtitle('filtered FFT')
%[text] #### real space raw
ax_raw_real = sbs(1,1);
f.CurrentAxes = ax_raw_real;
views(Z)
colormap(gray)
hold on
lattCoord.dt(iph).pBases
hold off
titlet('real space')
%[text] #### reciprocal space
f.CurrentAxes = sbs(1,2)
views(abs(fftshift(fZ)))
climsc([0 .001]).Minmax
titlet('FFT')
%[text] #### fftMask
f.CurrentAxes = sbs(1,3)
bin = ~ftCirc(size(Z),30)&ftCirc(size(Z),60)
views(fftshift(bin))
titlet('FFT mask')
%[text] maksedFFT
f.CurrentAxes = sbs(2,3)
mskedFFT = fZ.*bin;
% views(bin)
abmskedFFT = abs(mskedFFT)
viewst(abmskedFFT)
sbs(2,3).CLim = sbs(1,2).CLim
%[text] 

f.CurrentAxes = sbs(2,2)
ffiltZ = ifft2(mskedFFT)
views(ffiltZ)
%[text] 
f.CurrentAxes = sbs(2,1)
views(Z-ffiltZ)
%%
f.Visible = "on"
f.Position = [0 0 1500 900]
%%
ffndpk =  figure(2)
ffndpk.Visible = "on"
affz = abs(fftshift(fZ));
views(abs(fftshift(fZ)))
climsc([0 .01]).Minmax
%%
baffz =  imregionalmax(imgaussfilt(affz,5),8)
% views(baffz)

views(affz>max(max(affz))*.0014)
% colormap gray
%%
% close all
% f = qvisFFT(Z)
% f.CurrentAxes = findobj(f,'tag','abs')
% climsc([0 .01]).Minmax
%%


%%

function bin = ftCirc(sz,r)
x = (1:sz(1)) - floor(1+sz(1)/2);
y = (1:sz(2)) - floor(1+sz(2)/2);
[X,Y]=meshgrid(x,y);
X = X';Y=Y';
R = sqrt(X.^2+y.^2);
R = ifftshift(R);
bin = R<r;
end
%%
function f = qvisFFT(raw)
f = figure()
f.Visible ="on";
tns = ["abs" "phase" "real" "imag"];
fcns = {@abs @angle @real @imag};
cmaps = ["gray","hsv","gray","gray"]
p = 0;
for ind = 1:2
    for jsb = 1:2
        p = p + 1;
        sbs(p) = subplot(2,2,p);
        title(tns(p));        
        views(fftshift(fcns{p}(fft2(raw))));
        title(tns(p));
        ax = gca();ax.Tag = tns(p);
        colormap(sbs(p),cmaps(p));
        colorbar;
    end
end
end
%[text] 
function titlet(str)
title(str)
ax = gca;
ax.Tag = str;
end
%[text] 
function viewst(img)
views(fftshift(img))
end

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"onright","rightPanelPercent":40}
%---
%[output:6669320c]
%   data: {"dataType":"error","outputData":{"errorType":"runtime","text":"Error using <a href=\"matlab:matlab.lang.internal.introspective.errorDocCallback('load')\" style=\"font-weight:bold\">load<\/a>\nRawData\\1T-TaS2(point defect)\\lattCoord.mat is not found in the current folder or on the MATLAB path, but exists in:\n    D:\\od\\OneDrive\\matlab\n\n<a href = \"matlab:internal.matlab.desktop.commandwindow.executeCommandForUser('cd ''D:\\od\\OneDrive\\matlab''')\">Change the MATLAB current folder<\/a> or <a href = \"matlab:internal.matlab.desktop.commandwindow.executeCommandForUser('addpath ''D:\\od\\OneDrive\\matlab''')\">add its folder to the MATLAB path<\/a>."}}
%---
