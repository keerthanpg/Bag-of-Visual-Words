function [points] = getRandomPoints(I, alpha)
% Generates random points in the image
% Input:
%   I:                      grayscale image
%   alpha:                  random points
% Output:
%   points:                    point locations
%
	% -----fill in your implementation here --------
[m,n,c]=size(I);
i = randi([1 m],1,alpha);
j = randi([1 n],1,alpha);
points=transpose([i;j]);

    

    % ------------------------------------------

end

