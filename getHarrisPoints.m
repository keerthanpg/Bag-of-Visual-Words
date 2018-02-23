function [points] = getHarrisPoints(I, alpha, k)
% Finds the corner points in an image using the Harris Corner detection algorithm
% Input:
%   I:                      grayscale image
%   alpha:                  number of points
%   k:                      Harris parameter
% Output:
%   points:                    point locations
%
    % -----fill in your implementation here --------
[Ix,Iy] = imgradientxy(I);
%Ix=Ix-mean2(Ix);
%Iy=Iy-mean2(Iy);
Ixx=Ix.*Ix;
Iyy=Iy.*Iy;
Ixy=Ix.*Iy;
fil=ones(5);
[m,n]=size(I);
h11=conv2(Ixx,fil, 'same');
h22=conv2(Iyy,fil, 'same');
h12=conv2(Ixy,fil, 'same');
R=h11.*h22-h12.*h12-k*((h11+h22).*(h11+h22));
regionalMaxImage = imregionalmax(R, 8);
R=R.*regionalMaxImage;

[B,N]=maxk(R(:), alpha);
[i, j]=ind2sub([m,n],N);
points=[i,j];
    % ------------------------------------------

end