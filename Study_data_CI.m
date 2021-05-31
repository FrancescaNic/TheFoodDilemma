% if type_menu=0 you get the vegan menu
% if type_menu=1 you get the vegetarian menu
% if type_menu=2 you get the omnivore menu

% if prod_type=0 you get undefined production
% if prod_type=1 you get conventional production
% if prod_type=2 you get organic production

% if transport=0 you get local ingredients
% if transport=1 you get non local ingredients with environmentally respectful
% transportation (train and sea container ship)
% if transport=2 you get non local ingredients with non environmentally respectful
% transportation (lorry and aircraft)

% if wastes=0 you eat in restaurant
% if wastes=1 you take away Carton
% if wastes=2 you take away Plastic PET

% if file_name = 'aliment_data_1.csv' database for production emissions : www.agribalyse.fr version 3.0
% if file_name = 'aliment_data_2.csv' database for production emissions : https://www.greeneatz.com/foods-carbon-footprint.html
% if file_name = 'aliment_data_3.csv' database for production emissions : http://45.157.188.170/
% if file_name = 'aliment_data_4.csv' database for production emissions : https://www.foodemissions.com/Calculator
% if file_name = 'aliment_data_5.csv' database for production emissions : https://ourworldindata.org/environmental-impacts-of-food

% Example :
% Study_data_CI(100, 1, 0, 0, 0, 0, 0,'aliment_data_1.csv',100)
function []=Study_data_CI(maxReq,timeStep,tresh,type_menu,prod_type,transport,wastes,file_name,maxLoop)

fprintf('\n')
  
aggregateCarbon = [];
minL = 100;

% Performs maxLoop iteration of the simpleServer
for loop=1:1:maxLoop
  stat = commun_proposed_menu(maxReq,timeStep,tresh,type_menu,prod_type,transport,wastes,file_name);
  mean_time_Served(loop,:) = stat.responseTimeCtr/(stat.request(end));
  fprintf('mean time to be Served/day = %f\n', mean_time_Served(loop));
  meanCarbon(loop,:) = stat.MeanTotalCarbonFootprint;
  fprintf('mean Total Carbon Footprint in KG CO2-EQ= %f\n', meanCarbon(loop));
  medianCarbon(loop,:)=median(stat.TotalCarbonFootprint);
   fprintf('median Total Carbon Footprint in KG CO2-EQ= %f\n', medianCarbon(loop));
  std_devCarbon(loop,:)=std(stat.TotalCarbonFootprint);
  
   % Process the queue size statistics
  aggregateCarbon(loop,1:minL) = stat.TotalCarbonFootprint;
end

% median, confidence interval for the median at level 0.95, mean and
% confidence interval for the mean at level 0.95 for N= 150

  % MEAN
meanCarbon = mean(aggregateCarbon(:,1:minL));
medianCarbon = median(aggregateCarbon(:,1:minL));

N = maxLoop;  
                                      % Number of ,Experiments1 In Data Set                                  % Mean Of All Experiments At Each Value Of x
yMean = meanCarbon;
ySEM = std(meanCarbon)/sqrt(N);% Compute Standard Error Of The Mean Of All Experiments At Each Value Of x
UPPER = yMean +1.96*ySEM;
LOWER = yMean -1.96*ySEM;
  
 figure
plot(yMean,'b')                                      % Plot Mean Of All Experiments
hold on
plot(UPPER,'-r')
plot(LOWER,'-r')
legend('Mean', 'CI')
xlabel("Requests")
ylabel("Mean Carbon Footprint in KG CO2-EQ")
hold off


% MEDIAN

j=floor(N*0.5-0.98*sqrt(N));
if j<1
    j=1;
end

k=ceil(N*0.5+0.98*sqrt(N))+1;
if k>N
    k=N;
end

aggregateCarbon(:,1:minL) = sort(aggregateCarbon(:,1:minL));


UPPERmedian = aggregateCarbon(k,1:100);
LOWERmedian = aggregateCarbon(j,1:100);

  
  figure
  hold on
  plot(medianCarbon,'b')
  plot(UPPERmedian,'-r')
  plot(LOWERmedian,'-r')
  legend('Median', 'CI')
  xlabel("Requests")
  ylabel("Median Carbon Footprint in KG CO2-EQ")
  hold off

end