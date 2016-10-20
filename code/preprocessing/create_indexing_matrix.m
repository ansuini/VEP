%% create indexing matrix


% creates matrix of indexes to identify neurons uniquely
% with a numerical code
% 
% other info
% -- number of block
% -- cluster inside the block
% -- from auxdata neuron number (check)
% -- from auxdata channel number
% -- from auxdata area
% -- from auxdata and rfdata RF info 
% -- from pars.backgrounds backgrounds
% -- from SPIKES number of spikes

ccc

pars = set_pars();
paths = pars.paths;
bitcodes = pars.bitcodes;
table = pars.table;
blocks = pars.block_strings;
nblocks = numel(blocks);
backgrounds = pars.backgrounds;

%%

I = [];
count = 0;

for i = 1 : nblocks
    
    tic
    
    % load data and auxiliary data
    
    blockdata = load(fullfile(pars.paths.externaldata, 'spikeStructures', blocks{i}, 'SPIKE.mat'));
    blockdata = blockdata.blockdata;
    nclu = numel(blockdata.SPIKES.spikes);
    
    
    rfdata = load(fullfile(pars.paths.externaldata, 'rfquality' ,blocks{i}, 'fitresulto.mat'));
    nrf = numel(rfdata.rsqo);
    
    if nclu ~= nrf
       fprintf('The number of clusters and of receptive field is not equal !There must be some errors... \n') 
    end
    
    
    for j = 1: nclu
        
        auxdata = load(fullfile(paths.externaldata, 'neuronsStructures', blocks{i}, strcat( ['NEURON_', num2str(j),'.mat'  ] ) ) );
        auxdata = auxdata.Neuron.My_Neurons;
        
        count = count + 1;
        
        % numbers
        
        I(count, 1) = count;                         % progressive number
        I(count, 2) = i;                             % progressive number of block
        I(count, 3) = j;                             % progressive number of neuron
        I(count, 4) = auxdata.NeuronNumber;          % progressive number of neuron
        I(count, 5) = auxdata.Channel;
        
        % area
        
        I(count, 6) = get_code_from_area(auxdata.Area);
        
        % rf
        
        I(count, 7) = auxdata.RF.posx;
        I(count, 8) = auxdata.RF.posy;
        I(count, 9) = auxdata.RF.devx;
        I(count, 10) = auxdata.RF.devy;
        I(count, 11) = auxdata.RF.size;
        I(count, 12) = auxdata.RF.coeffa;
        I(count, 13) = auxdata.RF.coeffb;
        I(count, 14) = rfdata.rsqo{j};
        
        % bkg
        
        I(count, 15) = backgrounds(count);
        
        % n of spikes
        
        I(count, 16) = size(blockdata.SPIKES.spikes{j}, 1);
        
               
        
        fprintf([num2str(count), '\n'])
        
    end
    
    toc
    
end

filename = fullfile(pars.paths.home, 'I.mat');
save(filename, 'I')


