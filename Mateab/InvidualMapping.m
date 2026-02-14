function [MappedAlleles, MappedCounts] = InvidualMapping(numAll,Alleles,Counts)

MappedAlleles = [];  

MappedCounts = [];

t = 0;

for i = 1:length(numAll)

    VecAlleles = zeros(numAll(i),1);

    VecCounts = zeros(numAll(i),1);

    if Alleles(i*1+t) ~=0

        VecAlleles(Alleles(i*1+t),1) = 1;

        VecCounts(Alleles(i*1+t),1) = Counts(i*1+t);

    end

    if Alleles(i*2) ~=0

        VecAlleles(Alleles(i*2),1) = 1;

        VecCounts(Alleles(i*2),1) = Counts(i*2);

    end

    MappedAlleles = [MappedAlleles;VecAlleles];

    MappedCounts = [MappedCounts;VecCounts];

    t = t+1; 

end

