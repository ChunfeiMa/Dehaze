% lamda: ��A����Max�ı����仯
% mean_value: ���� ƽ��ֵ
% pro:M_max�г���a�ı���
% L_test:��ע��ͼ����󣬻�ɫ����ΪM_max��ֵ

function [lamda,mean_value,pro,L_test]=cal_lamda(I)
w = size(I,2);
h = size(I,1);%��
d= size(I,3);
Nsum=w*h;

min_p=zeros(h,w);
max_p=zeros(h,w);
% min and max value of I

 for j = 1:w
        for i = 1:h          
            % find min and max value of each pixel
             min_p(i,j) = min(I(i,j,:)); % find min across all channels
             max_p(i,j) = max(I(i,j,:));
             y(i,j)=I(i,j,1)*0.3+I(i,j,2)*0.59+I(i,j,3)*0.11;
        end
 end

 r=floor(max(w,h)/80);
 G=fspecial('average',[r r]);
 M_min=imfilter(min_p,G);
 M_max=imfilter(max_p,G);
 count=0;
  for j = 1:w
        for i = 1:h          
            if M_max(i,j)>0.7
                count = count+1;
             end
           
        end
 end
   pro= count/Nsum;
%    M_sort=reshape(max_p,Nsum,1);
%    M_sort=sort(M_sort);
   mean_value=mean(mean(y));

 %cal Airlight
%    A0=0.5*(max(max(M_min))+max(max(max(I))));       %Min
%    A1=0.9*(max(max(M_min))+min(min(min(I))));       %MinMax
%       A1=max(1.6*mean_value-0.14,0.5);  
%         A1=0.8;  
 %cal Airlight using 0.1%

%  L_minmax=min(M_min(:,:),A1*(1-M_max(:,:))/(1-A1));
%  L_minmax=min(min_p(:,:),A1*(1-max_p(:,:))/(1-A1));
%  L_min=min(min(1.3*mean_value,0.9)*M_min,min_p);

 lamda=zeros(1,50);

 
 T=0;
%  ��L=M_min��Ԫ�ر�ǳ���
for A1=0.02:0.02:0.98
     t=0;
 T= T+1;
 L_minmax=min(M_min(:,:),A1*(1-M_max(:,:))/(1-A1));
 L_test=L_minmax;
 for j = 1:w
        for i = 1:h 
            if(L_minmax(i,j)==M_min(i,j))
            L_test(i,j)=1;
            t= t+1;
            end
        end
   end
 lamda(T)=(Nsum-t)/Nsum;
 
end
 A1=1.5*mean_value-0.14;
 L_minmax=min(M_min(:,:),A1*(1-M_max(:,:))/(1-A1));
 L_test=L_minmax;
  for j = 1:w
        for i = 1:h 
            if(L_minmax(i,j)==M_min(i,j))
            L_test(i,j)=1;
          
            end
        end
   end
end