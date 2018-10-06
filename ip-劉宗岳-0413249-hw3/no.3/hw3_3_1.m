
im = imread('C:\Users\user\Desktop\Fig0427(a)(woman).tif');

[A, B] = size(im);

u = 0:(A-1);
v = 0:(B-1);

idx = find(u > A/2);
u(idx) = u(idx) - A;
idy = find(v > B/2);
v(idy) = v(idy) - B;
[V, U] = meshgrid(v, u);
D0 = 10;           % parameter, we can modified it
D1 = 30;
D2 = 100;

D = sqrt(U.^2 + V.^2);
Low0 = exp(-(D.^2)./(2*(D0^2)));
Low1 = exp(-(D.^2)./(2*(D1^2)));
Low2 = exp(-(D.^2)./(2*(D2^2)));


F=fft2(double(im));
g0 = Low0.*F;
g1 = Low1.*F;
g2 = Low2.*F;

image0 = real(ifft2(g0));
subplot(2,2,1), imshow(image0, []);
title('parameter D0 = 10');
image1 = real(ifft2(g1));
subplot(2,2,2), imshow(image1, []);
title('parameter D0 = 30');
image2 = real(ifft2(g2));
subplot(2,2,3), imshow(image2, []);
title('parameter D0 = 100');

