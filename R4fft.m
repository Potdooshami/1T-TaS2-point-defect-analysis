function R = R4fft(sz)
idx_shouldbe_0 = floor(sz/2)+1;
x = (1:sz(1)) - idx_shouldbe_0(1);
y = (1:sz(2)) - idx_shouldbe_0(2);
[X,Y] = meshgrid(x,y);
X = X';Y = Y';
R = sqrt(X.^2 +Y.^2);
R = ifftshift(R);
end