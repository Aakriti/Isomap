function [kD,D_Symm] = Kgraph(X,K)

% KGRAPH - Computes distance graph of K nearest neighbors from given input points
% 
% X = Input data
% K = number of nearest neighbors
%

if (nargin < 1)
   error('Not enough input arguments');
end

if (nargin < 2)
   K = 10;
end

N = rows(X);
X = X';

D = distance(X,X,1);
kD = 10000*ones(rows(D),columns(D));

for i = 1:N
	for j = 1:K
		index = find(D(i,:) == min(D(i,:)));
		kD(i,index) = D(i,index);
		D(i,index) = max(D(i,:))*1000;
	endfor
endfor

D_Symm = kD;
for i = 1:N
        for j = 1:i
                if  D_Symm(i,j) != D_Symm(j,i)
                        D_Symm(i,j) = min(D_Symm(i,j) , D_Symm(j,i));
                        D_Symm(j,i) = min(D_Symm(i,j) , D_Symm(j,i));
                endif
        endfor
endfor

return
