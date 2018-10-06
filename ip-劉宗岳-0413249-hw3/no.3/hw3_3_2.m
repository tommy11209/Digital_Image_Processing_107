
im = imread('C:\Users\user\Desktop\Fig0427(a)(woman).tif');
%subplot(2,1,1);
%imshow(im);
pad_im = padarray(im,[150, 150],'both');
pad_im_dft = fft2(pad_im);
%subplot(2,1,2);
%imshow(pad_im);
[A, B] = size(pad_im_dft);

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

Low = exp(-(D.^2)./(2*(D0^2)));
Low1 = exp(-(D.^2)./(2*(D1^2)));
Low2 = exp(-(D.^2)./(2*(D2^2)));

g = Low.*pad_im_dft;
g1 = Low1.*pad_im_dft;
g2 = Low2.*pad_im_dft;

image = real(ifft2(g));
image1 = real(ifft2(g1));
image2 = real(ifft2(g2));
subplot(2,2,1);
imshow(image, []);
title('parameter D0 = 10');
subplot(2,2,2);
imshow(image1, []);
title('parameter D0 = 30');
subplot(2,2,3);
imshow(image2, []);
title('parameter D0 = 100');


