function [f, goodness] = log_decrement(data, tops, bottoms, startsec, nrsecs)
% delta = 0;

topindices = find(tops==1);
topindices = topindices(topindices>startsec*10000);
topindices= topindices(topindices < (startsec+nrsecs)*10000);
% firsttop = topindices(1)
% bottomindices = find(tops==1);
% imax = 100;
% jmax = 1500;
% delta = zeros(jmax - imax);
% count  = 1;
% for i = 1:imax
% %     i = 1;
% %     if i > startsec*10000 && i < ((startsec + nrsecs)*10000)
%         for j = i:jmax
%             delta(count) = 1/(topindices(j)-topindices(i))*log(data(topindices(i))/data(topindices(j)));
%             count = count+1;
%         end
% %     end
% end


onlytops = data(topindices);
% plot(topindices,onlytops)
[f, goodness] = fit(topindices,onlytops,'exp1');
hold on 
% plot(topindices,f.a*exp(f.a*topindices))







end