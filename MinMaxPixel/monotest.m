H=0.5;
A=0.8;
F=zeros(100);
i=1;

%% F��L�������С
for L=0.01:0.01:min(H,A)
    F(i)=(H-L)/(1-L/A);
    i=i+1;
end


figure
plot(F);
