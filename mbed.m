function xy = mbed(D,ndims)

% MBED -  Computes low dimensional embedding of the input
%
% D = shortest path distance matrix between all points
% ndims = number of dimensions for low dimensional embedding
% xy = low dimensional embedding of the input space
%

if (nargin < 1)
   error('Not enough input arguments');
end

if (nargin < 2)
   ndims = 2;    % by default, take 2 dimensions
end

N = rows(D);

opt.disp = 0; opt.isreal = 1; opt.issym = 1; 
M = -.5*(D.^2 - sum(D.^2)'*ones(1,N)/N - ones(N,1)*sum(D.^2)/N + sum(sum(D.^2))/(N^2));
[xy, val] = eigs(M, ndims, 'LR', opt);

for i=1:ndims
    xy(:,i) = xy(:,i)*sqrt(val(i,i));
end

return
