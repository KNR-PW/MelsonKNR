function [ G_i, G_x, G_d ] = OptimalPreviewableControl_Parameters( A, B, C, Q_e, Q_x, R , N_l)
%OPTIMALPREVIEWABLECONTROL_PARAMETERS Summary of this function goes here
%   Detailed explanation goes here


B_tilda = [C * B; B];
I_tilda = [ eye(size(C,1)) ; zeros(size(A,1), size(C,1)) ];
F_tilda = [ C * A; A ];
Q_tilda = [ Q_x zeros(size(Q_x,1), size(Q_e,2)); zeros(size(Q_e,1), size(Q_x,2)) Q_e];
A_tilda = [I_tilda F_tilda];
X_tilda = zeros(size(C,1) + size(B,1) ,size(C,1) , N_l); %(P+n) x p x N_l
G_d = zeros(1, N_l);

% Solve Algebraic Riccccccati

[K_tilda,L_dare,G_dare] = dare(A_tilda,B_tilda,Q_tilda,R); % (p + n) x (p + n)

G_i = [R + B_tilda' * K_tilda * B_tilda]^(-1) * B_tilda' * K_tilda * I_tilda
G_x = [R + B_tilda' * K_tilda * B_tilda]^(-1) * B_tilda' * K_tilda * F_tilda

A_c_tilda = A_tilda - B_tilda * [R + B_tilda'*K_tilda*B_tilda]^(-1) * B_tilda' * K_tilda * A_tilda;

G_d(1) = -G_i;
X_tilda(:,:,1) = - A_c_tilda' * K_tilda * I_tilda;
for iter = 2:1:N_l
    X_tilda(:,:,iter) = A_c_tilda' * X_tilda(:,:,iter-1);
    G_d(iter) = [R + B_tilda' * K_tilda * B_tilda]^(-1) * B_tilda' * X_tilda(:,:,iter-1);
end

end

