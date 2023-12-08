Skip to content
Product 
Team
Enterprise
Explore 
Marketplace
Pricing 
Search
Sign in
Sign up
dynamicslab
/
databook_matlab
Public
Code
Issues
2
Pull requests
Actions
Projects
Wiki
Security
Insights
databook_matlab/CH01/CH01_SEC02_production.m
@dylewsky
dylewsky Add files via upload
Latest commit ce6cae2 on Mar 3, 2020
 History
 1 contributor
33 lines (28 sloc)  918 Bytes
   
clear all, close all, clc

A=imread('dog.jpg');
X=double(rgb2gray(A));  % Convert RBG to gray, 256 bit to double.
nx = size(X,1); ny = size(X,2);

[U,S,V] = svd(X);

figure, subplot(2,2,1)
imagesc(X), axis off, colormap gray 
title('Original')

plotind = 2;
for r=[5 20 100];  % Truncation value
    Xapprox = U(:,1:r)*S(1:r,1:r)*V(:,1:r)'; % Approx. image
    subplot(2,2,plotind), plotind = plotind + 1;
    imagesc(Xapprox), axis off
    title(['r=',num2str(r,'%d'),', ',num2str(100*r*(nx+ny)/(nx*ny),'%2.2f'),'% storage']);
end
set(gcf,'Position',[100 100 550 400])

%% f_ch01_ex02_2
figure, subplot(1,2,1)
semilogy(diag(S),'k','LineWidth',1.2), grid on
xlabel('r')
ylabel('Singular value, \sigma_r')
xlim([-50 1550])
subplot(1,2,2)
plot(cumsum(diag(S))/sum(diag(S)),'k','LineWidth',1.2), grid on
xlabel('r')
ylabel('Cumulative Energy')
xlim([-50 1550]); ylim([0 1.1])
set(gcf,'Position',[100 100 550 240])
© 2022 GitHub, Inc.
Terms
Privacy
Security
Status
Docs
Contact GitHub
Pricing
API
Training
Blog
About
Loading complete