function [freq, topindex, bottomindex] = findfreq(data,startsec,nrsecs)

% tops and bottoms 
average = mean(data);
len = length(data);
tops = zeros(len,1);
bottoms = zeros(len,1);
for ind = 2:len-1
    if data(ind)>data(ind-1)&& data(ind)> data(ind+1)&&data(ind)>average
        tops(ind) = 1;
    elseif data(ind)<data(ind-1)&& data(ind)<data(ind+1)&&data(ind)<average
        bottoms(ind) = 1;
    end
end

figure 
plot(data.*tops,"r*")
hold on 
plot(data.*bottoms,"k*")

% nrsecs = 7;
freq  = length(find(bottoms(10000*startsec:(startsec+nrsecs)*10000)==1))/nrsecs



end