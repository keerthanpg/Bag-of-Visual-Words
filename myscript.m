%filterbank=createFilterBank();
%img = imread('sun_abpxvcuxhqldcvln.jpg'); %tree
%img = imread('sun_aacyfyrluprisdrx.jpg');%bedroom
%img = imread('sun_agakaoibdnzsemzp.jpg');%auditorium
%img = imread('sun_abslhphpiejdjmpz.jpg');%campus
%img = imread('sun_aerinlrdodkqnypz.jpg');%kidairport




%response=extractFilterResponses(I,filterbank);

%imshow(response(:,:, 46:48))
%%getRandomPoints(I,20);
%I=RGB2Lab(img);
%I=rgb2gray(img);
%size(I)
%I(:,:,1)=im2double(I(:,:,1));
%normImage = im2double(I);
%Harris=getHarrisPoints(I(:,:,1),500,0.05);
%Random=getRandomPoints(I,500);

%imshow(img);
%hold on;
%plot(Harris(:,2), Harris(:,1), 'r*', 'LineWidth', 3, 'MarkerSize', 3);

imgPaths = importdata('../data/traintest.mat');
dictionary=getDictionary(imgPaths, 700, 200, 'harris');
save('dictionaryHarris.mat','dictionary');


