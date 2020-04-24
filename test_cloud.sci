
 // example #1
x=-10:10; y=-10:10;m =rand(21,21);
clf()
gcf().color_map = graycolormap(32);
Sgrayplot(x,y,m, strf="011", rect=[-20,-20,20,20])
