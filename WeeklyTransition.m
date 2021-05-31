% simulation on one semester: 14 weeks 5 days = 70 points
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

% Example :
% WeeklyTransition(10)

function WeeklyTransition(NbrStudents)
opengl software
timeStep=1; %1 day at the time
tresh=0;
Carbon1=[];
Carbon2=[];
Carbon3=[];
Carbon4=[];
Carbon5=[];
maxReq=1;




p_type_menu0=zeros(70,1);
p_type_menu1=zeros(70,1);
p_type_menu2=zeros(70,1);
p_prod_type0=zeros(70,1);
p_prod_type1=zeros(70,1);
p_prod_type2=zeros(70,1);
p_transport0=zeros(70,1);
p_transport1=zeros(70,1);
p_transport2=zeros(70,1);
p_wastes0=zeros(70,1);
p_wastes1=zeros(70,1);
p_wastes2=zeros(70,1);

% from https://www.lenouvelliste.ch/articles/lifestyle/sante/alimentation-il-y-a-plus-d-hommes-que-de-femmes-vegans-643626#:~:text=De%20mani%C3%A8re%20g%C3%A9n%C3%A9rale%2C%2011%25%20de,la%20population%2C%20soit%206%25.
%11% de la population suisse sont vÃ©gÃ©tariens et 3% vÃ©gÃ©taliens

% prendre en compte qu'un jour par semaine est toujours végétarien: spdg:
% on prend vendredi:

friday= [5 10 15 20 25 30 35 40 45 50 55 60 65 70];

for i= friday
    p_type_menu0(i)=3/100;
    p_type_menu1(i)=97/100;
    p_type_menu2(i)=0;
end




% WEEK 1
for i =1:4
    % pourcentage normal entre végé et vegan et le reste est homnivore:
    p_type_menu0(i)=3/100;
    p_type_menu1(i)=11/100;
    p_type_menu2(i)=86/100; 
  
end

for i =1:5
p_prod_type0(i)=9/20;
p_prod_type1(i)=10/20;
p_prod_type2(i)=1/20; % sur vingt choix de places où manger, seul Takinoa est organique
% 40% à 50% des denrées alimentaires (selon que l%on inclut ou non l importation de fourrage) proviennent de l’étranger.
%3973(81%) vs 905(19%)=4878
p_transport0(i)=55/100;
p_transport1(i)=36/100;
p_transport2(i)=9/100;
 %-------------------
p_wastes0(i)=1/2;
p_wastes1(i)=0;
p_wastes2(i)=1/2;
end

% WEEK 2
for i =6:9
    p_type_menu0(i)=8/100;
    p_type_menu1(i)=16/100;
    p_type_menu2(i)=76/100;
   
end
for i =6:10  
p_prod_type0(i)=35/100;
p_prod_type1(i)=55/100;
p_prod_type2(i)=10/100;
 %-------------------
p_transport0(i)=56/100;
p_transport1(i)=36/100;
p_transport2(i)=8/100;
 %-------------------
p_wastes0(i)=50/100;
p_wastes1(i)=4/100;
p_wastes2(i)=46/100;
end

% WEEK 3
for i =11:14
    p_type_menu0(i)=13/100;
    p_type_menu1(i)=21/100;
    p_type_menu2(i)=66/100;
    
end
for i =11:15
    p_prod_type0(i)=25/100;
p_prod_type1(i)=60/100;
p_prod_type2(i)=15/100;
 %-------------------
p_transport0(i)=57/100;
p_transport1(i)=36/100;
p_transport2(i)=7/100;
 %-------------------
p_wastes0(i)=50/100;
p_wastes1(i)=8/100;
p_wastes2(i)=42/100;
end


% WEEK 4
for i =16:19
    p_type_menu0(i)=18/100;
    p_type_menu1(i)=26/100;
    p_type_menu2(i)=56/100;
 
end
for i =16:20
    p_prod_type0(i)=15/100;
p_prod_type1(i)=65/100;
p_prod_type2(i)=20/100;
 %-------------------
p_transport0(i)=58/100;
p_transport1(i)=36/100;
p_transport2(i)=6/100;
 %-------------------
p_wastes0(i)=50/100;
p_wastes1(i)=12/100;
p_wastes2(i)=38/100;
end


% WEEK 5
for i =21:24
    p_type_menu0(i)=23/100;
    p_type_menu1(i)=31/100;
    p_type_menu2(i)=46/100;
 
end
for i =21:25
   
   p_prod_type0(i)=5/100;
p_prod_type1(i)=70/100;
p_prod_type2(i)=25/100;
 %-------------------
p_transport0(i)=59/100;
p_transport1(i)=36/100;
p_transport2(i)=5/100;
 %-------------------
p_wastes0(i)=50/100;
p_wastes1(i)=16/100;
p_wastes2(i)=34/100;
end


% WEEK 6
for i =26:29
    p_type_menu0(i)=28/100;
    p_type_menu1(i)=36/100;
    p_type_menu2(i)=36/100;
  
end

for i =26:30
    
     p_prod_type0(i)=5/100;
p_prod_type1(i)=60/100;
p_prod_type2(i)=35/100;
 %-------------------
p_transport0(i)=60/100;
p_transport1(i)=36/100;
p_transport2(i)=4/100;
 %-------------------
p_wastes0(i)=50/100;
p_wastes1(i)=20/100;
p_wastes2(i)=30/100;
end


% WEEK 7
for i =31:34
    p_type_menu0(i)=33/100;
    p_type_menu1(i)=41/100;
    p_type_menu2(i)=26/100;
   
end

for i =31:35
   
   p_prod_type0(i)=5/100;
p_prod_type1(i)=50/100;
p_prod_type2(i)=45/100;
 %-------------------
p_transport0(i)=65/100;
p_transport1(i)=31/100;
p_transport2(i)=4/100;
 %-------------------
p_wastes0(i)=50/100;
p_wastes1(i)=24/100;
p_wastes2(i)=26/100;
end


% WEEK 8
for i =36:39
    p_type_menu0(i)=38/100;
    p_type_menu1(i)=46/100;
    p_type_menu2(i)=16/100;
   
end
for i =36:40
  
    p_prod_type0(i)=5/100;
p_prod_type1(i)=40/100;
p_prod_type2(i)=55/100;
 %-------------------
p_transport0(i)=70/100;
p_transport1(i)=26/100;
p_transport2(i)=4/100;
 %-------------------
p_wastes0(i)=50/100;
p_wastes1(i)=28/100;
p_wastes2(i)=22/100;
end


% WEEK 9
for i =41:44
    p_type_menu0(i)=43/100;
    p_type_menu1(i)=51/100;
    p_type_menu2(i)=6/100;
 
end
for i =41:45
 p_prod_type0(i)=5/100;
p_prod_type1(i)=30/100;
p_prod_type2(i)=65/100;
 %-------------------
p_transport0(i)=75/100;
p_transport1(i)=21/100;
p_transport2(i)=4/100;
 %-------------------
p_wastes0(i)=50/100;
p_wastes1(i)=32/100;
p_wastes2(i)=18/100;
end


% WEEK 10
for i =46:49
    p_type_menu0(i)=48/100;
    p_type_menu1(i)=46/100;
    p_type_menu2(i)=6/100;
   
end

for i =46:50
   
p_prod_type0(i)=5/100;
p_prod_type1(i)=20/100;
p_prod_type2(i)=75/100;
 %-------------------
p_transport0(i)=80/100;
p_transport1(i)=16/100;
p_transport2(i)=4/100;
 %-------------------
p_wastes0(i)=50/100;
p_wastes1(i)=36/100;
p_wastes2(i)=14/100;
end


% WEEK 11
for i =51:54
    p_type_menu0(i)=53/100;
    p_type_menu1(i)=41/100;
    p_type_menu2(i)=6/100;
    
end
for i =51:55
   
     p_prod_type0(i)=5/100;
p_prod_type1(i)=10/100;
p_prod_type2(i)=85/100;
 %-------------------
p_transport0(i)=85/100;
p_transport1(i)=11/100;
p_transport2(i)=4/100;
 %-------------------
p_wastes0(i)=50/100;
p_wastes1(i)=40/100;
p_wastes2(i)=10/100;
end


% WEEK 12
for i =56:59
    p_type_menu0(i)=58/100;
    p_type_menu1(i)=36/100;
    p_type_menu2(i)=6/100;
   
end

for i =56:60
    
    p_prod_type0(i)=5/100;
p_prod_type1(i)=10/100;
p_prod_type2(i)=85/100;
 %-------------------
p_transport0(i)=90/100;
p_transport1(i)=10/100;
p_transport2(i)=0;
 %-------------------
p_wastes0(i)=50/100;
p_wastes1(i)=44/100;
p_wastes2(i)=6/100;
end


% WEEK 13
for i =61:64
    p_type_menu0(i)=63/100;
    p_type_menu1(i)=31/100;
    p_type_menu2(i)=6/100;
  
end
for i =61:65
     p_prod_type0(i)=5/100;
p_prod_type1(i)=15/100;
p_prod_type2(i)=80/100;
 %-------------------
p_transport0(i)=95/100;
p_transport1(i)=5/100;
p_transport2(i)=0;
 %-------------------
p_wastes0(i)=50/100;
p_wastes1(i)=48/100;
p_wastes2(i)=2/100;
end


% WEEK 14
for i =65:69
    p_type_menu0(i)=68/100;
    p_type_menu1(i)=26/100;
    p_type_menu2(i)=6/100;
   
end

for i =65:70
   p_prod_type0(i)=5/100;
p_prod_type1(i)=10/100;
p_prod_type2(i)=85/100;
 %-------------------
p_transport0(i)=95/100;
p_transport1(i)=5/100;
p_transport2(i)=0;
 %-------------------
p_wastes0(i)=50/100;
p_wastes1(i)=50/100;
p_wastes2(i)=0/100;
end


for i = 1:70
    fprintf('\n')
    fprintf('We are currently on number day %f\n', i);
    fprintf('\n')
    stat=Choice(maxReq,timeStep,tresh,NbrStudents,p_type_menu0(i),p_type_menu1(i),p_type_menu2(i),p_prod_type0(i),p_prod_type1(i),p_prod_type2(i),p_transport0(i),p_transport1(i),p_transport2(i),p_wastes0(i),p_wastes1(i),p_wastes2(i));
    Carbon1(end+1)=sum(stat.source1);
    Carbon2(end+1)=sum(stat.source2);
    Carbon3(end+1)=sum(stat.source3);
    Carbon4(end+1)=sum(stat.source4);
    Carbon5(end+1)=sum(stat.source5);
end


figure
plot(Carbon1)
hold on
plot(Carbon2)
plot(Carbon3)
plot(Carbon4)
plot(Carbon5)
xlabel("Time in days")
ylabel("Carbon Footprint in KG CO2-EQ")
legend('source1','source2','source3','source4','source5')
title("Carbonfoot print throughout weeks: data from differents sources")
hold off

end
