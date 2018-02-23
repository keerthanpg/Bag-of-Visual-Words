traintest=load('../data/traintest.mat');
source=('../data/');
trainFeatures=[];
for i=1:1:size(traintest.train_imagenames, 2)  
    i
    I=imread(strcat(source, char(traintest.train_imagenames(1,i))));
    trainFeatures=[trainFeatures;extractHOGFeatures(I)];     
end
save('trainFeatures_HOG.mat', 'trainFeatures');
size(trainFeatures)
correct=0
wrong=0
confusion=zeros(8);
"testing"
exception=0;
size(trainFeatures)
mdl = fitcknn(trainFeatures,traintest.train_labels);
testFeatures=zeros(size(traintest.test_imagenames, 2) , size(trainFeatures, 2));
for i = 1:1:size(traintest.test_imagenames, 2)    
    i
    I=imread(strcat(source,char(traintest.test_imagenames(1,i))));
    features=extractHOGFeatures(I);
    size(features)
    if size(features,2)<size(trainFeatures, 2)
        "mismatch less"
        size(features)
        size(trainFeatures)
        difference=size(trainFeatures, 2)-size(features,2)
        features=padarray(features,[0 difference], 'post');
    end
    if size(features,2)>size(trainFeatures, 2)
        "mismatch more"
        size(features)
        size(trainFeatures)
        features=features(:,1:size(trainFeatures, 2));
    end
    size(features)
    size(testFeatures)
    testFeatures(i, :)=features;
end
save('testFeatures_HOG.mat', 'testFeatures');
predictedLabel=predict(mdl,features);
size(predictedLabel)
for i = 1:1:size(traintest.test_imagenames, 2)    
    i 
    targetLabel=traintest.test_labels(1,i);
    confusion(predictedLabel(i,1), targetLabel)=confusion(predictedLabel(i,1), targetLabel)+1;
    if(targetLabel==predictedLabel(i,1))
        correct= correct+1;
    else
        wrong=wrong+1;
    end
      
end
correct
wrong
accuracy=correct/(correct+wrong)
confusion
exception