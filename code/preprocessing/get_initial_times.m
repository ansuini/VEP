function [tin, ntrials] = get_initial_times(bitcodes, times,  condition)

ind = find(bitcodes == condition);
tin = times(ind);
ntrials = numel(ind);

end