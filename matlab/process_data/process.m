clear all
files = dir('*.dat');
for file = files'
    disp(file.name);
end