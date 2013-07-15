function L = PCA(D)

% Does Principal Component Analysis on the given Data set D
% Input D contains points of the data
% D is nxm where n is the number of points and m is the dimension
%


if (nargin < 1)
   error('Not enough input arguments');
end

D = D';

[M N] = size(D);

mn = mean(D,2);
D = D - repmat(mn,1,N);

covariance = 1/(N-1) * D * D';

[PC,V] = eig(covariance);

V = diag(V);

[junk, rindices] = sort(-1*V);
V = V(rindices);

PC = PC(:,rindices);

signals = PC' * D;

L = signals';

return
