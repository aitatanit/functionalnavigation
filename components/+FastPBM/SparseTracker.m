classdef SparseTracker < tom.Sensor
  
  methods (Access=protected, Static=true)
    % Protected constructor
    %
    % @param[in] initialTime less than or equal to the time stamp of the first data node
    function this = SparseTracker(initialTime)
      this = this@tom.Sensor(initialTime);
    end
  end
  
  methods (Abstract=true, Access=public, Static=false)
    % Check whether the sensor frame moves relative to the body framer
    %
    % @param[out] flag true if the offset can change or false otherwise (MATLAB: bool scalar)
    flag = isFrameDynamic(this);
    
    % Get sensor frame position and orientation relative to the body frame
    %
    % @param[in]  node data index (MATALB: uint32 scalar)
    % @param[out] pose position and orientation of sensor origin in the body frame (MATLAB: Pose scalar)
    %
    % NOTES
    % Sensor frame axis order is forward-right-down relative to the body frame
    % Throws an exception when the data index is invalid
    pose = getFrame(this, node);
    
    % Number of features associated with a data node
    %
    % @param[in] node data index (MATLAB: uint32 scalar)
    % @return         number of features associated with the data index (MATLAB: uint32 M-by-1)
    %
    % NOTES
    % Throws an exception when the data index is invalid
    num = numFeatures(this, node);
    
    % Find matching features given a pair of nodes
    %
    % @param[in]  nodeA       first data index (MATLAB: uint32 scalar)
    % @param[in]  nodeB       second data index (MATLAB: uint32 scalar)
    % @param[out] localIndexA zero-based feature indices local to the first node (MATLAB: uint32 1-by-P)
    % @param[out] localIndexB zero-based feature indices local to the second node (MATLAB: uint32 1-by-P)
    %
    % NOTES
    % Throws an exception if either node index is invalid
    [localIndexA, localIndexB] = findMatches(this, nodeA, nodeB);
    
    % Get ray vector corresponding to the direction of a feature relative to the sensor frame
    %
    % @param[in] node       data index (MATLAB: uint32 scalar)
    % @param[in] localIndex zero-based feature indices relative to the specified node (MATLAB: uint32 1-by-P)
    % @return               unit vector in the sensor frame (MATLAB: double 3-by-P)
    %
    % NOTES
    % Throws an exception if either the node or the feature index are invalid
    % @see getFeatures()
    ray = getFeatureRay(this, node, localIndex);
  end

end
