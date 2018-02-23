% evaluateRecognitionSystem.m
% This script evaluates nearest neighbour recognition system on test images
% load traintest.mat and classify each of the test_imagenames files.
% Report both accuracy and confusion matrix
%visionSet=load('visionRandom.mat');
%visionSet=visionSet.visionRandom;

visionSet=load('visionHarris.mat');
visionSet=visionSet.visionHarris;

source='../data/'
traintest=load('traintest.mat')
N=size(traintest.test_imagenames);
method='chisq';
dictionarySize=200;
filterBank = visionSet.filterBank;
dictionary = visionSet.dictionary;
trainFeatures=visionSet.trainFeatures;
trainLabels=visionSet.trainLabels;
correct=0
wrong=0
confusion=zeros(8);
for i = 1:1:N(1,2)
    I=imread(strcat(source,char(traintest.test_imagenames(1,i))));
    wordMap=getVisualWords(I, dictionary, filterBank);
    hist=getImageFeatures(wordMap, dictionarySize);
    [M,Index]= min(getImageDistance(hist, trainFeatures, method));
    Index
    predictedLabel=trainLabels(1,Index);
    targetLabel=traintest.test_labels(1,i);
    confusion(predictedLabel, targetLabel)=confusion(predictedLabel, targetLabel)+1;
    if(targetLabel==predictedLabel)
        correct= correct+1;
    else
        wrong=wrong+1;
    end
      
end
correct
wrong
accuracy=correct/(correct+wrong)
confusion
