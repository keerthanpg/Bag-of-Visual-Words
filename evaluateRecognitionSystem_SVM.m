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
size(trainFeatures)
trainLabels=visionSet.trainLabels;
correct=0
wrong=0
confusion=zeros(8);
testFeatures=[];
%{
for i = 1:1:N(1,2)
    I=imread(strcat(source,char(traintest.test_imagenames(1,i))));
    wordMap=getVisualWords(I, dictionary, filterBank);
    hist=getImageFeatures(wordMap, dictionarySize);
    testFeatures=[hist;testFeatures] ;       
end
save('testFeatures_harris_600200.mat', 'testFeatures')
%}
testFeatures=load('testFeatures_harris_600200.mat');
testFeatures=testFeatures.testFeatures;
%t = templateSVM('KernelFunction','gaussian');
t = templateSVM('KernelFunction','rbf');
%t = templateSVM('KernelFunction','polynomial', 'PolynomialOrder',8);
Mdl = fitcecoc(trainFeatures,trainLabels,'Learners',t);
L = resubLoss(Mdl,'LossFun','classiferror')
label = predict(Mdl,testFeatures);
N=size(label)
for i = 1:1:N(1,1)    
    predictedLabel=9-label(i,1);
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

