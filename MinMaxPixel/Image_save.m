function Image_save(T)
[a,b]=size(T);
imshow(T,'border','tight','initialmagnification','fit');
set (gcf,'Position',[0,0,b,a]);
axis normal;
saveas(gcf,'C:\Users\��Ρ\Desktop\����ȥ��ʵ��ͼƬ\house1-0.75.jpg')
end