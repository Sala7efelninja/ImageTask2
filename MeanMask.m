function M = MeanMask(Rows, Column)

Coeff = 1/(Rows*Column);
M = zeros(Rows,Column);

for r =1:Rows
    for c =1:Column
        M(r,c)=Coeff;
    end
end

end

