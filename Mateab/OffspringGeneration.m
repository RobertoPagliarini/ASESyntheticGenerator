function [OffspringAC] = OffspringGeneration(fatherAC,motherAC)
%This function generates new offspring according with the Hardy–Weinberg principle

%Computing dimension of population
[n,m] = size(fatherAC);

%﻿Selection for mating and offspring’s generation
Imates = 1+(var(fatherAC(:,1)) - var(motherAC(:,1)));

p = rand(n,1);

q = 1-p;

p = p >= 0.5;

q = q >= 0.5;

if Imates >= 0

    OffspringAC(:,1) = p.*fatherAC(:,1) + q.*motherAC(:,1);

    OffspringAC(:,2)= p.*fatherAC(:,2) + q.*motherAC(:,2);

    else

        OffspringAC(:,1) = q.*fatherAC(:,1) + p.*motherAC(:,1);

        OffspringAC(:,2) = q.*fatherAC(:,1) + p.*motherAC(:,2);

    end

end