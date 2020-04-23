
x=[1 0];
Y=[];
m=8;
for i=1:(8*8)
    Y=[Y x];
end
k=1;
z=[];
for i=1:m
    for j=1:m
        z(i,j)=Y(k);
        k=k+1;
    end
end
for i=1:m
    for j=1:m
        if(rem(i,2)==0)
            if(z(i,j)==1)
                z(i,j)=0;
            else
                z(i,j)=1;
            end
        end
    end
end
temp=1;
remp=1;
x=0:8;
y=0:8;
for i=1:length(x)-1
    for j=1:length(y)-1
        if(z(temp,remp)==0)
        fill([x(i) x(i+1) x(i+1) x(i)],[y(j) y(j) y(j+1) y(j+1)],'k');
        else
            fill([x(i) x(i+1) x(i+1) x(i)],[y(j) y(j) y(j+1) y(j+1)],'w');
        end
        remp=remp+1;
        hold on;
        axis square;
        pause(0.5);
    end
    temp=temp+1;
    remp=1;
    hold on;
    axis square;
    pause(0.2);
end