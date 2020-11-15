clear; clc; close all;

img = imread('cloud.jpg');
img = rgb2gray(img);
[row, col] = size(img);
img(img < 100) = 0;
img(img >= 100) = 255;

img(1:200,:) = 0;
img(800:1001,:) = 0;
img(:,1:100) = 0;
img(:,900:1001) = 0;

h = fspecial('gaussian',[3,3],6);
img = imfilter(img,h);

for i=1:1001
    for j = 1:1001
        if sqrt((i-500)^2 + (j-500)^2) > 500
            img(i,j) = 255;
        end
    end
end
h = fspecial('gaussian',[3,3],6);
imshow(img)
