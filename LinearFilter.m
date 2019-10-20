function Out = LinearFilter(I, Filter, Postproc)
I =double(I);
[FR,FC] =size(Filter);

N1 = (FR-1)/2;
N2 = (FC-1)/2;
tmp = padarray(I,[N1 N2]);
[TmpR,TmpC] =size(tmp);

[IR,IC] =size(I);
Out =zeros(IR,IC);

Sum =0;
for row=1:TmpR-FR
    for col=1:TmpC-FC
        ESM = tmp(row:row+FR, col:col+FC);
        for r = 1:FR
            for c=1:FC
                Sum = Sum + (Filter(r,c)*ESM(r,c));
            end
        end
        if(strcmp(Postproc,'cutoff'))
            if Sum>255
                Sum = 255;
            else if Sum<0
                    Sum =0;
                end
            end
        else if(strcmp(Postproc,'absolute'))
                Sum = abs(Sum);
            end
        end
        Out(row,col)=Sum;
        Sum = 0;
    end
end
       

   Out = uint8(Out);
   
end

