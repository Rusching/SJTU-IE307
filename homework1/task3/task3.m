clear
image1 = rgb2gray(im2double(imread('64\file1.png')));
image2 = rgb2gray(im2double(imread('64\file2.png')));

% 2 images' size are the same
[height, width] = size(image1);

figure, imshow(image1)
figure, imshow(image2)

% perform DFT for 2 images

inter1 = dft_2d(image1, height, width);
inter2 = dft_2d(image2, height, width);

% extract the amplitude and phase of 2 images

abs1 = abs(inter1);
angle1 = angle(inter1);
abs2 = abs(inter2);
angle2 = angle(inter2);

% keep origin amplitude but exchange the phase 

t1 = abs1.*cos(angle2) + abs1.*sin(angle2).*1i;
t2 = abs2.*cos(angle1) + abs2.*sin(angle1).*1i;

% perform IDFT for 2 images

t1 = idft_2d(t1, height, width);
t2 = idft_2d(t2, height, width);

figure, imshow(t1)
figure, imshow(t2)
