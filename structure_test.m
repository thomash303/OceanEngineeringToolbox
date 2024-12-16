test = {};

for i = 1:2
    % Create a new field name dynamically
    fieldName = sprintf('number%d', i); 
    
    % Perform the operation and assign to the new field
    test.(fieldName) = [i i];
end

save('testing.mat','test')