clear

BeaverN=5;

%% for [http://www.catonmat.net/blog/busy-beaver/]
%% [0:write,move,nextstate,1:write,move,nextstate]


Beaver{1}=[1,+1,-99]; %a=h1r
Beaver{2}=[1,+1,2,1,-1,2;1,-1,1,1,+1,-99]; %Pos0=3, a=b1rb1l b0=a1lh1r
Beaver{3}=[1,+1,2,1,+1,-99;0,+1,3,1,+1,2;1,-1,3,1,-1,1];%Pos0=2, a=b1rh1r b=c0rb1r c=c1la1l
Beaver{4}=[1,+1,2,1,-1,2;1,-1,1,0,-1,3;1,+1,-99,1,-1,4;1,+1,4,0,+1,1]; %Pos0=11, a=b1rb1l b=a1lc0l c=h1rd1l d=d1ra0r
Beaver{5}=[1,-1,2,1,-1,1;1,+1,3,1,+1,2;1,-1,1,1,+1,4;1,-1,1,1,+1,5;1,+1,-99,0,+1,3]; %Pos0=30, a=b1la1l b=c1rb1r c=a1ld1r d=a1le1r e=h1rc0r

%% Init
Cards=Beaver{BeaverN};
Pos=30; PosMax=Pos; PosMin=Pos;
Memory=zeros(1,6146);
ActionsEnumerate=1:3;
CardToUse=1;
i=0;

%% Run
tic
while CardToUse>0
    i=i+1;
    Actions=Cards(CardToUse,Memory(Pos)*3+ActionsEnumerate);
    Memory(Pos)=Actions(1);
    Pos=Pos+Actions(2);
    CardToUse=Actions(3);
    if Pos<PosMin, PosMin=Pos;end
    if Pos>PosMax, PosMax=Pos;end
end
toc

%% Display
MemChunk=Memory(PosMin:PosMax);
disp( [BeaverN, i,sum(MemChunk)] );
