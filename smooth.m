%Smoothing function to compare smoothened versions of images--- better
%perpective

function[filt_image] =  smooth(image)      %input image to be smoothed Gaussian filter

f2 = fspecial('gaussian',3);
filt_image = imfilter(image,f2);