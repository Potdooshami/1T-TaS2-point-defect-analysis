function f = plt_Fourier_filtered_synthesis(Z,bin)

if ~isequal(size(Z), size(bin))
    error('Input vectors v1 and v2 must have the same size.');
end
fZ = fft2(Z);

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

% real space raw
ax_raw_real = sbs(1,1);
f.CurrentAxes = ax_raw_real;
views(Z)
colormap(gray)
titlet('real space')

% reciprocal space
f.CurrentAxes = sbs(1,2)
views(abs(fftshift(fZ)))
% climsc([0 .001]).Minmax
titlet('FFT')

% fftMask
f.CurrentAxes = sbs(1,3)
% bin = ~ftCirc(size(Z),30)&ftCirc(size(Z),60)
views(fftshift(bin))
titlet('FFT mask')

% maksedFFT
f.CurrentAxes = sbs(2,3)
mskedFFT = fZ.*bin;
abmskedFFT = abs(mskedFFT)
viewst(abmskedFFT)
sbs(2,3).CLim = sbs(1,2).CLim


f.CurrentAxes = sbs(2,2)
ffiltZ = ifft2(mskedFFT)
views(ffiltZ)

f.CurrentAxes = sbs(2,1)
views(Z-ffiltZ)
end

function titlet(str)
title(str)
ax = gca;
ax.Tag = str;
end

function viewst(img)
views(fftshift(img))
end