
function Study_data_Carbon_Repartition()

histo = [];

% Vegan, local, in restaurant
fprintf("Vegan, local, in restaurant")
stat1 = commun_proposed_menu(100,1,0,0,0,0,0,'aliment_data_1.csv');
stat2 = commun_proposed_menu(100,1,0,0,0,0,0,'aliment_data_2.csv');
stat3 = commun_proposed_menu(100,1,0,0,0,0,0,'aliment_data_3.csv');
stat4 = commun_proposed_menu(100,1,0,0,0,0,0,'aliment_data_4.csv');
stat5 = commun_proposed_menu(100,1,0,0,0,0,0,'aliment_data_5.csv');

meanCarbon = [mean(stat1.StepCarbonFootprint); mean(stat2.StepCarbonFootprint); mean(stat3.StepCarbonFootprint); mean(stat4.StepCarbonFootprint); mean(stat5.StepCarbonFootprint)];
S = std(meanCarbon(:,1))
meanCarbon = mean(meanCarbon);
histo = [histo; meanCarbon];

fprintf("Total emissions : %f ", sum(histo(end,:)))
    fprintf('\n')
fprintf("Percentage production emissions : %f % ", histo(end,1)/sum(histo(end,:))*100)
    fprintf('\n')
fprintf("Percentage transport emissions : %f %", histo(end,2)/sum(histo(end,:))*100)
    fprintf('\n')
fprintf("Percentage service waste emissions : %f %", histo(end,3)/sum(histo(end,:))*100)
    fprintf('\n')
fprintf("Percentage conservation emissions : %f %", histo(end,4)/sum(histo(end,:))*100)
    fprintf('\n\n')
    
    fprintf("Total emissions without conservation : %f ", sum(histo(end,1:3)))
    fprintf('\n')
fprintf("Percentage production emissions : %f % ", histo(end,1)/sum(histo(end,1:3))*100)
    fprintf('\n')
fprintf("Percentage transport emissions : %f %", histo(end,2)/sum(histo(end,1:3))*100)
    fprintf('\n')
fprintf("Percentage service waste emissions : %f %", histo(end,3)/sum(histo(end,1:3))*100)
    fprintf('\n\n')

  figure
  hold on
  plot(transpose(stat1.TotalCarbonFootprint))
  plot(transpose(stat2.TotalCarbonFootprint))
  plot(transpose(stat3.TotalCarbonFootprint))
  plot(transpose(stat4.TotalCarbonFootprint))
  plot(transpose(stat5.TotalCarbonFootprint))
  xlabel("Requests")
  ylabel("Carbon Footprint in KG CO2-EQ")
  title("Total Carbon Footprint for a vegan, local, in restaurant menu: data from different sources")
  legend('source1','source2','source3','source4','source5')
  hold off
  
  

% Vegetarian, local, in restaurant
fprintf("Vegetarian, local, in restaurant")
stat1 = commun_proposed_menu(100,1,0,1,0,0,0,'aliment_data_1.csv');
stat2 = commun_proposed_menu(100,1,0,1,0,0,0,'aliment_data_2.csv');
stat3 = commun_proposed_menu(100,1,0,1,0,0,0,'aliment_data_3.csv');
stat4 = commun_proposed_menu(100,1,0,1,0,0,0,'aliment_data_4.csv');
stat5 = commun_proposed_menu(100,1,0,1,0,0,0,'aliment_data_5.csv');
meanCarbon = [mean(stat1.StepCarbonFootprint); mean(stat2.StepCarbonFootprint); mean(stat3.StepCarbonFootprint); mean(stat4.StepCarbonFootprint); mean(stat5.StepCarbonFootprint)];
S = std(meanCarbon(:,1))
meanCarbon = mean(meanCarbon);
histo = [histo; meanCarbon];

fprintf("Total emissions : %f ", sum(histo(end,:)))
    fprintf('\n')
fprintf("Percentage production emissions : %f % ", histo(end,1)/sum(histo(end,:))*100)
    fprintf('\n')
fprintf("Percentage transport emissions : %f %", histo(end,2)/sum(histo(end,:))*100)
    fprintf('\n')
fprintf("Percentage service waste emissions : %f %", histo(end,3)/sum(histo(end,:))*100)
    fprintf('\n')
fprintf("Percentage conservation emissions : %f %", histo(end,4)/sum(histo(end,:))*100)
    fprintf('\n\n')
    
    fprintf("Total emissions without conservation : %f ", sum(histo(end,1:3)))
    fprintf('\n')
fprintf("Percentage production emissions : %f % ", histo(end,1)/sum(histo(end,1:3))*100)
    fprintf('\n')
fprintf("Percentage transport emissions : %f %", histo(end,2)/sum(histo(end,1:3))*100)
    fprintf('\n')
fprintf("Percentage service waste emissions : %f %", histo(end,3)/sum(histo(end,1:3))*100)
    fprintf('\n\n')


  figure
  hold on
  plot(transpose(stat1.TotalCarbonFootprint))
  plot(transpose(stat2.TotalCarbonFootprint))
  plot(transpose(stat3.TotalCarbonFootprint))
  plot(transpose(stat4.TotalCarbonFootprint))
  plot(transpose(stat5.TotalCarbonFootprint))
  xlabel("Requests")
  ylabel("Carbon Footprint in KG CO2-EQ")
  title("Total Carbon Footprint for a vegetarian, local, in restaurant menu: data from different sources")
  legend('source1','source2','source3','source4','source5')
  hold off

% Omnivore, local, in restaurant
fprintf("Omnivore, local, in restaurant")
stat1 = commun_proposed_menu(100,1,0,2,0,0,0,'aliment_data_1.csv');
stat2 = commun_proposed_menu(100,1,0,2,0,0,0,'aliment_data_2.csv');
stat3 = commun_proposed_menu(100,1,0,2,0,0,0,'aliment_data_3.csv');
stat4 = commun_proposed_menu(100,1,0,2,0,0,0,'aliment_data_4.csv');
stat5 = commun_proposed_menu(100,1,0,2,0,0,0,'aliment_data_5.csv');
meanCarbon = [mean(stat1.StepCarbonFootprint); mean(stat2.StepCarbonFootprint); mean(stat3.StepCarbonFootprint); mean(stat4.StepCarbonFootprint); mean(stat5.StepCarbonFootprint)];
S = std(meanCarbon(:,1))
meanCarbon = mean(meanCarbon);
histo = [histo; meanCarbon];

fprintf("Total emissions : %f ", sum(histo(end,:)))
    fprintf('\n')
fprintf("Percentage production emissions : %f % ", histo(end,1)/sum(histo(end,:))*100)
    fprintf('\n')
fprintf("Percentage transport emissions : %f %", histo(end,2)/sum(histo(end,:))*100)
    fprintf('\n')
fprintf("Percentage service waste emissions : %f %", histo(end,3)/sum(histo(end,:))*100)
    fprintf('\n')
fprintf("Percentage conservation emissions : %f %", histo(end,4)/sum(histo(end,:))*100)
    fprintf('\n\n')
    
    fprintf("Total emissions without conservation : %f ", sum(histo(end,1:3)))
    fprintf('\n')
fprintf("Percentage production emissions : %f % ", histo(end,1)/sum(histo(end,1:3))*100)
    fprintf('\n')
fprintf("Percentage transport emissions : %f %", histo(end,2)/sum(histo(end,1:3))*100)
    fprintf('\n')
fprintf("Percentage service waste emissions : %f %", histo(end,3)/sum(histo(end,1:3))*100)
    fprintf('\n\n')


  figure
  hold on
  plot(transpose(stat1.TotalCarbonFootprint))
  plot(transpose(stat2.TotalCarbonFootprint))
  plot(transpose(stat3.TotalCarbonFootprint))
  plot(transpose(stat4.TotalCarbonFootprint))
  plot(transpose(stat5.TotalCarbonFootprint))
  xlabel("Requests")
  ylabel("Carbon Footprint in KG CO2-EQ")
  title("Total Carbon Footprint for a Omnivore, local, in restaurant menu: data from different sources")
  legend('source1','source2','source3','source4','source5')
  hold off

% Vegan, less polluting transport, in restaurant
fprintf("Vegan, less polluting transport, in restaurant")
stat1 = commun_proposed_menu(100,1,0,0,0,1,0,'aliment_data_1.csv');
stat2 = commun_proposed_menu(100,1,0,0,0,1,0,'aliment_data_2.csv');
stat3 = commun_proposed_menu(100,1,0,0,0,1,0,'aliment_data_3.csv');
stat4 = commun_proposed_menu(100,1,0,0,0,1,0,'aliment_data_4.csv');
stat5 = commun_proposed_menu(100,1,0,0,0,1,0,'aliment_data_5.csv');
meanCarbon = [mean(stat1.StepCarbonFootprint); mean(stat2.StepCarbonFootprint); mean(stat3.StepCarbonFootprint); mean(stat4.StepCarbonFootprint); mean(stat5.StepCarbonFootprint)];
meanCarbon = mean(meanCarbon);
histo = [histo; meanCarbon];

    fprintf('\n')
fprintf("Total emissions : %f ", sum(histo(end,:)))
    fprintf('\n')
fprintf("Percentage production emissions : %f % ", histo(end,1)/sum(histo(end,:))*100)
    fprintf('\n')
fprintf("Percentage transport emissions : %f %", histo(end,2)/sum(histo(end,:))*100)
    fprintf('\n')
fprintf("Percentage service waste emissions : %f %", histo(end,3)/sum(histo(end,:))*100)
    fprintf('\n')
fprintf("Percentage conservation emissions : %f %", histo(end,4)/sum(histo(end,:))*100)
    fprintf('\n\n')
    
    fprintf("Total emissions without conservation : %f ", sum(histo(end,1:3)))
    fprintf('\n')
fprintf("Percentage production emissions : %f % ", histo(end,1)/sum(histo(end,1:3))*100)
    fprintf('\n')
fprintf("Percentage transport emissions : %f %", histo(end,2)/sum(histo(end,1:3))*100)
    fprintf('\n')
fprintf("Percentage service waste emissions : %f %", histo(end,3)/sum(histo(end,1:3))*100)
    fprintf('\n\n')


% Vegan, more polluting transport, in restaurant
fprintf("Vegan, more polluting transport, in restaurant")
stat1 = commun_proposed_menu(100,1,0,0,0,2,0,'aliment_data_1.csv');
stat2 = commun_proposed_menu(100,1,0,0,0,2,0,'aliment_data_2.csv');
stat3 = commun_proposed_menu(100,1,0,0,0,2,0,'aliment_data_3.csv');
stat4 = commun_proposed_menu(100,1,0,0,0,2,0,'aliment_data_4.csv');
stat5 = commun_proposed_menu(100,1,0,0,0,2,0,'aliment_data_5.csv');
meanCarbon = [mean(stat1.StepCarbonFootprint); mean(stat2.StepCarbonFootprint); mean(stat3.StepCarbonFootprint); mean(stat4.StepCarbonFootprint); mean(stat5.StepCarbonFootprint)];
meanCarbon = mean(meanCarbon);
histo = [histo; meanCarbon];

    fprintf('\n')
fprintf("Total emissions : %f ", sum(histo(end,:)))
    fprintf('\n')
fprintf("Percentage production emissions : %f % ", histo(end,1)/sum(histo(end,:))*100)
    fprintf('\n')
fprintf("Percentage transport emissions : %f %", histo(end,2)/sum(histo(end,:))*100)
    fprintf('\n')
fprintf("Percentage service waste emissions : %f %", histo(end,3)/sum(histo(end,:))*100)
    fprintf('\n')
fprintf("Percentage conservation emissions : %f %", histo(end,4)/sum(histo(end,:))*100)
    fprintf('\n\n')
    
    fprintf("Total emissions without conservation : %f ", sum(histo(end,1:3)))
    fprintf('\n')
fprintf("Percentage production emissions : %f % ", histo(end,1)/sum(histo(end,1:3))*100)
    fprintf('\n')
fprintf("Percentage transport emissions : %f %", histo(end,2)/sum(histo(end,1:3))*100)
    fprintf('\n')
fprintf("Percentage service waste emissions : %f %", histo(end,3)/sum(histo(end,1:3))*100)
    fprintf('\n\n')


% Vegan, local, carton waste
fprintf("Vegan, local, carton waste")
stat1 = commun_proposed_menu(100,1,0,0,0,0,1,'aliment_data_1.csv');
stat2 = commun_proposed_menu(100,1,0,0,0,0,1,'aliment_data_2.csv');
stat3 = commun_proposed_menu(100,1,0,0,0,0,1,'aliment_data_3.csv');
stat4 = commun_proposed_menu(100,1,0,0,0,0,1,'aliment_data_4.csv');
stat5 = commun_proposed_menu(100,1,0,0,0,0,1,'aliment_data_5.csv');
meanCarbon = [mean(stat1.StepCarbonFootprint); mean(stat2.StepCarbonFootprint); mean(stat3.StepCarbonFootprint); mean(stat4.StepCarbonFootprint); mean(stat5.StepCarbonFootprint)];
meanCarbon = mean(meanCarbon);
histo = [histo; meanCarbon];

    fprintf('\n')
fprintf("Total emissions : %f ", sum(histo(end,:)))
    fprintf('\n')
fprintf("Percentage production emissions : %f % ", histo(end,1)/sum(histo(end,:))*100)
    fprintf('\n')
fprintf("Percentage transport emissions : %f %", histo(end,2)/sum(histo(end,:))*100)
    fprintf('\n')
fprintf("Percentage service waste emissions : %f %", histo(end,3)/sum(histo(end,:))*100)
    fprintf('\n')
fprintf("Percentage conservation emissions : %f %", histo(end,4)/sum(histo(end,:))*100)
    fprintf('\n\n')
    
    fprintf("Total emissions without conservation : %f ", sum(histo(end,1:3)))
    fprintf('\n')
fprintf("Percentage production emissions : %f % ", histo(end,1)/sum(histo(end,1:3))*100)
    fprintf('\n')
fprintf("Percentage transport emissions : %f %", histo(end,2)/sum(histo(end,1:3))*100)
    fprintf('\n')
fprintf("Percentage service waste emissions : %f %", histo(end,3)/sum(histo(end,1:3))*100)
    fprintf('\n\n')


% Vegan, local, plastic waste
fprintf("Vegan, local, plastic waste")
stat1 = commun_proposed_menu(100,1,0,0,0,0,2,'aliment_data_1.csv');
stat2 = commun_proposed_menu(100,1,0,0,0,0,2,'aliment_data_2.csv');
stat3 = commun_proposed_menu(100,1,0,0,0,0,2,'aliment_data_3.csv');
stat4 = commun_proposed_menu(100,1,0,0,0,0,2,'aliment_data_4.csv');
stat5 = commun_proposed_menu(100,1,0,0,0,0,2,'aliment_data_5.csv');
meanCarbon = [mean(stat1.StepCarbonFootprint); mean(stat2.StepCarbonFootprint); mean(stat3.StepCarbonFootprint); mean(stat4.StepCarbonFootprint); mean(stat5.StepCarbonFootprint)];
meanCarbon = mean(meanCarbon);
histo = [histo; meanCarbon];

    fprintf('\n')
fprintf("Total emissions : %f ", sum(histo(end,:)))
    fprintf('\n')
fprintf("Percentage production emissions : %f % ", histo(end,1)/sum(histo(end,:))*100)
    fprintf('\n')
fprintf("Percentage transport emissions : %f %", histo(end,2)/sum(histo(end,:))*100)
    fprintf('\n')
fprintf("Percentage service waste emissions : %f %", histo(end,3)/sum(histo(end,:))*100)
    fprintf('\n')
fprintf("Percentage conservation emissions : %f %", histo(end,4)/sum(histo(end,:))*100)
    fprintf('\n\n')
    
    fprintf("Total emissions without conservation : %f ", sum(histo(end,1:3)))
    fprintf('\n')
fprintf("Percentage production emissions : %f % ", histo(end,1)/sum(histo(end,1:3))*100)
    fprintf('\n')
fprintf("Percentage transport emissions : %f %", histo(end,2)/sum(histo(end,1:3))*100)
    fprintf('\n')
fprintf("Percentage service waste emissions : %f %", histo(end,3)/sum(histo(end,1:3))*100)
    fprintf('\n\n')


% HISTOGRAMS
name = categorical({'Vegan, local, in restaurant', 'Vegetarian, local, in restaurant', 'Omnivore, local, in restaurant', 'Vegan, less polluting transport, in restaurant', 'Vegan, more polluting transport, in restaurant', 'Vegan, local, carton waste', 'Vegan, local, plastic waste'});
name = reordercats(name,{'Vegan, local, in restaurant', 'Vegetarian, local, in restaurant', 'Omnivore, local, in restaurant', 'Vegan, less polluting transport, in restaurant', 'Vegan, more polluting transport, in restaurant', 'Vegan, local, carton waste', 'Vegan, local, plastic waste'});



figure
hold on
bar(name, histo,'stacked')
legend('Production', 'Transport', 'Waste', 'Conservation')
ylabel("Mean Carbon Footprint in KG CO2-EQ")
hold off

figure
hold on
bar(name, histo(:,1:3),'stacked')
legend('Production', 'Transport', 'Waste')
ylabel("Mean Carbon Footprint in KG CO2-EQ")
hold off

end
