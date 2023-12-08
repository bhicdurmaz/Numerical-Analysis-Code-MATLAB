clear all, close all, clc

A=imread('/MATLAB Drive/numerical_analysis/dog.jpg');
X=double(rgb2gray(A)); % Convert RBG->gray, 256 bit->double.
nx=size(X,1)
ny=size(X,2)

imagesc(X), axis off, colormap gray 

size(X)

[U,S,V] = svd(X);

for r=[5 20 100 500];  % Truncation value
    Xapprox = U(:,1:r)*S(1:r,1:r)*V(:,1:r)'; % Approx. image
    figure, imagesc(Xapprox), axis off
    title(['r=',num2str(r,'%d'),', ',num2str(100*r*(nx+ny)/(nx*ny),'%2.2f'),'% storage']);
end
