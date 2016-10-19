function conditions = set_conditions_groups(experiment)


conditions = struct();


switch experiment
    
    case 'shape_and_motion'
        
        conditions.all = 1:342;
        conditions.white_flashes = [1,2,3];
            
        
    case 'CSD_TEST_1'
        
        conditions.all = 1:50;
        conditions.white_flash = 1;
        conditions.checkerboard = 2;       
        gratings = zeros(4, 12);
        gratings(1, : ) = [3:1:14];
        gratings(2, : ) = [15:1:26]; 
        gratings(3, : ) = [27:1:38]; 
        gratings(4, : ) = [39:1:50];
        conditions.moving_gratings = gratings; 
        
    case 'CSD_TEST_2'
        
        conditions.all = 1:51;
        conditions.white_flash = 1;
        conditions.checkerboard = 2;         
        gratings = zeros(4, 12);
        gratings(1, : ) = [3:1:14];
        gratings(2, : ) = [15:1:26]; 
        gratings(3, : ) = [27:1:38]; 
        gratings(4, : ) = [39:1:50];
        conditions.moving_gratings = gratings; 
        conditions.fastCheckerboard = 51;
        
    case 'CSD_TEST_3'
        
        conditions.all = 1:51;
        conditions.white_flash = 1;
        conditions.checkerboard = 2;         
        gratings = zeros(4, 12);
        gratings(1, : ) = [3:1:14];
        gratings(2, : ) = [15:1:26]; 
        gratings(3, : ) = [27:1:38]; 
        gratings(4, : ) = [39:1:50];
        conditions.moving_gratings = gratings; 
        conditions.fastCheckerboard = 51;
        
        
    otherwise
        fprintf('Experiment not available. \n')
end



end