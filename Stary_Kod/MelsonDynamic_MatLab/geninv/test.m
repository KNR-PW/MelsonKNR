N = 300000;
inputMatrix = rand(16,19,N);

pinvMatrix = zeros(19,16,N);
ginvMatrix = zeros(19,16,N);

tic
for i=1:N
    pinvMatrix(:,:,i) = pinv(inputMatrix(:,:,i));
end
toc

tic
for i=1:N
    ginvMatrix(:,:,i) = ginv(inputMatrix(:,:,i));
end
toc
