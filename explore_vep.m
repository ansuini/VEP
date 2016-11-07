ccc


load('/home/ans/Dropbox/Anansi/data/STLFP/2013_07_02_S_2/S.mat')


%%
M = [];
sf = 3;
bcs = get_static_gratings();
for i = 1:32
    a = squeeze(S.STLFP(i,bcs(2,sf),1:600));
    M = [M; a'];  
end

%% subtract median
N=[];
ms = median(M(:,1:10), 2);
for i = 1:size(M,1);
    t = repmat(ms(i), 1, 600);
    N(i,:) = M(i,:) - t;  
end

%%
figure
plot(N','g')
hold on
plot(N','r')

%% figure
figure
for i = 1:32
    S = reshape(N(i,:), [20,30]);
    imagesc(S)
    pause(1)
end


