function polar = parseXFoilPolar(filename)
% XFoil polar file parser: extracts metadata and numerical coefficents and 
% restructures in a format compatible with the combiTable in the MSL.
% Returns a struct with fields:
%   - polar.meta: metadata structure
%   - polar.dataTable: table of aerodynamic data
%   - polar.data: aerodynamic data (import into the OET)

fid = fopen(filename, 'r');
if fid == -1
    error('Cannot open file: %s', filename);
end

% Read all lines
lines = {};
while ~feof(fid)
    line = fgetl(fid);
    if ischar(line)
        lines{end+1} = strtrim(line); %#ok<AGROW>
    end
end
fclose(fid);

% --- Extract metadata ---
meta = struct();
dataStart = NaN;
headerLine = '';
for i = 1:numel(lines)
    line = lines{i};
    if contains(line, 'polar for:')
        meta.airfoil = strtrim(extractAfter(line, 'polar for:'));

    elseif contains(line, 'Mach =')
        % Flexible parsing for Mach and Re
        expr = 'Mach =\s*([0-9.eE+-]+)\s*Re =\s*([0-9.eE+-]+)\s*e\s*([0-9]+)\s*Ncrit =\s*([0-9.eE+-]+)';
        tokens = regexp(line, expr, 'tokens');
        if ~isempty(tokens)
            vals = str2double(tokens{1});
            meta.Mach = vals(1);
            meta.Re = vals(2) * 10^vals(3);
            meta.Ncrit = vals(4);
        end

    elseif contains(lower(line), 'alpha') && contains(lower(line), 'cl') && contains(lower(line), 'cd')
        headerLine = line;
        dataStart = i + 2;  % skip dashed line
        break;
    end
end

if isempty(headerLine)
    error('Header line with "Alpha, Cl, Cd, ..." not found.');
end

% --- Process header ---
headers = regexp(strtrim(headerLine), '\s+', 'split');
headers = matlab.lang.makeValidName(headers);

% --- Process numeric data ---
rawDataLines = lines(dataStart:end);
dataMatrix = [];

for j = 1:numel(rawDataLines)
    row = strtrim(rawDataLines{j});
    if isempty(row)
        continue;
    end
    nums = sscanf(row, '%f');
    if numel(nums) == numel(headers)
        dataMatrix(end+1, :) = nums'; %#ok<AGROW>
    else
        warning('Skipping malformed row %d: column mismatch', j + dataStart - 1);
    end
end

if isempty(dataMatrix)
    error('No valid data rows found.');
end

% --- Create output ---
polar.meta = meta;
polar.dataTable = array2table(dataMatrix, 'VariableNames', headers);
polar.data = dataMatrix;

% --- Generate filename and save ---
airfoilStr = strrep(meta.airfoil, ' ', '_');
airfoilStr = regexprep(airfoilStr, '[^a-zA-Z0-9_]', '');

machStr = sprintf('Mach%d', round(meta.Mach));
reStr = regexprep(sprintf('Re%.0e', meta.Re), '\+', ''); 
ncritStr = sprintf('Ncrit%.1f', meta.Ncrit);

filenameOut = sprintf('%s_%s_%s_%s.mat', ...
    airfoilStr, machStr, reStr, ncritStr);

save(filenameOut, '-struct', 'polar');

end
