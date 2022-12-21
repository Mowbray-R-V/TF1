%%% compute joint torque, pelvic forces and  GRFs 
function vars = double_stance_lag(q,qdot,qddot,varsDS)
%%%
global L r m MI misc g
%%%
L2 = L(1);
L3 = L(2);
L4 = L(3);
L5 = L(4);
r2 = r(1);
r3 = r(2);
r4 = r(3);
r5 = r(4);
m1 = m(1);
m2 = m(2);
m3 = m(3);
m4 = m(4);
m5 = m(5);
m6 = m(6);
m7 = m(7);
MI1 = MI(1);
MI2 = MI(2);
MI3 = MI(3);
MI4 = MI(4);
MI5 = MI(5);
MI6 = MI(6);
MI7 = MI(7);

R2 = misc(1);
R3 = misc(2);
del2 = misc(3);
del3 = misc(4);
gamma61 = misc(5);
gamma62 = misc(6);
gamma71 = misc(7);
gamma72 = misc(8);
gammamid = misc(9);


r6 = varsDS(1);
r7 = varsDS(2);
r6 = varsDS(3);
r7 = varsDS(4);

%%%
x1 = q(1);
y1 = q(2);
tht1 = q(3);
tht2 = q(4);
tht3 = q(5);
tht4 = q(6);
tht5 = q(7);
tht6 = q(8);
tht7 = q(9);
vx1 = qdot(1);
vy1 = qdot(2);
omg1 = qdot(3);
omg2 = qdot(4);
omg3 = qdot(5);
omg4 = qdot(6);
omg5 = qdot(7);
omg6 = qdot(8);
omg7 = qdot(9);
ax1 = qddot(1);
ay1 = qddot(2);
alp1 = qddot(3);
alp2 = qddot(4);
alp3 = qddot(5);
alp4 = qddot(6);
alp5 = qddot(7);
alp6 = qddot(8);
alp7 = qddot(9);

 Amat=[(-1),0,0,0,0,0,0,0,0,0,0;0,(-1),0,0,0,0,0,0,0,(-1).*n1y,0;0,0,( ...
  -1),1,0,0,1,0,0,n1y.*R2.*cos(del2+(-1).*tht1),0;0,0,0,(-1),1,0,0, ...
  0,0,L2.*n1y.*cos(tht2),0;0,0,0,0,(-1),1,0,0,0,L3.*n1y.*cos(tht3), ...
  0;0,0,0,0,0,(-1),0,0,0,n1y.*r4.*cos(tht4)+(-1).*n1y.*r4c.*cos( ...
  gamma43+tht4),0;0,0,0,0,0,0,(-1),1,0,0,0;0,0,0,0,0,0,0,(-1),1,0,0; ...
  0,0,0,0,0,0,0,0,(-1),0,0;0,0,(-1),0,0,0,0,0,0,r1,r2;0,0,0,0,0,0,0, ...
  0,0,1,1];


 Bmat=[(-1).*ax1.*m1+(-1).*m2.*(ax1+R2.*(omg1.^2.*cos(del2+(-1).*tht1)+( ...
  -1).*alp1.*sin(del2+(-1).*tht1))+r2.*(omg2.^2.*cos(tht2)+alp2.* ...
  sin(tht2)))+(-1).*m3.*(ax1+L2.*omg2.^2.*cos(tht2)+omg3.^2.*r3.* ...
  cos(tht3)+R2.*(omg1.^2.*cos(del2+(-1).*tht1)+(-1).*alp1.*sin(del2+ ...
  (-1).*tht1))+alp2.*L2.*sin(tht2)+alp3.*r3.*sin(tht3))+(-1).*m4.*( ...
  ax1+L2.*omg2.^2.*cos(tht2)+L3.*omg3.^2.*cos(tht3)+omg4.^2.*r4.* ...
  cos(tht4)+R2.*(omg1.^2.*cos(del2+(-1).*tht1)+(-1).*alp1.*sin(del2+ ...
  (-1).*tht1))+alp2.*L2.*sin(tht2)+alp3.*L3.*sin(tht3)+alp4.*r4.* ...
  sin(tht4))+(-1).*m5.*(ax1+R3.*(omg1.^2.*cos(del3+tht1)+alp1.*sin( ...
  del3+tht1))+r5.*(omg5.^2.*cos(tht5)+alp5.*sin(tht5)))+(-1).*m6.*( ...
  ax1+L5.*omg5.^2.*cos(tht5)+omg6.^2.*r6.*cos(tht6)+R3.*(omg1.^2.* ...
  cos(del3+tht1)+alp1.*sin(del3+tht1))+alp5.*L5.*sin(tht5)+alp6.* ...
  r6.*sin(tht6))+(-1).*m7.*(ax1+L5.*omg5.^2.*cos(tht5)+L6.*omg6.^2.* ...
  cos(tht6)+omg7.^2.*r7.*cos(tht7)+R3.*(omg1.^2.*cos(del3+tht1)+ ...
  alp1.*sin(del3+tht1))+alp5.*L5.*sin(tht5)+alp6.*L6.*sin(tht6)+ ...
  alp7.*r7.*sin(tht7)),(-1).*ay1.*m1+(-1).*g.*m1+(-1).*g.*m2+(-1).* ...
  g.*m3+(-1).*g.*m4+(-1).*g.*m5+(-1).*g.*m6+(-1).*g.*m7+(-1).*m2.*( ...
  ay1+(-1).*R2.*(alp1.*cos(del2+(-1).*tht1)+omg1.^2.*sin(del2+(-1).* ...
  tht1))+r2.*((-1).*alp2.*cos(tht2)+omg2.^2.*sin(tht2)))+(-1).*m3.*( ...
  ay1+(-1).*alp2.*L2.*cos(tht2)+(-1).*alp3.*r3.*cos(tht3)+(-1).*R2.* ...
  (alp1.*cos(del2+(-1).*tht1)+omg1.^2.*sin(del2+(-1).*tht1))+L2.* ...
  omg2.^2.*sin(tht2)+omg3.^2.*r3.*sin(tht3))+(-1).*m4.*(ay1+(-1).* ...
  alp2.*L2.*cos(tht2)+(-1).*alp3.*L3.*cos(tht3)+(-1).*alp4.*r4.*cos( ...
  tht4)+(-1).*R2.*(alp1.*cos(del2+(-1).*tht1)+omg1.^2.*sin(del2+(-1) ...
  .*tht1))+L2.*omg2.^2.*sin(tht2)+L3.*omg3.^2.*sin(tht3)+omg4.^2.* ...
  r4.*sin(tht4))+(-1).*m5.*(ay1+R3.*((-1).*alp1.*cos(del3+tht1)+ ...
  omg1.^2.*sin(del3+tht1))+r5.*((-1).*alp5.*cos(tht5)+omg5.^2.*sin( ...
  tht5)))+(-1).*m6.*(ay1+(-1).*alp5.*L5.*cos(tht5)+(-1).*alp6.*r6.* ...
  cos(tht6)+R3.*((-1).*alp1.*cos(del3+tht1)+omg1.^2.*sin(del3+tht1)) ...
  +L5.*omg5.^2.*sin(tht5)+omg6.^2.*r6.*sin(tht6))+(-1).*m7.*(ay1+( ...
  -1).*alp5.*L5.*cos(tht5)+(-1).*alp6.*L6.*cos(tht6)+(-1).*alp7.* ...
  r7.*cos(tht7)+R3.*((-1).*alp1.*cos(del3+tht1)+omg1.^2.*sin(del3+ ...
  tht1))+L5.*omg5.^2.*sin(tht5)+L6.*omg6.^2.*sin(tht6)+omg7.^2.*r7.* ...
  sin(tht7)),(-1).*alp1.*MI1+(-1).*alp1.*(m2+m3+m4).*R2.^2+(-1).* ...
  alp1.*m6.*R3.^2+(-1).*alp1.*m7.*R3.^2+ay1.*m4.*R2.*cos(del2+(-1).* ...
  tht1)+g.*m4.*R2.*cos(del2+(-1).*tht1)+ay1.*m6.*R3.*cos(del3+tht1)+ ...
  g.*m6.*R3.*cos(del3+tht1)+ay1.*m7.*R3.*cos(del3+tht1)+g.*m7.*R3.* ...
  cos(del3+tht1)+(-1).*alp2.*L2.*m4.*R2.*cos(del2+(-1).*tht1+tht2)+( ...
  -1).*alp3.*L3.*m4.*R2.*cos(del2+(-1).*tht1+tht3)+(-1).*alp4.*m4.* ...
  R2.*r4.*cos(del2+(-1).*tht1+tht4)+(-1).*alp5.*L5.*m6.*R3.*cos( ...
  del3+tht1+(-1).*tht5)+(-1).*alp5.*L5.*m7.*R3.*cos(del3+tht1+(-1).* ...
  tht5)+(-1).*alp6.*L6.*m7.*R3.*cos(del3+tht1+(-1).*tht6)+(-1).* ...
  alp6.*m6.*R3.*r6.*cos(del3+tht1+(-1).*tht6)+(-1).*alp7.*m7.*R3.* ...
  r7.*cos(del3+tht1+(-1).*tht7)+ax1.*m4.*R2.*sin(del2+(-1).*tht1)+( ...
  -1).*ax1.*m6.*R3.*sin(del3+tht1)+(-1).*ax1.*m7.*R3.*sin(del3+tht1) ...
  +L2.*m4.*omg2.^2.*R2.*sin(del2+(-1).*tht1+tht2)+m2.*R2.*(ay1.*cos( ...
  del2+(-1).*tht1)+g.*cos(del2+(-1).*tht1)+(-1).*alp2.*r2.*cos(del2+ ...
  (-1).*tht1+tht2)+ax1.*sin(del2+(-1).*tht1)+omg2.^2.*r2.*sin(del2+( ...
  -1).*tht1+tht2))+L3.*m4.*omg3.^2.*R2.*sin(del2+(-1).*tht1+tht3)+ ...
  m3.*R2.*(ay1.*cos(del2+(-1).*tht1)+g.*cos(del2+(-1).*tht1)+(-1).* ...
  alp2.*L2.*cos(del2+(-1).*tht1+tht2)+(-1).*alp3.*r3.*cos(del2+(-1) ...
  .*tht1+tht3)+ax1.*sin(del2+(-1).*tht1)+L2.*omg2.^2.*sin(del2+(-1) ...
  .*tht1+tht2)+omg3.^2.*r3.*sin(del2+(-1).*tht1+tht3))+m4.*omg4.^2.* ...
  R2.*r4.*sin(del2+(-1).*tht1+tht4)+(-1).*L5.*m6.*omg5.^2.*R3.*sin( ...
  del3+tht1+(-1).*tht5)+(-1).*L5.*m7.*omg5.^2.*R3.*sin(del3+tht1+( ...
  -1).*tht5)+(-1).*m5.*R3.*(alp1.*R3+(-1).*ay1.*cos(del3+tht1)+(-1) ...
  .*g.*cos(del3+tht1)+alp5.*r5.*cos(del3+tht1+(-1).*tht5)+ax1.*sin( ...
  del3+tht1)+omg5.^2.*r5.*sin(del3+tht1+(-1).*tht5))+(-1).*L6.*m7.* ...
  omg6.^2.*R3.*sin(del3+tht1+(-1).*tht6)+(-1).*m6.*omg6.^2.*R3.*r6.* ...
  sin(del3+tht1+(-1).*tht6)+(-1).*m7.*omg7.^2.*R3.*r7.*sin(del3+ ...
  tht1+(-1).*tht7),(-1).*alp2.*L2.^2.*(m3+m4)+(-1).*alp2.*MI2+(-1).* ...
  m2.*r2.*(alp2.*r2+(-1).*ay1.*cos(tht2)+(-1).*g.*cos(tht2)+alp1.* ...
  R2.*cos(del2+(-1).*tht1+tht2)+ax1.*sin(tht2)+omg1.^2.*R2.*sin( ...
  del2+(-1).*tht1+tht2))+(-1).*L2.*m3.*((-1).*ay1.*cos(tht2)+(-1).* ...
  g.*cos(tht2)+alp1.*R2.*cos(del2+(-1).*tht1+tht2)+alp3.*r3.*cos( ...
  tht2+(-1).*tht3)+ax1.*sin(tht2)+omg1.^2.*R2.*sin(del2+(-1).*tht1+ ...
  tht2)+omg3.^2.*r3.*sin(tht2+(-1).*tht3))+(-1).*L2.*m4.*((-1).* ...
  ay1.*cos(tht2)+(-1).*g.*cos(tht2)+alp1.*R2.*cos(del2+(-1).*tht1+ ...
  tht2)+alp3.*L3.*cos(tht2+(-1).*tht3)+alp4.*r4.*cos(tht2+(-1).* ...
  tht4)+ax1.*sin(tht2)+omg1.^2.*R2.*sin(del2+(-1).*tht1+tht2)+L3.* ...
  omg3.^2.*sin(tht2+(-1).*tht3)+omg4.^2.*r4.*sin(tht2+(-1).*tht4)),( ...
  -1).*alp3.*L3.^2.*m4+(-1).*alp3.*MI3+(-1).*m3.*r3.*(alp3.*r3+ ...
  alp2.*L2.*cos(tht2+(-1).*tht3)+(-1).*ay1.*cos(tht3)+(-1).*g.*cos( ...
  tht3)+alp1.*R2.*cos(del2+(-1).*tht1+tht3)+(-1).*L2.*omg2.^2.*sin( ...
  tht2+(-1).*tht3)+ax1.*sin(tht3)+omg1.^2.*R2.*sin(del2+(-1).*tht1+ ...
  tht3))+(-1).*L3.*m4.*(alp2.*L2.*cos(tht2+(-1).*tht3)+(-1).*ay1.* ...
  cos(tht3)+(-1).*g.*cos(tht3)+alp1.*R2.*cos(del2+(-1).*tht1+tht3)+ ...
  alp4.*r4.*cos(tht3+(-1).*tht4)+(-1).*L2.*omg2.^2.*sin(tht2+(-1).* ...
  tht3)+ax1.*sin(tht3)+omg1.^2.*R2.*sin(del2+(-1).*tht1+tht3)+ ...
  omg4.^2.*r4.*sin(tht3+(-1).*tht4)),(-1).*alp4.*MI4+(-1).*alp4.* ...
  m4.*r4.^2+(-1).*m4.*r4.*(alp2.*L2.*cos(tht2+(-1).*tht4)+alp3.*L3.* ...
  cos(tht3+(-1).*tht4)+(-1).*ay1.*cos(tht4)+(-1).*g.*cos(tht4)+ ...
  alp1.*R2.*cos(del2+(-1).*tht1+tht4)+(-1).*L2.*omg2.^2.*sin(tht2+( ...
  -1).*tht4)+(-1).*L3.*omg3.^2.*sin(tht3+(-1).*tht4)+ax1.*sin(tht4)+ ...
  omg1.^2.*R2.*sin(del2+(-1).*tht1+tht4)),(-1).*alp5.*L5.^2.*(m6+m7) ...
  +(-1).*alp5.*MI5+(-1).*m5.*r5.*(alp5.*r5+alp1.*R3.*cos(del3+tht1+( ...
  -1).*tht5)+(-1).*ay1.*cos(tht5)+(-1).*g.*cos(tht5)+(-1).*omg1.^2.* ...
  R3.*sin(del3+tht1+(-1).*tht5)+ax1.*sin(tht5))+(-1).*L5.*(m6.*( ...
  alp1.*R3.*cos(del3+tht1+(-1).*tht5)+(-1).*ay1.*cos(tht5)+(-1).*g.* ...
  cos(tht5)+alp6.*r6.*cos(tht5+(-1).*tht6)+(-1).*omg1.^2.*R3.*sin( ...
  del3+tht1+(-1).*tht5)+ax1.*sin(tht5)+omg6.^2.*r6.*sin(tht5+(-1).* ...
  tht6))+m7.*(alp1.*R3.*cos(del3+tht1+(-1).*tht5)+(-1).*ay1.*cos( ...
  tht5)+(-1).*g.*cos(tht5)+alp6.*L6.*cos(tht5+(-1).*tht6)+alp7.*r7.* ...
  cos(tht5+(-1).*tht7)+(-1).*omg1.^2.*R3.*sin(del3+tht1+(-1).*tht5)+ ...
  ax1.*sin(tht5)+L6.*omg6.^2.*sin(tht5+(-1).*tht6)+omg7.^2.*r7.*sin( ...
  tht5+(-1).*tht7))),(-1).*alp6.*L6.^2.*m7+(-1).*alp6.*MI6+(-1).* ...
  m6.*r6.*(alp6.*r6+alp1.*R3.*cos(del3+tht1+(-1).*tht6)+alp5.*L5.* ...
  cos(tht5+(-1).*tht6)+(-1).*ay1.*cos(tht6)+(-1).*g.*cos(tht6)+(-1) ...
  .*omg1.^2.*R3.*sin(del3+tht1+(-1).*tht6)+(-1).*L5.*omg5.^2.*sin( ...
  tht5+(-1).*tht6)+ax1.*sin(tht6))+L6.*m7.*((-1).*alp1.*R3.*cos( ...
  del3+tht1+(-1).*tht6)+(-1).*alp5.*L5.*cos(tht5+(-1).*tht6)+ay1.* ...
  cos(tht6)+g.*cos(tht6)+(-1).*alp7.*r7.*cos(tht6+(-1).*tht7)+ ...
  omg1.^2.*R3.*sin(del3+tht1+(-1).*tht6)+L5.*omg5.^2.*sin(tht5+(-1) ...
  .*tht6)+(-1).*ax1.*sin(tht6)+(-1).*omg7.^2.*r7.*sin(tht6+(-1).* ...
  tht7)),(-1).*alp7.*MI7+(-1).*m7.*r7.*(alp7.*r7+alp1.*R3.*cos(del3+ ...
  tht1+(-1).*tht7)+alp5.*L5.*cos(tht5+(-1).*tht7)+alp6.*L6.*cos( ...
  tht6+(-1).*tht7)+(-1).*ay1.*cos(tht7)+(-1).*g.*cos(tht7)+(-1).* ...
  omg1.^2.*R3.*sin(del3+tht1+(-1).*tht7)+(-1).*L5.*omg5.^2.*sin( ...
  tht5+(-1).*tht7)+(-1).*L6.*omg6.^2.*sin(tht6+(-1).*tht7)+ax1.*sin( ...
  tht7)),0,g.*(m1+m2+m3+m4+m5+m7)];


%%% Mass matrix
 Mmat=[m1+m2+m3+m4+m5+m6+m7,0,(-1).*m2.*R2.*sin(del2+(-1).*tht1)+(-1).* ...
  m3.*R2.*sin(del2+(-1).*tht1)+(-1).*m4.*R2.*sin(del2+(-1).*tht1)+ ...
  m5.*R3.*sin(del3+tht1)+m6.*R3.*sin(del3+tht1)+m7.*R3.*sin(del3+ ...
  tht1),L2.*m3.*sin(tht2)+L2.*m4.*sin(tht2)+m2.*r2.*sin(tht2),L3.* ...
  m4.*sin(tht3)+m3.*r3.*sin(tht3),m4.*r4.*sin(tht4),L5.*m6.*sin( ...
  tht5)+L5.*m7.*sin(tht5)+m5.*r5.*sin(tht5),L6.*m7.*sin(tht6)+m6.* ...
  r6.*sin(tht6),m7.*r7.*sin(tht7);0,m1+m2+m3+m4+m5+m6+m7,(-1).*m2.* ...
  R2.*cos(del2+(-1).*tht1)+(-1).*m3.*R2.*cos(del2+(-1).*tht1)+(-1).* ...
  m4.*R2.*cos(del2+(-1).*tht1)+(-1).*m5.*R3.*cos(del3+tht1)+(-1).* ...
  m6.*R3.*cos(del3+tht1)+(-1).*m7.*R3.*cos(del3+tht1),(-1).*L2.*m3.* ...
  cos(tht2)+(-1).*L2.*m4.*cos(tht2)+(-1).*m2.*r2.*cos(tht2),(-1).* ...
  L3.*m4.*cos(tht3)+(-1).*m3.*r3.*cos(tht3),(-1).*m4.*r4.*cos(tht4), ...
  (-1).*L5.*m6.*cos(tht5)+(-1).*L5.*m7.*cos(tht5)+(-1).*m5.*r5.*cos( ...
  tht5),(-1).*L6.*m7.*cos(tht6)+(-1).*m6.*r6.*cos(tht6),(-1).*m7.* ...
  r7.*cos(tht7);(-1).*m2.*R2.*sin(del2+(-1).*tht1)+(-1).*m3.*R2.* ...
  sin(del2+(-1).*tht1)+(-1).*m4.*R2.*sin(del2+(-1).*tht1)+m5.*R3.* ...
  sin(del3+tht1)+m6.*R3.*sin(del3+tht1)+m7.*R3.*sin(del3+tht1),(-1) ...
  .*m2.*R2.*cos(del2+(-1).*tht1)+(-1).*m3.*R2.*cos(del2+(-1).*tht1)+ ...
  (-1).*m4.*R2.*cos(del2+(-1).*tht1)+(-1).*m5.*R3.*cos(del3+tht1)+( ...
  -1).*m6.*R3.*cos(del3+tht1)+(-1).*m7.*R3.*cos(del3+tht1),MI1+(m2+ ...
  m3+m4).*R2.^2+m5.*R3.^2+m6.*R3.^2+m7.*R3.^2,L2.*m3.*R2.*cos(del2+( ...
  -1).*tht1+tht2)+L2.*m4.*R2.*cos(del2+(-1).*tht1+tht2)+m2.*r2.*R2.* ...
  cos(del2+(-1).*tht1+tht2),L3.*m4.*R2.*cos(del2+(-1).*tht1+tht3)+ ...
  m3.*R2.*r3.*cos(del2+(-1).*tht1+tht3),m4.*R2.*r4.*cos(del2+(-1).* ...
  tht1+tht4),L5.*m6.*R3.*cos(del3+tht1+(-1).*tht5)+L5.*m7.*R3.*cos( ...
  del3+tht1+(-1).*tht5)+m5.*R3.*r5.*cos(del3+tht1+(-1).*tht5),L6.* ...
  m7.*R3.*cos(del3+tht1+(-1).*tht6)+m6.*R3.*r6.*cos(del3+tht1+(-1).* ...
  tht6),m7.*R3.*r7.*cos(del3+tht1+(-1).*tht7);L2.*m3.*sin(tht2)+L2.* ...
  m4.*sin(tht2)+m2.*r2.*sin(tht2),(-1).*L2.*m3.*cos(tht2)+(-1).*L2.* ...
  m4.*cos(tht2)+(-1).*m2.*r2.*cos(tht2),L2.*m3.*R2.*cos(del2+(-1).* ...
  tht1+tht2)+L2.*m4.*R2.*cos(del2+(-1).*tht1+tht2)+m2.*r2.*R2.*cos( ...
  del2+(-1).*tht1+tht2),L2.^2.*(m3+m4)+MI2+m2.*r2.^2,L2.*L3.*m4.* ...
  cos(tht2+(-1).*tht3)+L2.*m3.*r3.*cos(tht2+(-1).*tht3),L2.*m4.*r4.* ...
  cos(tht2+(-1).*tht4),0,0,0;L3.*m4.*sin(tht3)+m3.*r3.*sin(tht3),( ...
  -1).*L3.*m4.*cos(tht3)+(-1).*m3.*r3.*cos(tht3),L3.*m4.*R2.*cos( ...
  del2+(-1).*tht1+tht3)+m3.*R2.*r3.*cos(del2+(-1).*tht1+tht3),L2.* ...
  L3.*m4.*cos(tht2+(-1).*tht3)+L2.*m3.*r3.*cos(tht2+(-1).*tht3), ...
  L3.^2.*m4+MI3+m3.*r3.^2,L3.*m4.*r4.*cos(tht3+(-1).*tht4),0,0,0; ...
  m4.*r4.*sin(tht4),(-1).*m4.*r4.*cos(tht4),m4.*R2.*r4.*cos(del2+( ...
  -1).*tht1+tht4),L2.*m4.*r4.*cos(tht2+(-1).*tht4),L3.*m4.*r4.*cos( ...
  tht3+(-1).*tht4),MI4+m4.*r4.^2,0,0,0;L5.*m6.*sin(tht5)+L5.*m7.* ...
  sin(tht5)+m5.*r5.*sin(tht5),(-1).*L5.*m6.*cos(tht5)+(-1).*L5.*m7.* ...
  cos(tht5)+(-1).*m5.*r5.*cos(tht5),L5.*m6.*R3.*cos(del3+tht1+(-1).* ...
  tht5)+L5.*m7.*R3.*cos(del3+tht1+(-1).*tht5)+m5.*R3.*r5.*cos(del3+ ...
  tht1+(-1).*tht5),0,0,0,L5.^2.*(m6+m7)+MI5+m5.*r5.^2,L5.*L6.*m7.* ...
  cos(tht5+(-1).*tht6)+L5.*m6.*r6.*cos(tht5+(-1).*tht6),L5.*m7.*r7.* ...
  cos(tht5+(-1).*tht7);L6.*m7.*sin(tht6)+m6.*r6.*sin(tht6),(-1).* ...
  L6.*m7.*cos(tht6)+(-1).*m6.*r6.*cos(tht6),L6.*m7.*R3.*cos(del3+ ...
  tht1+(-1).*tht6)+m6.*R3.*r6.*cos(del3+tht1+(-1).*tht6),0,0,0,L5.* ...
  L6.*m7.*cos(tht5+(-1).*tht6)+L5.*m6.*r6.*cos(tht5+(-1).*tht6), ...
  L6.^2.*m7+MI6+m6.*r6.^2,L6.*m7.*r7.*cos(tht6+(-1).*tht7);m7.*r7.* ...
  sin(tht7),(-1).*m7.*r7.*cos(tht7),m7.*R3.*r7.*cos(del3+tht1+(-1).* ...
  tht7),0,0,0,L5.*m7.*r7.*cos(tht5+(-1).*tht7),L6.*m7.*r7.*cos(tht6+ ...
  (-1).*tht7),MI7+m7.*r7.^2];



sol = Amat\Bmat;
vars = [sol ;det(Amat);det(Mmat)];

end