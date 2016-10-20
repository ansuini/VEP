function [blockname, filename] = get_blockname_and_filename_from_index(pars, i)

I = pars.I;
a = I(i, :);
block = a(2);
pnumber = a(3);
blockname = pars.block_strings{block};
filename = strcat(num2str(pnumber), '.mat');


end