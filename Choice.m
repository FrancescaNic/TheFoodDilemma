
function [carbon] = Choice(maxReq,timeStep,tresh,NbrStudents,p_type_menu0,p_type_menu1,p_type_menu2,p_prod_type0,p_prod_type1,p_prod_type2,p_transport0,p_transport1,p_transport2,p_wastes0,p_wastes1,p_wastes2)

carbon.source1=[];
carbon.source2=[];
carbon.source3=[];
carbon.source4=[];
carbon.source5=[];
p_type_menu = [p_type_menu0 p_type_menu1 p_type_menu2];
p_prod_type = [p_prod_type0 p_prod_type1 p_prod_type2];
p_transport=[p_transport0 p_transport1 p_transport2];
p_wastes=[p_wastes0 p_wastes1 p_wastes2];

n_type_menu = mnrnd(1,p_type_menu,1);
n_prod_type = mnrnd(1,p_prod_type,1);
n_transport=mnrnd(1,p_transport,1);
n_wastes=mnrnd(1,p_wastes,1);


type_menu=find(n_type_menu)-1;
prod_type=find(n_prod_type)-1;
transport=find(n_transport)-1;
wastes=find(n_wastes)-1; % (1    , 1   ,  0   ,  0 ,    0  ,   0   ,  0 ,'aliment_data_1.csv')
%commun_proposed_menu(maxReq,timeStep,tresh,type_menu,prod_type,transport,wastes,file_name)
for i=1:NbrStudents
    
    fprintf('\n')
    fprintf('We are currently working with student number %f\n', i);
    fprintf('\n')
    fprintf('Menu parameters :\n')
    maxReq
    timeStep
    tresh
    type_menu
    prod_type
    transport
    wastes
    fprintf('****************\n')
stat1=commun_proposed_menu(maxReq,timeStep,tresh,type_menu,prod_type,transport,wastes,'aliment_data_1.csv');
carbon.source1(end+1)=stat1.TotalCarbonFootprint;
stat2=commun_proposed_menu(maxReq,timeStep,tresh,type_menu,prod_type,transport,wastes,'aliment_data_2.csv');
carbon.source2(end+1)=stat2.TotalCarbonFootprint;
stat3=commun_proposed_menu(maxReq,timeStep,tresh,type_menu,prod_type,transport,wastes,'aliment_data_3.csv');
carbon.source3(end+1)=stat3.TotalCarbonFootprint;
stat4=commun_proposed_menu(maxReq,timeStep,tresh,type_menu,prod_type,transport,wastes,'aliment_data_4.csv');
carbon.source4(end+1)=stat4.TotalCarbonFootprint;
stat5=commun_proposed_menu(maxReq,timeStep,tresh,type_menu,prod_type,transport,wastes,'aliment_data_5.csv');
carbon.source5(end+1)=stat5.TotalCarbonFootprint;
end
carbon.source1=sum(carbon.source1);
carbon.source2=sum(carbon.source2);
carbon.source3=sum(carbon.source3);
carbon.source4=sum(carbon.source4);
carbon.source5=sum(carbon.source5);
end