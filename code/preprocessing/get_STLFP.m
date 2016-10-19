function S = get_STLFP(pars, folder)

% compute the stimulus triggered LFP for each condition

S = struct();

% extract LFP for all conditions in each channel

nchannels = pars.nchannels;

% load block STIM vector

STIM = load(fullfile(folder, 'STIM.mat'));
STIM = STIM.data;
bitcodes = STIM(:,1);
times = STIM(:,2);
conditions = 1:1:342;

% frequency sampling

fs_lfp = pars.fs_lfp;

% filter design

a = pars.filter.a;
b = pars.filter.b;

% window

before = pars.window.before;
npoints = pars.window.npoints;
nconditions = numel(conditions);

STLFP = zeros(nchannels, nconditions, npoints);

for i = 1 : nchannels 
   
       % load LFP
       
       LFP = load(fullfile(folder, ['LFPd_CH', num2str(i), '.mat']));
       LFPd = LFP.LFPd;
              
       times_lfp = [0 : 1: size(LFPd, 2)]/fs_lfp;

       % filter out the 50 Hz component

       y = filter(b, a, LFPd);
      

       % loop on conditions
       
       for condition = 1 : nconditions
           
           tic
                      
           % get initial times for a condition
           
           [tin, ntrials]  = get_initial_times(bitcodes, times, condition);
           LFPs = zeros(ntrials, npoints);

           for trial  = 1 : ntrials
               t1 = tin(trial) - before;
               ind = find(times_lfp > t1);
               ind1 = ind(1);
               ind2 = ind1 + npoints - 1;
               
               if ind2 < size(y, 2)
                    LFPs(trial, :) = y(ind1 : ind1 + npoints - 1);
               end
               
           end
           
       
           STLFP(i, condition, :) = mean(LFPs, 1);          
           fprintf(['Condition ', num2str(condition), ' Channel ', num2str(i), '\n'])
       
           toc
           
       
       end
end



S.STLFP = STLFP;

end