function [r,c,cinmx]=corners(I1,w,t)
I=im2double(rgb2gray(I1));
sigma=1;
g=fspecial('gaussian',[w,w],sigma);
vert_mask=[-1 0 1;-2 0 2;-1 0 1]*0.25;
horz_mask=[-1 -2 -1; 0 0 0 ;1 2 1]*0.25;
k=0.04;
Ix=conv2(I,vert_mask,'same');
Iy=conv2(I,horz_mask,'same');
Ix2 = Ix.* Ix; % get Ix to the power of two
Iy2 = Iy.* Iy; % get Iy to the power of two
Ixy = Ix .* Iy; %get the Ixy by multiply Ix and Iy

% Apply the gaussian filter to the the arguments
Ix2 = conv2(Ix2,g);
Iy2 = conv2(Iy2,g);
Ixy = conv2(Ixy,g);

% Enetr the arguments into the formula
C = (Ix2 .* Iy2) - (Ixy.^2) - 0.04 * ( Ix2 + Iy2 ).^ 2;
thresh = t;
radius = 1;
sze = 2*radius + 1;                   % Size of dilation mask
mx = ordfilt2(C, sze^2, ones(sze));      % Grey-scale dilate

% Make mask to exclude points on borders
bordermask = zeros(size(C));
bordermask(radius+1:end-radius, radius+1:end-radius) = 1;

% Find maxima, threshold, and apply bordermask
cimmx = (C==mx) & (C>thresh) & bordermask;
[r, c] = find(cimmx);     % Return coordinates of corners
%This section tends to do non max suppression


end