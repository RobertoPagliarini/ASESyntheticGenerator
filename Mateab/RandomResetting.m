function [OffspringAC,mu,sigma] = RandomResetting(OffspringAC,point,PopulationCounts)
%Random Resetting is an extension of the bit flip for the integer representation. 
%In this, a random value from the set of permissible values is assigned to a randomly chosen allele.

%Computing meand and standard deviation
mu = mean(PopulationCounts(point,:));

sigma = std(PopulationCounts(point,:));

if mu == (sigma == 0)

    OffspringAC(point,2) = 1;

else

    data = PopulationCounts(point,:);

    data_nozero = data(data >0); 

    if length(data_nozero) > 10

    
        pd = fitdist(data(data >0)','gamma');

    
        OffspringAC(point,2) = round(gamrnd(pd.a,pd.b,1,1));

    else

        OffspringAC(point,2) = round(mu + sigma);

    end

end