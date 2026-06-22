function model = getMotorModel(name)

switch lower(name)

    case 'mccandish'
        model.buildTorqueLS = @buildTorqueLS_mccandish;
        model.buildFlowLS   = @buildFlowLS_mccandish;
        model.evaluate      = @evaluate_mccandish;
        model.unpack        = @unpack_mccandish;

    otherwise
        error('Unknown model');
end

end

%% ================================================
% WILSON MODEL
% ================================================

function [A, b] = buildTorqueLS_mccandish(D, dp, mu, w, x, T_data)

T_mod = x * D * dp / (2*pi);
T_loss = T_mod - T_data;

A = [D*dp*ones(length(w),1),  D*mu*w/(2*pi)];
b = T_loss;

end

function [A, b] = buildFlowLS_mccandish(D, dp, mu, w, x, q_data)

q_mod = x * D * w / (2*pi);
q_loss = q_mod - q_data/60000;

A = [-D*dp/mu * ones(length(w),1)];
b = q_loss;

end

function coeff = unpack_mccandish(c_T, c_q)

coeff.Cf = c_T(1);
coeff.Cv = c_T(2);
coeff.Cs = c_q(1);

end


function [T, q] = evaluate_mccandish(coeff, D, dp, mu, w, x)

T = x*D*dp/(2*pi) ...
    - coeff.Cf*D*dp ...
    - coeff.Cv*D*mu*w/(2*pi);

q = x*D*w/(2*pi) ...
    + coeff.Cs*D*dp/mu;

end