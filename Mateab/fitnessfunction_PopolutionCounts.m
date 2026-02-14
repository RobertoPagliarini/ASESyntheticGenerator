function [Dist] = fitnessfunction_PopolutionCounts(PopulationCounts,OffspringCounts)

% D = pdist([OffspringCounts,PopulationCounts]);
% 
% Z = squareform(D);
% 
% Dist = mean(Z(1,2:end));

v = round(mean(PopulationCounts'));
 
Dist = pdist2(v,OffspringCounts');

%[n,m] = size(PopulationCounts);

% Dist = 0;
% 
% for i = 1:m
% 
%     Dist = Dist + pdist2(PopulationCounts(:,i)',OffspringCounts');
% 
% end
% 
% Dist = Dist/m;