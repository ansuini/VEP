function AD = adaptData(pars, D)

experiment = pars.experiment;
STIM = D.STIM;
LFP = D.LFP;


switch experiment
    
    
    case 'shape_and_motion'
        
        conditions = pars.conditions.white_flashes ;
        nconditions = numel(conditions);                       
               
        bitcodes = STIM.STIM(:,1);
        times = STIM.STIM(:,2);
        
        LFPd = LFP.LFPd;
        

    case 'TEST_CSD_1'
        
        
        
        conditions = pars.conditions.all ;
        nconditions = numel(conditions);
        
        bitcodes = STIM.data(1: end-1);
        times = STIM.onset(1: end-1);
        
        LFPd = LFP.data;
        
    case 'TEST_CSD_2'
        
       
        conditions = pars.conditions.all ;
        nconditions = numel(conditions);
        
        bitcodes = STIM.data(1: end-1);
        times = STIM.onset(1: end-1);
        
        LFPd = LFP.data;
        
        
    case 'TEST_CSD_3'
        
       
        
        conditions = pars.conditions.all ;
        nconditions = numel(conditions);
        
        % VERIFICARE 
        
        bitcodes = STIM.data(1: end-1);
        times = STIM.onset(1: end-1);
        
        LFPd = LFP.data;
        
        
    otherwise
                
end


AD.conditions = conditions;
AD.nconditions = nconditions;
AD.bitcodes = bitcodes;
AD.times = times;
AD.LFPd = LFPd;


end