%Using histogram and HSV operations to enhance color of a sample image
%(in this case red)

function enhance_red()
image = imread('strawberry.jpg');
hsv_image = rgb2hsv(image);         %convert to hsv plane

%observing the hues help observe the color proprtions
hplot = 360.*hsv_image(:,:,1);      %keeping the hue range [1-360]

bin_edges = 0:360;
N = histc(hplot(:),bin_edges);      %count the values within the bin_edges
hbar = bar(bin_edges(1:end-1),N(1:end-1),'histc'); %plot histogram

set(hbar, 'CData', 1:360, ...           %change colors of the plotted bars according to indexed color
            'CDataMapping', 'direct',... %color mapping and remove
            'EdgeColor','none');            %edge colors
        
colormap(hsv(360));            %change to hsv color map(360 points)       

axis([0 360 0 max(N)])          %change axes limits
xlabel('HSV HUE');              %add x and y labels
ylabel('Bin Counts');

%The plotted curve shows that the red coloured hue is mostly covered in the
%scale of 0-25 and 300-349 with some orange/black/white colors for the rest of the
%map.

no_red_region = (hplot > 15) & (hplot < 340);

%For contrasting out this color, the saturation level of rest of the pixels
%is set to zero.

splot = hsv_image(:,:,2);
splot(no_red_region) = 0;       %updating in the hsv image copy only

hsv_image(:,:,2) = splot;       %Hues remain unchanged
final = hsv2rgb(hsv_image);

%writing the file into..
imwrite(final,'enhance_final.jpg');

