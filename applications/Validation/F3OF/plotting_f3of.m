%% Plotting F-3OF Data

%% Load data
load("F3OF_data.mat")

%% Plotting
tools = {'pds','wdn','inw','wsm','hc'};
dts = {'dt1','dt2'};
motions = {'heave','surge','pitch'};

for d = 1:length(dts)

    dt = dts{d};

    figure('Name', upper(dt))

    for m = 1:length(motions)

        motion = motions{m};

        subplot(3,1,m)
        hold on
        grid on

        for t = 1:length(tools)

            tool = tools{t};

            if strcmp(tool,'hc') && strcmp(motion,'heave')
                continue
            end

            try
                T = F3OF_data.(dt).(tool).(motion);

                plot(T.time, T.value, ...
                    'DisplayName', upper(tool), ...
                    'LineWidth', 1.5)

            catch
                warning('%s %s %s missing', dt, tool, motion)
            end
        end

        title(sprintf('%s %s', upper(dt), upper(motion)))
        xlabel('Time [s]')

        if strcmp(motion,'pitch')
            ylabel('Pitch [rad]')
        else
            ylabel(sprintf('%s [m]', capitalize(motion)))
        end

        legend('Location','best')
        legend box off

    end
end


figure('Name','DT3')

motions_dt3 = {'flap1','flap2'};

for m = 1:2

    subplot(2,1,m)
    hold on
    grid on

    motion = motions_dt3{m};

    for t = 1:length(tools)

        tool = tools{t};

        if strcmp(tool,'hc')
            continue
        end

        try
            T = F3OF_data.dt3.(tool).(motion);

            plot(T.time, T.value, ...
                'DisplayName', upper(tool), ...
                'LineWidth', 1.5)

        catch
            warning('DT3 %s %s missing', tool, motion)
        end
    end

    T = F3OF_data.dt3.hc.(motion);

    plot(T.time, T.value, ...
        'DisplayName', 'HC', ...
        'LineWidth', 1.5)

    title(sprintf('DT3 %s', upper(motion)))
    xlabel('Time [s]')
    ylabel('Pitch [rad]')

    legend('Location','best')
    legend box off

end


function out = capitalize(str)
out = lower(str);
out(1) = upper(out(1));
end