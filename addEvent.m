
function evSched = addEvent(eventType,firingTime,evSched)

% Add the event
evSched.evList = [evSched.evList; 
		  firingTime, eventType];
evSched.evListLength = evSched.evListLength + 1;
% Sort the list
evSched.evList = sortrows(evSched.evList);
