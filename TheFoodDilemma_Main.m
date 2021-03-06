
% It is not recommended to perform all functions at once because of the long execution time. 
% Rather, please comment the non-essential functions depending on the results you wish to view.
% Find above each function what it generates.

fprintf("THE FOOD DILEMMA \n")

% Request across time and mean time to produce and serve one menu
Study_data_Request_and_MeanTime()

% Vegan : Mean, Median and their confidence intervals
Study_data_CI(100, 1, 0, 0, 0, 0, 0,'aliment_data_1.csv',100) % for source 1
Study_data_CI(100, 1, 0, 0, 0, 0, 0,'aliment_data_2.csv',100) % for source 2
Study_data_CI(100, 1, 0, 0, 0, 0, 0,'aliment_data_3.csv',100) % for source 3
Study_data_CI(100, 1, 0, 0, 0, 0, 0,'aliment_data_4.csv',100) % for source 4
Study_data_CI(100, 1, 0, 0, 0, 0, 0,'aliment_data_5.csv',100) % for source 5

% Total carbon footprint from different sources and Mean carbon footprint
% Histograms
Study_data_Carbon_Repartition()

% WEEKLY TRANSITION WITH 10 STUDENTS
WeeklyTransition(10);

% WEEKLY TRANSITION WITH 100 STUDENTS
WeeklyTransition(100);