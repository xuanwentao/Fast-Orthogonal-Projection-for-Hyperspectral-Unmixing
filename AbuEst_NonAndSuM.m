function [Abundance]=AbuEst_NonAndSuM(IMG,Endmembers,Np,Nb,c)
E = Endmembers';
N = [];
Dis = [];
for i = 1:c
    Q = Endmembers;
    Q(i,:)=[];
    r = rank(Q);
    Gen_sol = null(Q,r);
    n = sum(Gen_sol,2);
    %n = n/norm(n);
    N = [N,n];
end
%%
T = N'*E;
%%
Abundance = (inv(T)*N')*IMG;
Abundance = abs(Abundance);
%% Sum To One
for j = 1:1:Np
        Abundance(:,j) = Abundance(:,j)/sum(Abundance(:,j));
end