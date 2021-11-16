clear
GRAY = rgb2gray(im2double(imread('64\file6.png')));
[height, width] = size(GRAY);
figure, imshow(GRAY);              
D = dft_2d(GRAY, height, width);
E = idft_2d(D, height, width);
figure, imshow(E);