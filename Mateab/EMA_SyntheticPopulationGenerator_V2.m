function [numAll,PopulationAlleles,PopulationCounts,Perc] = EMA_SyntheticPopulationGenerator_V2(PopulationAlleles,PopulationCounts,nIter)

%%Number of allles for each gene
numAll = [];

%Computing number g = n/2 of genes, number n of alleles and number m of individuals in the
%initial population.
[n,m] = size(PopulationAlleles);

g = n/2;

%Mutation percentage
MutPerc = 3/100;

%Number of mutation
nMut = ceil(g*MutPerc); 

Perc = 0; 

%Computing the number of possible alleles for each gene.
for i = 1:2:n

    numAll(end+1,1) = max([PopulationAlleles(i,:),PopulationAlleles(i+1,:)]);

end

%CrossOver
for i = 1:nIter

    Min_Dist = inf;

    for n_Tmp = 1:10

        %Randomly selecting parents
        [fatherAC,motherAC] = ParentsSelection(PopulationAlleles,PopulationCounts);

        [OffspringAC] = OffspringGeneration(fatherAC,motherAC);

        %Mutation
        for j = 1:nMut

            select = rand(1);

            %Scramble mutation
            if select <= 0.34

                [OffspringAC_mutated] = ScrambleMutation(OffspringAC);

            end

            %Swap mutation
            if select > 0.34 & select <= 0.68  

                [OffspringAC_mutated] = SwapMutation(OffspringAC,randi(n),randi(n));

            end

            %Random resetting
            if select > 0.68  

                [OffspringAC_mutated] = RandomResetting(OffspringAC,randi(n),PopulationCounts);

            end
            
        end

        [Dist] = fitnessfunction_PopolutionCounts(PopulationCounts,OffspringAC_mutated(:,2));

        if Dist < Min_Dist

            Tmp_GeneratedAlleles = OffspringAC_mutated(:,1);

            Tmp_GeneratedCounts = OffspringAC_mutated(:,2);

            Min_Dist = Dist;

        end

    end

    %Adding new indiviual in the population
    [nS,mS] = size(PopulationCounts);
    
    PopulationAlleles(:,mS+1) = Tmp_GeneratedAlleles;

    PopulationCounts(:,mS+1)  = Tmp_GeneratedCounts;  

end

end


