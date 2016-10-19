function BCS = get_moving_dots()

n = 4;
ndirs = 8;

BCS = zeros(n,ndirs);
g = [315, 317]';
BCS(1:2,1) = g;
BCS(3:4,1) = g+1;
BCS(:,2) = BCS(:,1) + 6*n;
BCS(:,3) = BCS(:,1) + 1*n;
BCS(:,4) = BCS(:,1) + 4*n;
BCS(:,5) = BCS(:,1) - 1*n;
BCS(:,6) = BCS(:,1) + 5*n;
BCS(:,7) = BCS(:,1) + 2*n;
BCS(:,8) = BCS(:,1) + 3*n;



end