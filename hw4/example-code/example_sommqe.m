%% SOM-MQE demo code
% Created by Dai-Yan Ji
% University of Maryland-College Park
% 2024.03.02
%
% somtoolbox is required
% more information abuot the toolbox: http://www.cis.hut.fi/somtoolbox/

%%
% Load the data
  load('Example_Features.mat');
  
%% Training of SOM with Normal condition data

TrainData=alldata.TrainFeatures(105:156,:);
TestData=alldata.TestFeatures;

sM=som_make(TrainData);


%% Calculate the MQE values for the testing data set
S=size(TestData);
S=S(1);
for ii=1:S
    qe=som_quality(sM,TestData(ii,:)); % calculate MQE value for each sample
    MQEt(ii)=qe;
end

MQEtn=(1-(MQEt)./(max(MQEt))); % normalize MQE
MQEtn=MQEtn';

%% Plot the calculated MQE values 
% observe the difference between normal condition and faluty conditions
plot(MQEtn,'-*');
xlabel('Data file No.');
 ylabel('Confidence value (MQE)');
 title('Health Assessment Plot');
