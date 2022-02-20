data = load("DanHendata_014.lvm");
%%
close all 

x = 1:length(data);
% x1 = 1:length(data);
delta = 0.3396 ;
startsec = 3;
y = .0238*exp(-delta*x);


plot(x, data-mean(data))
hold on 
plot(x+ startsec*10000,y)





