classdef TestConfig
  properties (Constant = true, GetAccess = public)
    uri = 'hidi:MiddleburyTemple'; % data resource identifier
    dynamicModelName = 'tom'; % dynamic model name
    measureNames = {'tom'}; % cell array of measure names
    initialTime = hidi.getCurrentTime(); % default initial time
    characterizeMeasures = false; % computes values for the measure characterization scorecard
  end
end
