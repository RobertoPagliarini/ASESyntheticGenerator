function [fatherAC,motherAC] = ParentsSelection(Alleles,Counts)
%This function computes parents selection

%Computing dimension of population
[n,m] = size(Alleles);

father = 0;

mother = 0;

%Parents Selection
while father == mother

    father = randi(m);

    mother = randi(m);

end

%Parents alleles and counts

%father
fatherAC(:,1) = Alleles(:,father);

fatherAC(:,2) = Counts(:,father);

%mother
motherAC(:,1) = Alleles(:,mother);

motherAC(:,2) = Counts(:,mother);


end