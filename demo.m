clear all;
clc;
tic;
%%
load('data5');
[Nb,Np] = size(mixed);
IMG = mixed;
%% Noise filtering 
noise_hat = estNoise(mixed);
IMG = mixed-noise_hat;
clear noise_hat
%% Endmember Extraction
[Aest,Indexes,c] = EndmemberExtraction(IMG,c,Np);
%% Abundance Estimation
[Abf]=AbuEst_NonAndSuM(IMG,Aest',Np,Nb,c);
[Aest,Abf] = angle_mvcnmf(A,Aest,Abf,c);