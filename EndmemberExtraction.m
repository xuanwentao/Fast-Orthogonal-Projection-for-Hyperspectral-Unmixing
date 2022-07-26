function [Endmembers,Indexes,p] = EndmemberExtraction(IMG,c,N)    
%% ------------------------ Algorithm ------------------------
%% EndmemberExtraction
IMG2 = IMG;
lab=2;
Indexes = []; 
Q=[IMG(:,lab)];
for j = 1:c
    Q = Q';
    r=rank(Q);
    n = null(Q,r);
    n = sum(n,2);
    n = n/norm(n);
    %IMG2 =n*(n'*IMG);
    %IMG3 = n.*IMG;
    IMG2 = abs(n'*IMG);
    for k = 1:1:N
        IMG_error(1,k) = norm(IMG2(:,k));
    end
    [max_Value, max_Index] = max(IMG_error);
    Indexes  = [Indexes,max_Index];
    Q = [IMG(:,Indexes)];
end
p = length(Indexes);
Endmembers = Q;