function [dictionary] = getDictionary(imgPaths, alpha, K, method)
% Generate the filter bank and the dictionary of visual words
% Inputs:
%   imgPaths:        array of strings that repesent paths to the images
%   alpha:          num of points
%   K:              K means parameters
%   method:         string 'random' or 'harris'
% Outputs:
%   dictionary:         a length(imgPaths) * K matrix where each column
%                       represents a single visual word
    % -----fill in your implementation here --------

    filterBank=createFilterBank();
    save('filterBank.mat','filterBank');
    if(strcmp(method, 'harris')) 
        save('filterBank_harris.mat','filterBank');
    else
        save('filterBank_random.mat','filterBank');
    end 
    N=length(imgPaths.train_imagenames)
    pixelResponses=[];
    
              
    for i=1:1:N
        i  
        char(imgPaths.train_imagenames(i))
        img=imread(strcat('../data/', char(imgPaths.train_imagenames(i))));
        if length(size(img)) == 2
            tmp = img;
            img(:,:,1) = tmp;
            img(:,:,2) = tmp;
            img(:,:,3) = tmp;
        end
        filterResponses=extractFilterResponses(img, filterBank);
        n3=size(filterResponses)
        img_feature=zeros(alpha,n3(1,3));       
        
        if(strcmp(method, 'harris')) 
            points=getHarrisPoints(rgb2gray(img),alpha,0.05);
            "doing harris"
        else
            points=getRandomPoints(rgb2gray(img),alpha);
        end        
        for j=1:1:alpha
            img_feature(j,:)=filterResponses(points(j,1),points(j,2),:);        
        end         
        pixelResponses=[pixelResponses; img_feature];
        %size(pixelResponses)         
    end
    % ------------------------------------------
    [~, dictionary] = kmeans(pixelResponses, K, 'EmptyAction', 'drop');
end
