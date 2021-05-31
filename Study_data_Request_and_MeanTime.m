
function Study_data_Request_and_MeanTime()
maxReq=100;
timeStep=1;
tresh=0;
prod_type=0;
transport=0;
wastes=0;

  % Request across time for Vegan
type_menu = 0;
stat1 = commun_proposed_menu(maxReq,timeStep,tresh,type_menu,prod_type,transport,wastes,'aliment_data_1.csv');
stat2 = commun_proposed_menu(maxReq,timeStep,tresh,type_menu,prod_type,transport,wastes,'aliment_data_2.csv');
stat3 = commun_proposed_menu(maxReq,timeStep,tresh,type_menu,prod_type,transport,wastes,'aliment_data_3.csv');
stat4 = commun_proposed_menu(maxReq,timeStep,tresh,type_menu,prod_type,transport,wastes,'aliment_data_4.csv');
stat5 = commun_proposed_menu(maxReq,timeStep,tresh,type_menu,prod_type,transport,wastes,'aliment_data_5.csv');

figure
hold on
  plot(stat1.Time,stat1.nbArrival)
  plot(stat2.Time,stat2.nbArrival)
  plot(stat3.Time,stat3.nbArrival)
  plot(stat4.Time,stat4.nbArrival)
  plot(stat5.Time,stat5.nbArrival)
  legend('source1','source2','source3','source4','source5')
  xlabel("Time in days")
  ylabel("Number of requests for one run")
  title("Vegan: requests arrived ans served since the beginning of the simulation")
  hold off
  
  
  % Request across time for Vegetarian
type_menu = 1;
stat1 = commun_proposed_menu(maxReq,timeStep,tresh,type_menu,prod_type,transport,wastes,'aliment_data_1.csv');
stat2 = commun_proposed_menu(maxReq,timeStep,tresh,type_menu,prod_type,transport,wastes,'aliment_data_2.csv');
stat3 = commun_proposed_menu(maxReq,timeStep,tresh,type_menu,prod_type,transport,wastes,'aliment_data_3.csv');
stat4 = commun_proposed_menu(maxReq,timeStep,tresh,type_menu,prod_type,transport,wastes,'aliment_data_4.csv');
stat5 = commun_proposed_menu(maxReq,timeStep,tresh,type_menu,prod_type,transport,wastes,'aliment_data_5.csv');


figure
hold on
  plot(stat1.Time,stat1.nbArrival)
  plot(stat2.Time,stat2.nbArrival)
  plot(stat3.Time,stat3.nbArrival)
  plot(stat4.Time,stat4.nbArrival)
  plot(stat5.Time,stat5.nbArrival)
  legend('source1','source2','source3','source4','source5')
  xlabel("Time in days")
  ylabel("Number of requests for one run")
  title("Vegetarian: requests arrived ans served since the beginning of the simulation")
  hold off
  
   % Request across time for Omnivore
type_menu = 2;
stat1 = commun_proposed_menu(maxReq,timeStep,tresh,type_menu,prod_type,transport,wastes,'aliment_data_1.csv');
stat2 = commun_proposed_menu(maxReq,timeStep,tresh,type_menu,prod_type,transport,wastes,'aliment_data_2.csv');
stat3 = commun_proposed_menu(maxReq,timeStep,tresh,type_menu,prod_type,transport,wastes,'aliment_data_3.csv');
stat4 = commun_proposed_menu(maxReq,timeStep,tresh,type_menu,prod_type,transport,wastes,'aliment_data_4.csv');
stat5 = commun_proposed_menu(maxReq,timeStep,tresh,type_menu,prod_type,transport,wastes,'aliment_data_5.csv');


figure
hold on
  plot(stat1.Time,stat1.nbArrival)
  plot(stat2.Time,stat2.nbArrival)
  plot(stat3.Time,stat3.nbArrival)
  plot(stat4.Time,stat4.nbArrival)
  plot(stat5.Time,stat5.nbArrival)
  legend('source1','source2','source3','source4','source5')
  xlabel("Time in days")
  ylabel("Number of requests for one run")
  title("Omnivore: requests arrived ans served since the beginning of the simulation")
  hold off
  
  
% Mean time to produce and serve one menu in days
maxLoop=100;
file_name='aliment_data_1.csv';
mean_time_Served=[];
type_menu0=0;
type_menu1=1;
type_menu2=2;
for loop=1:1:maxLoop
  stat1 = commun_proposed_menu(maxReq,timeStep,tresh,type_menu0,prod_type,transport,wastes,file_name);
  mean_time_Served1(loop,:) = stat1.responseTimeCtr/(stat1.request(end));
  
   stat2 = commun_proposed_menu(maxReq,timeStep,tresh,type_menu1,prod_type,transport,wastes,file_name);
  mean_time_Served2(loop,:) = stat2.responseTimeCtr/(stat2.request(end));
  
   stat3= commun_proposed_menu(maxReq,timeStep,tresh,type_menu2,prod_type,transport,wastes,file_name);
  mean_time_Served3(loop,:) = stat3.responseTimeCtr/(stat3.request(end));
  
end

  figure
  hold on
  plot(mean_time_Served1)
  plot(mean_time_Served2)
  plot(mean_time_Served3)
  legend("Vegan", "Vegetarian", "Omnivore")
  xlabel("Requests")
  ylabel("Mean time to produce and serve one menu in days")
  hold off
  
end

