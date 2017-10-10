function saveInFile(filename, txt)

fid = fopen(filename,'w');
fprintf(fid,'%s\n','498:800');
for i = 1:size(txt)
    fprintf(fid,'%s\n',txt(i,:));
end
fclose(fid);
end
