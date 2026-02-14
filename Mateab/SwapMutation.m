function [OffspringAC] = SwapMutation(OffspringAC,point1,point2)
%We select two positions on the chromosome at random, and and the counts values 
%are interchanged. 

count1 = OffspringAC(point1,2);

count2 = OffspringAC(point2,2);

OffspringAC(point1,2) = count2;

OffspringAC(point2,2) = count1;

end