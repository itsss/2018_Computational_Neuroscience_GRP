popdata=zeros(4); % Pop-Out 그림에 대한 응답 시간 데이터
condata=zeros(4); % conjunction 그림에 대한 응답 시간 데이터
popcnt=zeros(4);
concnt=zeros(4);
trust=1; % 신뢰도(% 단위)

GPCExplain;

for j=1:160 % 160번 실험하므로
    
    pause(0.1); % 2초 대기
    figure;
    arr = ones(16, 1)*10;
    k=randi(16);
    if arr(k)==0
    i=i-1;
    break;
    end
    arr(k)=arr(k)-1;
    if k==1
    N=4;
    popout=1;
    target=1;
    end
    if k==2
    N=4;
    popout=1;
    target=0;
    end
    if k==3
    N=4;
    popout=0;
    target=1;
    end
    if k==4
    N=4;
    popout=0;
    target=0;
    end
    if k==5
    N=8;
    popout=1;
    target=1;
    end
    if k==6
    N=8;
    popout=1;
    target=0;
    end
    if k==7
    N=8;
    popout=0;
    target=1;
    end
    if k==8
    N=8;
    popout=0;
    target=0;
    end
    if k==9
    N=16;
    popout=1;
    target=1;
    end
    if k==10
    N=16;
    popout=1;
    target=0;
    end
    if k==11
    N=16;
    popout=0;
    target=1;
    end
    if k==12
    N=16;
    popout=0;
    target=0;
    end
    if k==13
    N=32;
    popout=1;
    target=1;
    end
    if k==14
    N=32;
    popout=1;
    target=0;
    end
    if k==15
    N=32;
    popout=0;
    target=1;
    end
    if k==16
    N=32;
    popout=0;
    target=0;
    end

    draw(N,target,popout);

    tic; % 시간측정 시작
    waitforbuttonpress; % 찾을시 시간 정지
    close all;
    time=toc; % 시간측정 완료, 소요 시간을 time 변수에 저장
    %plot(1);
    axis([0 30 0 30]);
    response=input('찾으셨으면 1, 존재하지 않으면 0을 입력하고 엔터 키를 눌러주십시오.'); % 사용자 응답 받음

    % 결과 처리
    if(popout) % 팝아웃 그림인가?
        if(target) % 존재하는가?
            if(response) % 존재한다고 답했는가?
                popdata(log2(N)-1)=popdata(log2(N)-1)+time;
                % 데이터 처리
            else
                trust=trust-1/160;
                popcnt(log2(N)-1)=popcnt(log2(N)-1)+1;
                % 잘못된 답변을 할 경우, 신뢰도 감소
            end
        else
            if(response)
                trust=trust-1/160;
            end
        end
    else
        if(target)
            if(response)
                condata(log2(N)-1)=condata(log2(N)-1)+time;
            else
                trust=trust-1/160;
                popcnt(log2(N)-1)=popcnt(log2(N)-1)+1;
            end
        else
            if(response)
                trust=trust-1/160;
            end
        end
    end
end

condata(1)=condata(1)/(10-concnt(1));
condata(2)=condata(2)/(10-concnt(2));
condata(3)=condata(3)/(10-concnt(3));
condata(4)=condata(4)/(10-concnt(4));
popdata(1)=popdata(1)/(10-popcnt(1));
popdata(2)=popdata(2)/(10-popcnt(2));
popdata(3)=popdata(3)/(10-popcnt(3));
popdata(4)=popdata(4)/(10-popcnt(4));

%condata=condata';
plot(1:4,condata(1,:),'k');
hold on;
%popdata=popdata';
plot(1:4,popdata(1,:),'r');
axis auto;
set(gca,'XTick',[1:4]);
set(gca,'XTickLabel',{'4','8','16','32'});
legend('conjunction','popout');
title('Reaction time(s)')
xlabel('size of map')
ylabel('reaction time')
hold off

% 그래프와 신뢰도 띄우기


