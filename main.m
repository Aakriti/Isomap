alist = argv();

if(length(alist) < 1)
        fprintf( stderr, "File Name Required\n");
        exit
end

fName = alist{1};
X = load(fName);

x1 = X(:,1);
y1 = X(:,2);
z1 = X(:,3);

%[dummy index] = sort(x1);
%x1 = x1(index);
%y1 = y1(index);
%z1 = z1(index);
%X = [x1 y1 z1];

figure(1);
plot3(x1(1:100), y1(1:100), z1(1:100),'+r',x1(101:200), y1(101:200), z1(101:200),'+c',x1(201:300), y1(201:300), z1(201:300),'+g',x1(301:400), y1(301:400), z1(301:400),'+b');
title("3D Data","fontsize",15);
xlabel("X-axis","fontsize",10);
ylabel("Y-axis","fontsize",10);
zlabel("Z-axis","fontsize",10);
print -djpeg -color 3D.jpeg
print -dpdf -color 3D.pdf



Y = isomap(X,1,8);
x2 = Y(:,1);
y2 = Y(:,2);
figure(2);
plot(x2(1:100), y2(1:100),'+r',x2(101:200), y2(101:200),'+c',x2(201:300), y2(201:300),'+g',x2(301:400), y2(301:400),'+b');
title("ISOMAP","fontsize",15);
ylabel("Y-axis","fontsize",10);
xlabel("X-axis","fontsize",10);
print -djpeg -color Isomap.jpeg
print -dpdf -color Isomap.pdf


Z = PCA(X);
x3 = Z(:,1);
y3 = Z(:,2);
figure(3);
plot(x3(1:100), y3(1:100),'+r',x3(101:200), y3(101:200),'+c',x3(201:300), y3(201:300),'+g',x3(301:400), y3(301:400),'+b');
title("PCA","fontsize",15);
ylabel("Y-axis","fontsize",10);
xlabel("X-axis","fontsize",10);
print -djpeg -color PCA.jpeg
print -dpdf -color PCA.pdf

pause
