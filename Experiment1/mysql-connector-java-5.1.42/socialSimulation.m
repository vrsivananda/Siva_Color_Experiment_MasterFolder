clear;
close all;
rng(1);

%define a neighborhood
nRows = 6;
nCols = 6;
neighborhood = zeros(nRows,nCols);
nPeeps = numel(neighborhood);
pRand = randperm(nPeeps);
neighborhood(pRand(1:18)) = 1;

%Make a display
%figure;
