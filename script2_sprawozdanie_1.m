close all; clear all; clc;
[x,map]=imread('image1.jpg');
%imshow(x,map);
%SE = ones(4,4); % elemenet strukturujacy
% BW2 = imilate(x, SE) %wykonanie erozji obrazu
%imshow(X);
xmin=min(x(:)) % sprawdzanie najjaśniejszego piksela
xmax=max(x(:)) % sprawdzanie najciemniejszego piksela
BW1 = im2bw(x,map,0.465);
figure, imhist(BW); title(['Histogram' , 'image1.jpg']); grid on;
