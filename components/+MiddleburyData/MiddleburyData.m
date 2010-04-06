classdef MiddleburyData < MiddleburyData.MiddleburyDataConfig & DataContainer

  properties (GetAccess=private,SetAccess=private)
    sensor
    description
    sensorDescription
    hasRef
    bodyRef
  end
  
  methods (Access=public)
    function this=MiddleburyData
      this=this@DataContainer;
      this.description=['Image data simulating pure translation from the Middlebury stereo dataset. ',...
        'Reference: H. Hirschmuller and D. Scharstein. Evaluation of cost functions for ',...
        'stereo matching. In IEEE Computer Society Conference on Computer Vision ',...
        'and Pattern Recognition (CVPR 2007), Minneapolis, MN, June 2007.'];
      this.sensor{1}=MiddleburyData.CameraSim;
      this.sensorDescription{1}='Forward facing monocular perspective camera fixed at the body origin';
      this.hasRef=true;
      this.bodyRef=MiddleburyData.BodyReference;
    end
    
    function text=getDescription(this)
      text=this.description;
    end
    
    function list=listSensors(this,type)
      assert(isa(type,'char'));
      K=numel(this.sensor);
      flag=false(K,1);
      for k=1:K
        if(isa(this.sensor{k},type))
          flag(k)=true;
        end
      end
      list=uint32(find(flag)-1);
    end
    
    function text=getSensorDescription(this,id)
      assert(isa(id,'uint32'));
      text=this.sensorDescription{id+1};
    end
        
    function obj=getSensor(this,id)
      assert(isa(id,'uint32'));
      obj=this.sensor{id+1};
    end
    
    function flag=hasReferenceTrajectory(this)
      flag=this.hasRef;
    end
    
    function x=getReferenceTrajectory(this)
      x=this.bodyRef;
    end
  end
  
end