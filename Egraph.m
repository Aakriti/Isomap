function D = Egraph(X,E)

% EGRAPH - Computes distance graph of nearest neighbors from given input points
% 
% X = Input data
% E = length of neighbourhood
%


if (nargin < 1)
   error('Not enough input arguments');
end

if (nargin < 2)
   E = 2;
end

N = rows(X);
X = X';

D = distance(X,X,1);

for i = 1:N
	for j = 1:N
                if (D(i,j) > E)
                        D(i,j) = 10000;
                endif
	endfor
endfor

return
