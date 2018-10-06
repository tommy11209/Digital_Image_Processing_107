
im = imread('C:\Users\user\Desktop\Fig0427(a)(woman).tif');
im_dft = fft2(im);
mag = abs(im_dft);
phase = angle(im_dft);
phase = mat2gray(phase);
mag = mat2gray(mag);
figure;
imshow(mag,[]);
figure;
imshow(phase,[]);


