close all; clear all; clc;
[x1,map]=imread('image1.jpg');
BW1 = im2bw(x1,map,0.465);
subplot(3,2,1), imshow(x1,map)
title('Before Binarize image1.jpg')
subplot(3,2,2), imshow(BW1)
title('After Binarize image1.jpg')
numberOfPixels = numel(BW1);
numberOfTruePixels = sum(BW1(:));
martenzyt1=(numberOfTruePixels/numberOfPixels*100);

[x2,map]=imread('image2.jpg');
BW2 = im2bw(x2,map,0.465);
subplot(3,2,3), imshow(x2,map)
title('Before Binarize image2.jpg')
subplot(3,2,4), imshow(BW2)
title('After Binarize image2.jpg')
numberOfPixels = numel(BW2);
numberOfTruePixels = sum(BW2(:));
martenzyt2=(numberOfTruePixels/numberOfPixels*100);

[x3,map]=imread('image3.jpg');
BW3 = im2bw(x3,map,0.465);
subplot(3,2,5), imshow(x3,map)
title('Before Binarize image3.jpg')
subplot(3,2,6), imshow(BW3)
title('After Binarize image3.jpg')
numberOfPixels = numel(BW3);
numberOfTruePixels = sum(BW3(:));
martenzyt3=(numberOfTruePixels/numberOfPixels*100);

fprintf('martenzyt stanowi: %.2f%%\n',martenzyt1)
fprintf('martenzyt stanowi: %.2f%%\n',martenzyt2)
fprintf('martenzyt stanowi: %.2f%%\n',martenzyt3)
