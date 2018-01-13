clear all
files = dir('*.dat');
for file = files'
    cur_file = file.name;
    csi_trace = read_bf_file(cur_file);
    time = length(csi_trace);
    res = zeros(time,271);
    for i = 1:time
        csi_entry = csi_trace{i};
        res(i,1) = csi_entry.timestamp_low/(1.0e+05);
        csi = get_scaled_csi(csi_entry);
        csi_abs = abs(csi);
        csi_1d = reshape(csi_abs,270,1);
        for j = 1:length(csi_1d)
            res(i,j+1) = csi_1d(j);
        end
    end
    newFileName = strcat(file.name(1:end-4),'-parsed.csv');
    csvwrite(newFileName,res);
end
