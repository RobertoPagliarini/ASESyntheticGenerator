function [OffspringAC,points] = ScrambleMutation(OffspringAC)
%From the entire chromosome, a subset of allels is chosen and their values are shuffled randomly

[n,m] = size(OffspringAC);

points = sort(randi(n,1,2),'ascend');

P = VectorRandomPermutation(OffspringAC(points(1):points(2),2));

OffspringAC(points(1):points(2),2) = P';

end

