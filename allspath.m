function B = allspath(A)

% ALLSPATH -  Computes all pair shortest paths distances
%
% A = input distance matrix between nodes
% B = shortest path distance matrix between all nodes
%

if (nargin < 1)
   error('Not enough input arguments');
end


B=full(A);
B(B==0)=Inf;
C=ones(size(B));
iter=0;
while any(C(:))
    C=B;
    B=min(B,squeeze(min(repmat(B,[1 1 length(B)])+...
        repmat(permute(B,[1 3 2]),[1 length(B) 1]),[],1)));
    C=B-C;
end
B(logical(eye(length(B))))=0;
return
