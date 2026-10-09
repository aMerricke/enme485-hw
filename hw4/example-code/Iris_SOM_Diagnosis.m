%% Multi-class Diagnosis Iris dataset
% Created by Dai-Yan Ji
% University of Maryland-College Park
% 2024.03.02
%
% somtoolbox is required
% more information abuot the toolbox: http://www.cis.hut.fi/somtoolbox/
%% load the data
load fisheriris

%% Create SOM data structure
  sDIris = som_data_struct(meas,'name','FisherIris',...
			  'comp_names',{'petal width','petal length','sepal width','sepal length'});
          
%% Add labels to the data  
sDIris = som_label (sDIris,'add',[1:50],species{1});
sDIris = som_label (sDIris,'add',[51:100],species{51});
sDIris = som_label (sDIris,'add',[101:150],species{101});
%% Initialization and training of the maps   

sMap = som_make(sDIris);

sMap = som_autolabel(sMap,sDIris,'vote');
%% Visualize the maps

som_show(sMap);

% U-matrix with labels
figure;
som_show(sMap,'umat','all','empty','Labels');
som_show_add('label',sMap,'Textsize',8,'TextColor','r','Subplot',2)

%% See the hit points for different flowers(setosa(Red), versicolor(Green), virginica(Blue))

colormap(1-gray)
som_show(sMap,'umat','all','empty','Labels');

% Add labels to the map
som_show_add('label',sMap,'Textsize',8,'TextColor','r','Subplot',2)

% sampels for test
h1 = som_hits(sMap,sDIris.data(20,:)); % data from setosa(Red)
h2 = som_hits(sMap,sDIris.data(70,:)); % data from versicolor(Green)
h3 = som_hits(sMap,sDIris.data(120,:)); % data from virginica(Blue)

% diagnosis result
h1_label = sMap.labels(h1==1);
h2_label = sMap.labels(h2==1);
h3_label = sMap.labels(h3==1);

% Use hit point to show diagnosis result
som_show_add('hit',[h1, h2, h3],'MarkerColor',[1 0 0 ; 0 1 0 ; 0 0 1 ],'Subplot',1)
