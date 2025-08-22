classdef sampleSystem < matlab.System
    % sampleSystem Add summary here
    %
    % This template includes the minimum set of functions required
    % to define a System object.

     % Public, tunable properties
    properties
        k = 1; % Gain
    end

    % Pre-computed constants or internal states
    properties (Access = private)
    end

    methods (Access = protected)
        function setupImpl(obj)
            % One-time calculations (not used here)
        end

        function y = stepImpl(obj,u)
            % Multiply input by gain
            y = obj.k * u;
        end

        function resetImpl(obj)
            % Reset internal states (not used here)
        end
    end
end