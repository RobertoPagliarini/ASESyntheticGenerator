function [SynthAlleles,SynthCounts,IndividualLabels] = ASE_syntheticGenerator(ChDataset,nIter)

%Load chromosome dataset
Data = load(ChDataset);

Data = Data.Output;

%Alleles matrix
Alleles = Data.PopulationAlleleIndexesMatrix;

%Read counts matrix
Counts = Data.PopulationAlleleCountsMatrix;

%Computing size of read counts matrix
[nD,mD] = size(Counts);

%Individual Labels
IndividualLabels = Data.IndividualNames;

%Generating synthetic individuals.
%New data are added to the real dataset
%[numAll,childsAll,childsCounts] = EMA_SyntheticPopulationGenerator(Alleles,Counts,nIter);
[numAll,childsAll,childsCounts,Perc] = EMA_SyntheticPopulationGenerator_V2(Alleles,Counts,nIter);

%Computing number of synthetic individuals
[n,m] = size(childsAll);

%%%%Mapping the generated individuals to right format
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
SynthAlleles = zeros(sum(numAll),m);

SynthCounts = zeros(sum(numAll),m);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

GeneratedSynteticIndividuals = 0;

for i = 1:m

    [MappedAlleles, MappedCounts] = InvidualMapping(numAll,childsAll(:,i),childsCounts(:,i));

    SynthAlleles(:,i) = MappedAlleles;

    SynthCounts(:,i) = MappedCounts;

    if i > mD

        IndividualLabels{i,1} = strcat('Synth',num2str(i-mD));

        GeneratedSynteticIndividuals = GeneratedSynteticIndividuals + 1;

    end

end

%Computing dimension of the new dataset (real + synthetic)
[nS,mS] = size(SynthCounts);

%Rondom selection of half of the individuals
r = sort(randi(round(mS/2),1,mS));

subSynthCounts = SynthCounts(:,r);

subSynthAlleles = sign(subSynthCounts);

subIndividualLabels = IndividualLabels{r,1};

ceil((mS/100)*30)

%Synthetic Data Generation by Sequential Monte Carlo
[Syn_Count,Syn_All] = SDGSMC_ASE(subSynthCounts,ceil((mS/100)*30));

[nS2,mS2] = size(Syn_Count);

SynthAlleles = [SynthAlleles,Syn_All];

SynthCounts = [SynthCounts,Syn_Count];

for i = GeneratedSynteticIndividuals+1:GeneratedSynteticIndividuals+mS2

    IndividualLabels{end+1,1} = strcat('Synth',num2str(i));

end

