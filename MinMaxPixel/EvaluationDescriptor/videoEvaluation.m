clear
%ԭʼ��Ƶ
fileName1 = 'F:/video_seq/dtneu_nebel.avi'; 
obj1 = VideoReader(fileName1);
numFrames1 = obj1.NumberOfFrames;% ֡������
%% 
% �ָ���Ƶ
fileName2 = 'F:/video_seq/nebel_back.avi'; 
obj2 = VideoReader(fileName2);
numFrames2 = obj2.NumberOfFrames;% ֡������
%%
t1=clock;
frame1 = read(obj1,1);
sz1=size(frame1);
frame2 = read(obj2,1);
sz2=size(frame2);

% if((sz1==sz2) && (numFrames1==numFrames2))
w=sz1(1);  %��
h=sz1(2);  %��
d=sz1(3);

for k=1:50
    disp(k);
    % ������ɼ���Ե�ȣ����������ص���Ŀ�ȣ�ƽ���ݶȱȣ�ԭͼ�ɼ��ߣ��ָ�ͼ�ɼ���
    % ���룺ԭͼ���ָ�ͼ
    % function [e1,ns1,r1,Crri,Crr1]=Evaluation(NameOri,NameResto)
    [e1(k),ns1(k),r1(k),Crri(:,:,k),Crr1(:,:,k)]=Evaluation(read(obj1,k),read(obj2,k));
%     f(:,:,:,k)=read(obj1,k);


end
% end