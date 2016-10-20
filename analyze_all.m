ccc
pars = set_pars;

for i = 1:numel(pars.block_strings)
    
   tic
   s = pars.block_strings{i};
   parts = strsplit(s,'_');
   day = strcat(parts{1},'_',parts{2},'_',parts{3});
   
   if ~strcmp(day,'2013_08_29') && ~strcmp(day,'2013_12_10')

       if length(parts{5}) <= 2           
          folder = fullfile(pars.paths.data, day, ['Block-' parts{5}(2) ]) ;
          resfolder = fullfile(pars.paths.externaldata, 'STLFP', [day,'_S_', parts{5}(2) ]) ;
       else
          folder = fullfile(pars.paths.data, day, ['Block-' parts{5}(3:4) ]) ;
          resfolder = fullfile(pars.paths.externaldata, 'STLFP', [day,'_S_', parts{5}(3:4) ]) ;
       
       end

       S = get_STLFP(pars,folder);
       if ~exist(resfolder, 'dir')
          mkdir(resfolder);
       end

       save(fullfile(resfolder, 'S'), 'S' );
   end
   toc
    
end
