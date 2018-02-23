dictionary=load('dictionaryHarris.mat');
dictionary=dictionary.dictionary;
visionHarris=load('visionHarris.mat');
visionHarris=visionHarris.visionHarris;
traintest=load('traintest.mat');
source='../data/harris/';
N=size(traintest.train_imagenames);
dictionarySize=size(dictionary);
dictionarySize=dictionarySize(1,1);
d=zeros(1,dictionarySize);

for i=1:1:N(1,2)
    name=char(traintest.train_imagenames(1,i));
    name=strcat(name(1,1:end-3), 'mat');    
    wordMap=load(strcat(source,name));
    wordMap=wordMap.wordMap;
    d=d+ismember(1:1:dictionarySize, wordMap);   
end
d
IDF=log(N(1,2)./d)
save('IDF.mat', 'IDF')
