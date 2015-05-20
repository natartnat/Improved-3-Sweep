function [ temp ] = selectOBJ( I,r )

tol = 5;
ms = flood_fill(I,r,tol); 
[m n o] = size(I);

temp = zeros(m,n);
temp(ms) = 1;


end

