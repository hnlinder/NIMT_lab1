function delta = log_decrement(data, tops, bottoms, startsec, nrsecs)


topindices = find(tops==1);
bottomindices = find(tops==1);
imax = 100;
jmax = 10000;
delta = zeros(jmax - imax);
count  = 1;
for i = 1:imax
%     i = 1;
%     if i > startsec*10000 && i < ((startsec + nrsecs)*10000)
        for j = i:jmax
            delta(count) = 1/(topindices(j)-topindices(i))*log(data(topindices(i))/data(topindices(j)));
            count = count+1;
        end
%     end
end


end