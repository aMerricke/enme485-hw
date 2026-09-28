
%% 0: Clean up
clear all
clc
close all


%% 1: Set file path

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Specify the location of the libsvm/matlab folder  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

dir_lib     = 'G:\My Drive\ELMS\HW3\For Students\libsvm\matlab';

%% 2: Import data

%%%%%%%%%%%%%%%%%%%
% Write your code %
%%%%%%%%%%%%%%%%%%%

%% 3: Feature extraction / FFT

%%%%%%%%%%%%%%%%%%%
% Write your code %
%%%%%%%%%%%%%%%%%%%

%% 4: Plot signals, features

%%%%%%%%%%%%%%%%%%%
% Write your code %
%%%%%%%%%%%%%%%%%%%

%% 5. SVM

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Before this section, you need prepare 
%  - FeatMat_train: Feature matrix for training data
%  - FeatMat_test : Feature matrix for testing data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

cd(dir_lib)

% Training data
Train_X = FeatMat_train;
Train_Y = zeros(N_train,1);
Train_Y(1:Nh,1) = 1;
Train_Y(Nh+1:Nh+Nf1,1) = 2;
Train_Y(Nh+Nf1+1:N_train,1) = 3;

% Test Data
Test_X = FeatMat_test;
Test_Y = zeros(30,1);
Test_Y( 1:10,1) = 1;
Test_Y(11:20,1) = 2;
Test_Y(21:30,1) = 3;

% train SVM with different kernel

Mehtod_list = {'rbf','linear','polynomial','Sigmoid'}; % kernel function selection

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Here you can select kernel function 
% Try different kernel and check the results
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Method = Mehtod_list{1}; % 1: rbf, 2: linear, 3: polynomial, 4: softmargin

switch Method
    case 'rbf'
            svmStruct = libsvmtrain(Train_Y,Train_X,'-s 0 -t 2 -g 0.333 -c 1');
            % refer to README file in libsvm for more infomation

    case 'linear'
            svmStruct = libsvmtrain(Train_Y,Train_X,'-s 0 -t 0 -g 0.333 ');
        
    case 'polynomial'
            svmStruct = libsvmtrain(Train_Y,Train_X,'-s 0 -t 1 -g 0.333 ');
            
    case 'Sigmoid'
        svmStruct = libsvmtrain(Train_Y,Train_X,'-s 0 -t 3 -g 0.333 ');
        
end

% Test and predict label
% use trained SVM model for classification
[predicted_result, accuracy,~] = libsvmpredict(Test_Y,Test_X,svmStruct);

%% 6. Confusion Matrix

%%%%%%%%%%%%%%%%%%%
% Write your code %
%%%%%%%%%%%%%%%%%%%