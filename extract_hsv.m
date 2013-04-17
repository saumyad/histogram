%Histogram equalizing the image with HSV manipulation.
%Image modifications are better handled by adjusting the brightness, hue
%and saturation of the image space.

%Here brightness is equalized to achieve contrast effect similar to that of
%grayscale equalization.

function extract_hsv()
I = imread('strawberry.jpg');
image_hsv = rgb2hsv(I);    %convert from RGB space to HSV space

%image_b is roughly equivalent to intensity(in terms of brightness)

image_b = image_hsv(:,:,3);

%image_b is of type double, although our image id unit8.
image_hsv(:,:,3) = histeq(image_b);     %perform histogram equalization on the brightness channel
                                        %the data written back on image_hsv
final = hsv2rgb(image_hsv);             %to RGB again

if(strcmp('uint8',class(I)))
    final = uint8(255.*final);
elseif(strcmp('uint16',class(I)))
    final = uint16(65535.*final);
end

imwrite(final,'hsv_final.jpg');