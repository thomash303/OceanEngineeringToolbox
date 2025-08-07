


polar_5dig = parseXFoilPolar('NACA_63415.txt');

disp(polar_5dig.meta)
head(polar_5dig.dataTable)


save('polar_5dig.mat', '-struct', 'polar_5dig');