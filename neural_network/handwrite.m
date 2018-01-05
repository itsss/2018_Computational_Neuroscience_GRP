%[nPat,nIn]=size(InPat);
for i = 1 : 223
    x1 = InPat(i, :);
    x2 = reshape(x1, [28, 28]);
    imagesc(x2);
    axis square;
    title(DesOut(i));
    drawnow;
    pause(0.1);
end
