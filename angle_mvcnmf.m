function [Aest,sest] = angle_mvcnmf(A,Aest,sest,c)
CRD = corrcoef([A Aest]);%��������������ϵ��
DD = abs(CRD(c+1:2*c,1:c));% �����ֵ
perm_mtx = zeros(c,c);
aux=zeros(c,1);
for i=1:c
    [ld cd]=find(max(DD(:))==DD); 
    ld=ld(1);cd=cd(1); % in the case of more than one maximum
    perm_mtx(ld,cd)=1; 
    DD(:,cd)=aux; DD(ld,:)=aux';
end
Aest = Aest*perm_mtx;
sest = sest'*perm_mtx;
sest = sest';