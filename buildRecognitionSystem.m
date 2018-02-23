% buildRecognitionSystem.m
% This script loads the visual word dictionary (in dictionaryRandom.mat or dictionaryHarris.mat) and processes
% the training images so as to build the recognition system. The result is
% stored in visionRandom.mat and visionHarris.mat.


%{

dict=load('dictionaryRandom.mat');
filters=load('filterBank_random.mat');
traintest=load('../data/traintest.mat');
visionRandom=struct;
visionRandom.dictionary=dict.dictionary
dictionarySize=size(dict.dictionary);
dictionarySize=dictionarySize(1,1)
visionRandom.filterBank=filters.filterBank;
visionRandom.trainLabels=traintest.train_labels;
N=size(traintest.train_imagenames);
trainFeatures=zeros(N(2),dictionarySize);
source='../data/random/';
for i=1:1:N(2)
    i
    name=char(traintest.train_imagenames(1,i));
    name=strcat(name(1,1:end-3), 'mat');    
    wordMap=load(strcat(source,name));    
    trainFeatures(i, :)=getImageFeatures(wordMap.wordMap, dictionarySize); 
    
    
end
size(trainFeatures)
visionRandom.trainFeatures=trainFeatures;
save('visionRandom.mat', 'visionRandom');
%}

dict=load('dictionaryHarris.mat');
filters=load('filterBank_harris.mat');
traintest=load('../data/traintest.mat');
visionHarris=struct;
visionHarris.dictionary=dict.dictionary
dictionarySize=size(dict.dictionary);
dictionarySize=dictionarySize(1,1)
visionHarris.filterBank=filters.filterBank;
visionHarris.trainLabels=traintest.train_labels;
N=size(traintest.train_imagenames);
trainFeatures=zeros(N(2),dictionarySize);
source='../data/harris/';
%IDF=load('IDF.mat');
%IDF=IDF.IDF;
for i=1:1:N(2)
    i
    name=char(traintest.train_imagenames(1,i));
    name=strcat(name(1,1:end-3), 'mat');    
    wordMap=load(strcat(source,name));    
    %trainFeatures(i, :)=getImageFeatures_IDF(wordMap.wordMap, dictionarySize, IDF); 
    trainFeatures(i, :)=getImageFeatures(wordMap.wordMap, dictionarySize); 
end
size(trainFeatures)
visionHarris.trainFeatures=trainFeatures;
%save('visionHarris_IDF.mat', 'visionHarris');
save('visionHarris.mat', 'visionHarris');
