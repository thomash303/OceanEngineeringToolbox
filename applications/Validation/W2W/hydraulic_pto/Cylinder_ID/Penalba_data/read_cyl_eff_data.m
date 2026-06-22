tbl = readtable('efficiency_curves.xlsx');
headers = tbl.Properties.VariableNames;

curveEfficiencies = [67, 74.5, 78, 81.5, 85, 88.5, 90, 92.5, 95];

cyl_eff = struct();

curveIdx = 1;

for i = 1:2:numel(headers)

    v = tbl.(headers{i});
    p = tbl.(headers{i+1});

    % clean NaNs
    mask = ~isnan(v) & ~isnan(p);
    v = v(mask);
    p = p(mask);

    % store using efficiency label
    eff = curveEfficiencies(curveIdx);
    key = sprintf('E%d', round(eff*10));

    cyl_eff.(key).v = v;
    cyl_eff.(key).p = p;

    curveIdx = curveIdx + 1;

end

save('efficiency_curve_data.mat', 'cyl_eff');