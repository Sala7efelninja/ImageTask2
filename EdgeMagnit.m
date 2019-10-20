function G = EdgeMagnit(I)

F1 = Sobel('H');
X = LinearFilter(I,F1, 'absolute');
F2 = Sobel('V');
Y = LinearFilter(I,F2, 'absolute');
S=X+Y;
imshow(S);
S = double(X+Y);
G = det(S);
end

