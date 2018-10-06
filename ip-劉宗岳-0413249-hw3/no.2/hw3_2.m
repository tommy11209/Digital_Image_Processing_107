
im = imread('C:\Users\user\Desktop\Fig0427(a)(woman).tif');
im_dft = fft2(im);

im_dft_center = fftshift(im_dft);

mag = abs(im_dft_center);
phase = angle(im_dft_center);

phase = mat2gray(phase);
mag = mat2gray(mag);
figure;
imshow(mag,[]);
figure;
imshow(phase,[]);


