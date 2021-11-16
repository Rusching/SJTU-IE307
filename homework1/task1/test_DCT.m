clear
GRAY = rgb2gray(im2double(imread('64\file1.png')));
[height, width] = size(GRAY);
figure, imshow(GRAY);              
D = dct_2d(GRAY, height, width);   
figure, imshow(D)
E = idct_2d(D, height, width);
figure, imshow(E);
