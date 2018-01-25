


%input vectors here
M = [-4 -4 2 1 0; 0 1 1 3 0; 0 4 0 2 1; 0 0 0 -2 1];
%number of vectors here
numVec = 4;

e1=M(1,:)/norm(M(1,:));
M(1,:) = e1;

for i = 2:numVec
    y = [0 0 0 0 0];
    for j = 1:i-1
        x = dot(M(i,:),M(j,:)).*M(j,:);
        y = y + x;
    end
    g = M(i,:)-y;
    e = g/norm(g);
    M(i,:) = e;
end
disp(M)
