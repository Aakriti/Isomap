function xy = isomap(X,type,parameter)

% ISOMAP
% 
% X = Input points
% type = 1 for K-isomap, type = 2 for E-isomap
% parameter = value of K or E
%
% xy contains the lower dimensional data points
%
% (E is epsilon here)
%


if (nargin < 1)
   error('Not enough input arguments');
end

if (nargin < 2)
   type = 1;    % by default, run K Isomap
end

if (nargin < 3)
   parameter = 5;    % by default, set parameter(K/E) as 5
end


if (type == 1)
	[A,B] = Kgraph(X,parameter);
end

if (type == 2)
	A = Egraph(X,parameter);
end


D = allspath(A);
xy = mbed(D,2);

