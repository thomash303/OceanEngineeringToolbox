%% Read FOAMM state-space data from a txt file

filepath = 'FOAMM_state_space.txt';

fid = fopen(filepath, 'r');
if fid == -1
    error('Could not open file: %s', filepath);
end

data = struct();
current_field = '';
rows = {};

while ~feof(fid)
    line = strtrim(fgetl(fid));

    if isempty(line)
        continue
    end

    nums = sscanf(line, '%f').';

    if all(isnan(nums))
        % Header line — flush accumulated rows first
        if ~isempty(current_field) && ~isempty(rows)
            FOAMM.(current_field) = vertcat(rows{:});
            rows = {};
        end
        % Sanitise to valid struct field name
        name = regexprep(strtrim(line), '[^a-zA-Z0-9_]', '_');
        name = regexprep(name, '_+', '_');
        name = regexprep(name, '_$', '');
        if ~isletter(name(1)), name = ['f_' name]; end
        current_field = name;

    else
        % Data line — keep non-NaN values
        if ~isempty(nums)
            rows{end+1} = nums;
        end
    end
end

% Flush last field
if ~isempty(current_field) && ~isempty(rows)
    FOAMM.(current_field) = vertcat(rows{:});
end

fclose(fid);

% Print summary
fprintf('Loaded struct from: %s\n', filepath);
fields = fieldnames(FOAMM);
for i = 1:numel(fields)
    f = fields{i};
    fprintf('  %-20s [%dx%d]\n', f, size(FOAMM.(f), 1), size(FOAMM.(f), 2));
end

save('FOAMM_state_space.mat' ,'FOAMM')