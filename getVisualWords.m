function [wordMap] = getVisualWords(I, dictionary, filterBank)
% Convert an RGB or grayscale image to a visual words representation, with each
% pixel converted to a single integer label.   
% Inputs:
%   I:              RGB or grayscale image of size H * W * C
%   filterBank:     cell array of matrix filters used to make the visual words.
%                   generated from getFilterBankAndDictionary.m
%   dictionary:     matrix of size 3*length(filterBank) * K representing the
%                   visual words computed by getFilterBankAndDictionary.m
% Outputs:
%   wordMap:        a matrix of size H * W with integer entries between
%                   1 and K

    % -----fill in your implementation here --------
    
    if length(size(I)) == 2
            tmp = I;
            I(:,:,1) = tmp;
            I(:,:,2) = tmp;
            I(:,:,3) = tmp;
    end
    [m,n,c]=size(I);
    wordMap=zeros(m,n);
    filterResponses=extractFilterResponses(I, filterBank);
    %size(filterResponses)
    for i=1:1:n        
        D = pdist2(reshape(filterResponses(:,i,:), [],60),dictionary);         
        [M,wordMap(:,i)]=min(D,[],2); 
    end    
    % ------------------------------------------
end
