function pars = set_pars(varargin)

% set parameters of CSD analysis
%
% usage     : pars = set_pars_csd(experiment)
% 
% example   : pars = set_pars_csd('CSD_TEST_1')

pars = struct();
pars.paths.home = fullfile('/home','ans','repositories','sissa','VEP'); 
addpath(genpath(pars.paths.home)); 
pars.paths.results = fullfile(pars.paths.home, 'results');

if numel(varargin) < 1
    
    experiment = 'shape_and_motion';
    pars.paths.data = fullfile('/media','ans','falassio','DATA','Federica','data_lfp');
    pars.paths.externaldata = fullfile('/home','ans','Dropbox','Anansi','data');
    pars.areas_labels = {'V1b', 'LM', 'AL', 'LI', 'LL', 'LLb'};
    pars.areas_colors = {'b', 'r', 'm', 'g', 'c', 'y'};

    load(fullfile(pars.paths.home, 'areas.mat'))
    load(fullfile(pars.paths.home, 'bitcodes.mat'))
    load(fullfile(pars.paths.home, 'block_strings.mat'))
    load(fullfile(pars.paths.home, 'table.mat'))
    load(fullfile(pars.paths.home,'lambdas_black_blanks.mat'));
    
    pars.backgrounds = lambdas;
    pars.areas = J;
    pars.bitcodes = bitcodes;
    pars.block_strings = C;
    pars.table = table;
    

else
    experiment = varargin{1};
end

fprintf(['Analyze vep of experiment : ', experiment,'\n'])
pars.experiment = experiment;
pars.type_electrode = get_type_electrode(experiment);
pars.conditions = set_conditions_groups(experiment);

% electrode 

parts = strsplit(pars.type_electrode, '_');
nshanks = str2num(parts{1});
nchannels = str2num(parts{3});
nch_shank = nchannels/nshanks;
pars.nshanks = nshanks;
pars.nchannels = nchannels;
pars.nch_shank = nch_shank;

% frequency sampling

pars.fs_lfp = 1.5259e+03;
pars.fs_raw = 24414.0625;

% filter design (to remove 50 Hz oscillation)

wo = 50/(pars.fs_lfp/2);  
bw = wo/35;
[b,a] = iirnotch(wo,bw);
pars.filter.a = a;
pars.filter.b = b;

% window

pars.window.before = 0.1;
pars.window.duration = 2.9;
pars.window.npoints = round((pars.window.duration + pars.window.before)*pars.fs_lfp); 
pars.window.time_lfp = [1:1:pars.window.npoints]/pars.fs_lfp - 0.1;

% sorting

pars.w_pre = 20;
pars.w_post = 44;
pars.ref_ms = 1.5;
pars.ref = floor(pars.ref_ms * pars.fs_raw/1000);
pars.stdmin = 4;
pars.stdmax = 20;
pars.fmin = 300;
pars.fmax = 3000;

% wavelet analysis

% (1 = Morlet, 2 = Paul(m=4), 3 = DOG(m=2), 4= DOG(m=6));

pars.mother_wavelet = 'Morlet';

% Octaves, voices & scales

pars.n_octaves = 13;
% inverse of n. of intervals per octave
pars.dj = 0.05;  
pars.J = pars.n_octaves/pars.dj;  % n. of powers-of-two (octaves) 
                                  % with 1/dj intervals each
pars.n_scales = pars.J + 1;

% standardize data

pars.istand = 0;

% tests in w_transf 

pars.flag_tests = 1;

% gamma range

pars.gamma_on = 20;
pars.gamma_off = 80;


end