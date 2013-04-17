%function to extract red,green and blue 2-D array components of the image
%to be histogram equalised. The arrays are then merged and histogram
%equalised to form resultant image

function extract_rgb()

%Read the image data
image = imread('strawberry.jpg');

%Info regarding the type of image(rgb, indexed grayscale etc.)
whos image

red_channel = image(:,:,1);
green_channel = image(:,:,2);
blue_channel = image(:,:,3);        %components seperated in arrays

imwrite(red_channel,'orig_red.jpg');      %writing into seperate files the original components
imwrite(green_channel,'orig_green.jpg');
imwrite(blue_channel,'orig_blue.jpg');

red_hist = histeq(red_channel);     %using matlab built in function of equalization.
green_hist = histeq(green_channel);
blue_hist = histeq(blue_channel);

comb_hist = cat(3,red_hist,green_hist,blue_hist);   %combining the three histograms
imwrite(comb_hist,'rgb_result.jpg');
