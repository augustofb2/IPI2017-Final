function distancia = HammingDistance(iriscode1, iriscode2)

iriscode1 = logical(iriscode1);
iriscode2 = logical(iriscode2);

N = size(iriscode1, 1) * size(iriscode1, 2);
S = xor(iriscode1, iriscode2);

dif = sum(sum(S==1));

distancia = dif/N;

end

