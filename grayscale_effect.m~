%Breaking out in rgb components and equalizing messes with the color
%relations of hues,saturation etc. The effect can be seen by comparing the 
%grayscaled images of original and the rgb_equalised image.

%The rgb image seem to have a distorted mix of black and white proportion.
%In the original, however the effect is smoothened.

function grayscale_effect()
gray_rgb = imread('rgb_result.jpg');
gray_orig = imread('strawberry.jpg');
gray_hsv = imread('hsv_final.jpg');

gray_rgb1 = rgb2gray(gray_rgb);
gray_orig1 = rgb2gray(gray_orig);
gray_hsv1 = rgb2gray(gray_hsv);

gray_rgbe = histeq(gray_rgb1);
gray_orige = histeq(gray_orig1);
gray_hsve = histeq(gray_hsv1);

%writing them

imwrite(gray_rgbe,'gray_rgb.jpg');
imwrite(gray_orige,'gray_orig.jpg');
imwrite(gray_hsve,'gray_hsv.jpg');

