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
% commun_proposed_menu(10,1,0,1,0,0,0,'aliment_data_1.csv')
function stat = commun_proposed_menu(maxReq,timeStep,tresh,type_menu,prod_type,transport,wastes,file_name)


premier_tour=1; 

% Transport mean and its carbon footprint and speed consumption
%meanTransport.name = ["aircraft with reefer", "lorry with reefer", "sea container ship with reefer", "train"];
meanTransport.consumption = [0.435, 0.124, 0.018, 0.035]*10^(-3); % kg CO2 - eq/(kg*km)
meanTransport.speed = [1060, 70, 46.3, 18]*24; % km/day



ftoread = file_name; % File name
fid = fopen(ftoread); % open file 
M = textscan(fid, '%s%s%s%s%s%s%s%s%s%s', 'Delimiter', ';');



% Convert string to double
M{2} = str2double(M{2}); % Production carbon emissions in KG CO2-EQ
M{3} = str2double(M{3}); % Minimum time production
M{4} = str2double(M{4}); % Maximum time production
M{5} = str2double(M{5}); % Menu type : 0 basic ingredient, 1 vegan, 2 vegetarian, 3 omnivore
M{6} = str2double(M{6}); % Type of prod : 0 unknown, 1 known
M{7} = str2double(M{7}); % Conventional prod in KG CO2-EQ
M{8} = str2double(M{8}); % Organic prod in KG CO2-EQ
M{9} = str2double(M{9}); % Transport distance in km
M{10} = str2double(M{10}); % Transport type : 0 continental land transport, 1 otherwise


% Type of menu
if type_menu==0 % vegan
    i=1;
    while i<=length(M{1})
        if M{5}(i) == 2 || M{5}(i) == 3
            for j=1:10
                M{j}(i) = [];
            end
        else
            i=i+1;
        end
    end
elseif type_menu==1 % vegetarian
    i=1;
    while i<=length(M{1})
        if M{5}(i) == 1 || M{5}(i) == 3
            for j=1:10
                M{j}(i) = [];
            end
        else
            i=i+1;
        end
    end
elseif type_menu==2 % omnivore
    i=1;
    while i<=length(M{1})
        if M{5}(i) == 1 || M{5}(i) == 2
            for j=1:10
                M{j}(i) = [];
            end
        else
            i=i+1;
        end
    end
else
    fprintf('Error in Type of menu');
    type_menu
end

% Type of prod
if prod_type==1
    for i=1:length(M{1})
        if M{6}(i)==1
            M{2}(i)=M{7}(i);
        end
    end
elseif prod_type==2
    for i=1:length(M{1})
        if M{6}(i)==1
            M{2}(i)=M{8}(i);
        end
    end
  elseif prod_type==0
else
    fprintf('Error in Type of prod');
    prod_type
end

% Transport
if transport==1
    for i=1:length(M{1})
        if M{10}(i)==0
            M{10}(i)=M{9}(i)/meanTransport.speed(4); % becomes train transport duration
            M{9}(i)=meanTransport.consumption(4)*M{9}(i); % becomes train transport consumtion
        else
            M{10}(i)=M{9}(i)/meanTransport.speed(3); % becomes ship transport duration
            M{9}(i)=meanTransport.consumption(3)*M{9}(i); % becomes ship transport consumtion
        end
    end
elseif transport==2
    for i=1:length(M{1})
        if M{10}(i)==0
            M{10}(i)=M{9}(i)/meanTransport.speed(2); % becomes lorry transport duration
            M{9}(i)=meanTransport.consumption(2)*M{9}(i); % becomes lorry transport consumtion
        else
            M{10}(i)=M{9}(i)/meanTransport.speed(1); % becomes aircraft transport duration
            M{9}(i)=meanTransport.consumption(1)*M{9}(i); % becomes aircraft transport consumtion
        end
    end
    elseif transport==0
else
    fprintf('Error in Transport');
    transport
end
    


TotalCarbonFootprint=0;
StepProductionCarbon = 0;
StepTransportCarbon = 0;

% Initialize the random number generator
rand('state',sum(100*clock));

% Create the eventScheduler
% And bootstrap it (i.e. add the first event)
evSched.currentTime = -1;
evSched.firingTime = 0;
evSched.evList = [,];

evSched.evListLength = 0; % And a variable corresponding to the event list size (i.e number of rows)
evSched = addEvent(1,0,evSched);

% Initialize buffer queues
server.queue = [];
server.queueLength = 0;
server.nbArrival = 0;
server.nbRequest = 0;
server.TotalCarbonFootprint=0;

% Variables used for statistic purpose, refer to the perfeval lecture notes for the terminology (simulation chapter)
stat.eventTime = [];
stat.treshIdx = 0;
stat.sampledIdx = 1;
stat.queueSize = [];
stat.request = [];
stat.queueLengthCtr = 0;
stat.queueLengthCtrTresh = 0;
stat.responseTimeCtr = 0;
stat.responseTimeCtrTresh = 0;
stat.TotalCarbonFootprint=[];
stat.StepCarbonFootprint=[];
stat.MeanTotalCarbonFootprint=0;
sigma=1/100;
sigma2=1/8;
stat.nbArrival = [];
stat.nbRequest = [];
stat.Time = [];
stat.conservation_carbon=[];

%Ingredients_needed=M{1};
elements_we_have=strings;
elements_times=[];
while server.nbArrival <= maxReq
     % Get next event
  evType = evSched.evList(1,2); % Assumes that evList is sorted
  evSched.firingTime = evSched.evList(1,1);

  % Remove it from the event list
  evSched = delEvent(evSched);
  
   % Increment counter for the arrival queue
  stat.queueLengthCtr = ...
      stat.queueLengthCtr + server.queueLength*(evSched.firingTime-evSched.currentTime);
  if evSched.firingTime > tresh
    stat.queueLengthCtrTresh = ...
	stat.queueLengthCtrTresh + server.queueLength*(evSched.firingTime-evSched.currentTime);
  end
  % Register queue size
  stat.eventTime(end+1) = evSched.firingTime;
  stat.queueSize(end+1) = server.queueLength;
  stat.request(end+1) = server.nbRequest;
  
  if mod(evSched.firingTime,timeStep) < mod(evSched.currentTime,timeStep)
    stat.sampledIdx(end+1) = length(stat.eventTime);
  end
  
  switch evType
      case 1, 
          TransportTimes=0;
          TransportCarbon=zeros(length(M{9}),1);
          ProductionTimes=unifrnd(M{3},M{4});
          if(not(transport==0))
          TransportTimes=normrnd(M{10},sigma2);
          TransportCarbon=normrnd(M{9},sigma);
          if TransportTimes<0
              TransportTimes=0;
          end
          if TransportCarbon<0
              TransportCarbon=0;
          end
          end
          Times=ProductionTimes+TransportTimes;
          ProductionCarbon= M{2};
          Carbon=ProductionCarbon+TransportCarbon;
          Ingredients_needed=M{1};

          if length(elements_we_have)==length(M{1})
        evSched = addEvent(2,evSched.firingTime,evSched);
        StepCarbonFootprint=[StepProductionCarbon, StepTransportCarbon];
        
        
        Ingredients_needed=M{1};
        elements_we_have=strings;
        StepProductionCarbon = 0;
        StepTransportCarbon = 0;
      
        premier_tour=1;
          else
          % Create a new request and add it at the end of the buffer
          if premier_tour==0
            server.queue = [server.queue; evSched.firingTime];
            server.queueLength = server.queueLength + 1;
          end
            
            % treatment de qui rentre:

[x,y]=find(Times==min(Times));
first_ready=Ingredients_needed(x,:);

    while ismember(first_ready, elements_we_have)
    % remove it
    premier_tour=0;
 
    Times(x,:) = []; 
    Ingredients_needed(x,:) = [];
    Carbon(x,:) = [];
    ProductionCarbon(x,:) = [];
    TransportCarbon(x,:) = [];
  
    % take next fastest
    [x,y]=find(Times==min(Times));
    first_ready=Ingredients_needed(x,:);  
    end
  
  evSched = addEvent(1,evSched.firingTime+Times(x,y),evSched);
  
  if premier_tour==1
      elements_we_have(1)=first_ready;
      elements_times(1)=evSched.firingTime+Times(x,y);
  else
      elements_we_have(end+1)=first_ready;
      elements_times(end+1)=evSched.firingTime+Times(x,y);
  end
  
  TotalCarbonFootprint=TotalCarbonFootprint+Carbon(x,y);
  StepProductionCarbon = StepProductionCarbon + ProductionCarbon(x,y);
  StepTransportCarbon = StepTransportCarbon + TransportCarbon(x,y);
          end
                    
    case 2, % Service fprintf('=> Service Event: evFiringTime = %d\n',evSched.firingTime);
    server.nbArrival = server.nbArrival + 1; % je l'ajoute ici pour définir plutot la demande de plats et pas la demande des ingredients
    % Draw a random number from distrib G to create a new Departure event
    twenty_two_min=22/(60*24);
    delta = normrnd(twenty_two_min,1); % equivalent à 22 min
    if delta<0
        delta = 0;
    end
    evSched = addEvent(3,evSched.firingTime+delta,evSched);
    
    case 3, % Departure fprintf('=> Departure Event: evFiringTime = %d\n',evSched.firingTime);

    if wastes == 0
        StepCarbonFootprint=[StepCarbonFootprint,  8.59E-03];
        TotalCarbonFootprint=TotalCarbonFootprint+8.59E-03; % wastewater + chemical + dishwasher
    elseif wastes == 1
        StepCarbonFootprint=[StepCarbonFootprint,  0.089+0.728];
        TotalCarbonFootprint=TotalCarbonFootprint+0.089+0.728; % beverage carton converting + carton board box production, with gravure printing 
    elseif wastes == 2
        StepCarbonFootprint=[StepCarbonFootprint,  3.126];
        TotalCarbonFootprint=TotalCarbonFootprint+3.126; % packaging film, low density polyethylene
    else
        fprintf('Error in Wastes');
        wastes
    end    
        
    % Update response time counters
    stat.responseTimeCtr = stat.responseTimeCtr + evSched.firingTime-server.queue(1);
    if evSched.firingTime > tresh
      stat.responseTimeCtrTresh = stat.responseTimeCtrTresh + evSched.firingTime-server.queue(1);
    end
    % Job has been served and  we don't need its arrival time anymore
    server.nbRequest = server.nbRequest + 1;

    % Remove request from buffer and delete it
    server.queue = server.queue(2:end);
    server.queueLength = server.queueLength - 1;
    stat.conservation_carbon(end+1)=sum(evSched.firingTime*ones(length(elements_times),1)-transpose(elements_times))*0.007;
    stat.TotalCarbonFootprint(end+1)=TotalCarbonFootprint+stat.conservation_carbon(end);
    StepCarbonFootprint = [StepCarbonFootprint, stat.conservation_carbon(end)];
    stat.StepCarbonFootprint = [stat.StepCarbonFootprint; StepCarbonFootprint];
    StepCarbonFootprint = 0;
    TotalCarbonFootprint=0;
    elements_times=[];
    % Add a service event if the queue is not empty
    if server.queueLength > 0
      evSched = addEvent(1,evSched.firingTime,evSched);
    end

   otherwise
    fprintf('Bug: this type of event does not exist!\n');
    
  end
   stat.nbArrival = [stat.nbArrival; server.nbArrival];
   stat.nbRequest = [stat.nbRequest; server.nbRequest];
   stat.Time = [stat.Time; evSched.firingTime];
    evSched.currentTime = evSched.firingTime;
  if evSched.currentTime > tresh && stat.treshIdx == 0
    stat.treshIdx = length(stat.eventTime);
  end
        
end

stat.MeanTotalCarbonFootprint=mean(stat.TotalCarbonFootprint);
fclose('all');
end

