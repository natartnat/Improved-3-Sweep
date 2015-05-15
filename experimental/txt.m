
%% Read an image into the MATLAB® workspace.

% I  = imread('pic/sup.bmp');I = rgb2gray(I);
% I  = imread('pic/art.png');I = rgb2gray(I);
 I = imread('pic2/tubesharp.png');I = rgb2gray(I);I = imcomplement(I);
 rotI = I;
 figure,imshow(I);
% I = imread('circuit.tif');
%% For this example, rotate and crop the image using the imrotate function.
%rotI = imrotate(I,33,'crop');
%fig1 = imshow(rotI);

%% Find the edges in the image using the edge function.
% BW = edge(rotI,'canny');
% figure, imshow(BW);
BW = rotI;
%% Compute the Hough transform of the image using the hough function.
[H,theta,rho] = hough(BW);
%% Display the transform using the imshow function.
figure, imshow(imadjust(mat2gray(H)),[],'XData',theta,'YData',rho,...
        'InitialMagnification','fit');
xlabel('\theta (degrees)'), ylabel('\rho');
axis on, axis normal, hold on;
colormap(hot)

%% Find the peaks in the Hough transform matrix, H, using the houghpeaks function.
P = houghpeaks(H,5,'threshold',ceil(0.3*max(H(:))));
%% Superimpose a plot on the image of the transform that identifies the peaks.
x = theta(P(:,2));
y = rho(P(:,1));
plot(x,y,'s','color','black');

%% Find lines in the image using the houghlines function.
lines = houghlines(BW,theta,rho,P,'FillGap',5,'MinLength',7);
%% Create a plot that superimposes the lines on the original image.
figure, imshow(rotI), hold on
max_len = 0;

for k = 1:length(lines)
   xy = [line(k).point1; line(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end

% highlight the longest line segment
plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','red');

% % I = CVimage();
% % edgedata = CVedge(I,2,0.5,6);
% % CVhough(edgedata,[0 1],[0 1]);
% % CVunhough();
% % CVline();
% % % 
% % % [xx,yy,zz] = ndgrid(-100:100,-100:100,-100:100); 
% % % img = imread('..\NAT-Project\pic2\s1.png');
% % % img = xx.^2 + yy.^2 + zz.^2 < 99^2; 
% % % img = convn(img,ones(5,5,5)/(5*5*5)); 
% % % p = isosurface(img,0.5); 
% % % ph = patch(p); 
% % % set(gca,'visible','off') 
% % % axis equal 
% % % texture = imread('autumn.tif'); 
% % % patchTexture(ph,texture) 
% % % view(58,82)

% I = imread('cameraman.tif');
% imshow(I);
% H = fspecial('disk',3);
% blurred = imfilter(I,H,'replicate');
% imshow(blurred);
% regionprops(blurred)
%
%% test area
% clear all ;close all;clc
% %  BW = imread('pic2/square2.jpg');
% % s  = regionprops(BW, 'BoundingBox');
% % centroids = cat(1, s.BoundingBox);
% % imshow(BW)
% % hold on
% % plot(centroids(1,1), centroids(1,2), 'b*')
% % hold off
% 
% clc;    % Clear the command window.
% close all;  % Close all figures (except those of imtool.)
% clear;  % Erase all existing variables. Or clearvars if you want.
% workspace;  % Make sure the workspace panel is showing.
% format long g;
% format compact;
% fontSize = 20;
% % Read in a color demo image.
% folder = 'C:\Users\Explorer\Documents';
% baseFileName = 'a_ASL3.jpg';
% % Get the full filename, with path prepended.
% fullFileName = fullfile(folder, baseFileName);
% if ~exist(fullFileName, 'file')
% 	% Didn't find it there.  Check the search path for it.
% 	fullFileName = baseFileName; % No path this time.
% 	if ~exist(fullFileName, 'file')
% 		% Still didn't find it.  Alert user.
% 		errorMessage = sprintf('Error: %s does not exist.', fullFileName);
% 		uiwait(warndlg(errorMessage));
% 		return;
% 	end
% end
% grayImage=imread(fullFileName);
% % Get the dimensions of the image.  
% % numberOfColorBands should be = 1.
% [rows, columns, numberOfColorBands] = size(grayImage);
% if numberOfColorBands > 1
% 	% It's not really gray scale like we expected - it's color.
% 	% Convert it to gray scale by taking only the green channel.
% 	grayImage = grayImage(:, :, 2); % Take green channel.
% end
% % Display the original gray scale image.
% subplot(2, 2, 1);
% imshow(grayImage, []);
% axis on;
% title('Original Grayscale Image', 'FontSize', fontSize);
% % Enlarge figure to full screen.
% set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
% % Give a name to the title bar.
% set(gcf, 'Name', 'Demo by ImageAnalyst', 'NumberTitle', 'Off') 
% binaryImage = grayImage < 128;
% % Display the image.
% subplot(2, 2, 2);
% imshow(binaryImage, []);
% title('Binary Image', 'FontSize', fontSize);
% % Label the image
% labeledImage = bwlabel(binaryImage);
% measurements = regionprops(labeledImage, 'BoundingBox', 'Area');
% for k = 1 : length(measurements)
%   thisBB = measurements(k).BoundingBox;
%   rectangle('Position', [thisBB(1),thisBB(2),thisBB(3),thisBB(4)],...
%   'EdgeColor','r','LineWidth',2 )
% end
% % Let's extract the second biggest blob - that will be the hand.
% allAreas = [measurements.Area];
% [sortedAreas, sortingIndexes] = sort(allAreas, 'descend');
% handIndex = sortingIndexes(2); % The hand is the second biggest, face is biggest.
% % Use ismember() to extact the hand from the labeled image.
% handImage = ismember(labeledImage, handIndex) 
% % Now binarize
% handImage = handImage > 0;
% % Display the image.
% subplot(2, 2, 3);
% imshow(handImage, []);
% title('Hand Image', 'FontSize', fontSize);

%% test 2
clear all;close all
img = imread('pic2/renderboxe.jpg');
figure,imshow(img)
hold on
Xc= round(size(img,2)/2); %Center for x
Yc = round(size(img,1)/2); %Center for y
R = 50; %This is the radius
x=0:0.01:1; %degree
circle=plot(Xc+R*cos(2*pi*x),Yc+R*sin(2*pi*x),'Color','g','LineWidth',0.2); 