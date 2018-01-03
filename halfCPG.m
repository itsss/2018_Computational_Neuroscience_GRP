w11=0.9; w12=-0.44; %set weights: unit 1
w21=0.44; w22=0.9; %set weights: unit 2
V=[1;0]; %input weight matrix
W=[w11 w12 w21 w22]; %feedback weight matrix

W=[0.878, 0.479; -0.479, 0.878]; %reference
W=[0.869, 0.475; -0.475, 0.869]; %decraying

tEnd=100; %set end time
tVec=0:tEnd; %set time vector
nTs=tEnd+1; %find number of time steps
x=zeros(1,nTs); %zero the input vector
start=30; %set the input start time
x(start)=1; %set the input pulse at start time

y=zeros(2,nTs); %zero the output vector
for t=2:nTs, %do for each time step
    y(:,t)=W*y(:,t-1) + V * x(t-1);
end %end loop

%plot results
clf
plot(tVec, x, 'k-.', tVec, y(1,:), 'k', tVec, y(2,:), 'k--','linewidth', 2.5)
xlabel('time step','fontsize',14)
ylabel('input and unit responses', 'fontsize', 14)
legend('input','unit one','unit two')
set(gca, 'linewidth', 2)
set(gca, 'fontsize', 14)
