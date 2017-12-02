function iriscode = codificaIris(irisGabor)

tam1 = size(irisGabor,2)*2;

iriscode = zeros(size(irisGabor,1), tam1);

tam2 = size(irisGabor, 2);

c = 1:size(irisGabor, 1);

C1 = real(irisGabor) > 0;
C2 = imag(irisGabor) > 0;

for i = 0:tam2-1
    
    ja = double(2*(i));
    
    iriscode(c, ja + 1) = C1(c, i+1);
    iriscode(c, ja + 2) = C2(c, i+1);
end