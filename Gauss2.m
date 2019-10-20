function M = Gauss2(Sig)
N = fix(3.7 * Sig - 0.5);
Size = 2*N+1;
M = zeros(Size,Size);
Sum =0 ;
x=fix(-Size/2);
y=fix(Size/2);

m=1;
for r =x:y
    o=1;
    for c =x:y
        M(o,m)= exp(-(r^2+c^2)/(2*Sig^2))/(2*pi*Sig^2);
        Sum = Sum + M(o,m);
         o = o+1;
    end
    m=m+1;
end
for r =1:Size
    for c =1:Size
        M(r,c)= M(r,c)/Sum;
    end
end
end

