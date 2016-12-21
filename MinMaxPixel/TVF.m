%imΪdouble����  uΪuint8
function u=TVF(im)             %����test����
% im=imread('C:/Users/��Ρ/Desktop/��ҵ����figure/videodehaze/0697_back_L.png');     %��ȡһ��tif��ʽ��waterͼ������Ϊim

im=double(im)/255.0;                %���ɾ���im
% figure(1),imshow(im)     %����ͼ��1��������ʾ�ղŶ�ȡ��imͼ��

[nx,ny]=size(im);            %��ȡ����Ĵ�С��Nx�Ǿ���im���У�Ny�Ǿ������

% rand('state',0);      
% %Ϊ���ܺ����߲�����ͬ�Ľ����������ѡ��0����˼����ָ��״̬�£�������ͬ��������
% rdn=randn(nx,ny);         %�����������һ��������ͼ��ĳߴ�һ���������������Ϊrdn
% sigma1=20;                  %��ֵ�����������20
% noise=sigma1.*rdn;        %��������20����rdn
% imy=im+noise;              %�����ɵ�imyͼ����ԭͼ�����������ͼ�񣬼�imy�Ǻ�����ͼ��
% figure(2),imshow(imy,[]),title(num2str(sigma1)); 
% %����ͼ��2��������ʾ��������ͼ��imy��������������1��ֵ
iteration=500;                                    %������ֹ��ֵ




u_old=im;                                         %���г�ʼ��
tau=0.02;                                          %ϵ��
for n=1:iteration                                %������ʼ���Ǵ�1��500������Ϊ1��Ҳ���ǵ���500��
u=u_old+tau .*(BackwardX( ForwardX(u_old))+BackwardY(ForwardY(u_old)));                  %��ͼ�������ƫ������ʽΪ 
    u_old=u;                                              %�������õ���ͼ��u��������Ϊu-old
    
end                                                        %����
% imtool([im,e,u]);
% imtool(e);
u=uint8(u*255);
% figure(3),imshow(u),title(num2str(n))       %����ͼ��3��������ʾͼ��u������Ϊ��������
% imtool(u)
end                                                        %����
 
function [dx]=BackwardX(u)                           %����BackwardX(u)����
[Ny,Nx] = size(u);   
%��ȡ����u�Ĵ�С,��Ϊ��������ʱ��ֻ��Ҫ������䶯�������������е����ֵߵ�һ�£�����������
dx = u;                                          %��dx��uһ��
dx(2:Ny-1,2:Nx-1)=( u(2:Ny-1,2:Nx-1)-u(2:Ny-1,1:Nx-2)); 
%  �Ծ���������һ��ƫ������ ������ֱ�����ϵĲ�ֵ
% 
dx(:,Nx) = -u(:,Nx-1);
%dx��Nx������Ԫ�ص�ֵ������-u������Nx-1�е�
end                                                           %����
 
function [dy]=BackwardY(u)                             %����BackwardY(u)����
[Ny,Nx] = size(u);                                         %��ȡͼ��U�Ĵ�С
dy = u;                                                      %��dx��uһ��
dy(2:Ny-1,2:Nx-1)=( u(2:Ny-1,2:Nx-1) - u(1:Ny-2,2:Nx-1) );
% , 
dy(Ny,:) = -u(Ny-1,:);                              %dy�е�Ny�е�����Ԫ�ص�ֵ������-u������Ny-1�е�
end                                                     %����
 
function [dx]=ForwardX(u)                         %���庯��ForwardX(u)
[Ny,Nx] = size(u);                                   %��ȡͼ��u�Ĵ�С
dx = zeros(Ny,Nx);                                   %����һ��Ny�У�Nx�е������dx
dx(1:Ny-1,1:Nx-1)=( u(1:Ny-1,2:Nx) - u(1:Ny-1,1:Nx-1) ); 
% ����dx֮ǰ�������������������һ��Ӧ��Ϊ��
% 
end                                                      %����
 
function [dy]=ForwardY(u)                          %���庯��ForwardY(u)
 
[Ny,Nx] = size(u);                                    %��ȡͼ��U�Ĵ�С
dy = zeros(Ny,Nx);                                    %����һ��Ny�У�Nx�е������dx
dy(1:Ny-1,1:Nx-1)=( u(2:Ny,1:Nx-1) - u(1:Ny-1,1:Nx-1) ); 
% ���ڳ�ʼֵȫΪ�㣬��dy�����е����һ��ȫΪ��
% 
end                                                      %����







