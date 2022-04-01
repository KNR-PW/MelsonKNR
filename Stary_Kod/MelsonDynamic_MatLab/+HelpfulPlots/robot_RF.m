function [] = robot_RF(RbtMdlPar,q, X_Planned)

if nargin<3
    X_Planned = zeros(21,1);
end

r_RF = X_Planned(1:3);
rot_RF = Mat.euler2rot(X_Planned(16:18));


fi_RTz = q(1);
fi_RTx = q(2);
fi_RTy = q(3);
fi_RS  = q(4);
fi_RFy = q(5);
fi_RFx = q(6);

rot_W_RT = Mat.RotZ(fi_RTz) * Mat.RotX(fi_RTx) * Mat.RotY(fi_RTy);
rot_W_RS = rot_W_RT * Mat.RotY(fi_RS);
rot_W_RF = rot_W_RS * Mat.RotY(fi_RFy) * Mat.RotX(fi_RFx);
        
r_RF_W = - Mat.RotX(-fi_RFx) * Mat.RotY(-fi_RFy) * RbtMdlPar.r_RS_RF ...
         - Mat.RotX(-fi_RFx) * Mat.RotY(-fi_RFy) * Mat.RotY(-fi_RS) * RbtMdlPar.r_RT_RS ...
         - Mat.RotX(-fi_RFx) * Mat.RotY(-fi_RFy) * Mat.RotY(-fi_RS) * Mat.RotY(-fi_RTy) * Mat.RotX(-fi_RTx) * Mat.RotZ(-fi_RTz) * RbtMdlPar.r_W_RT;
        

HelpfulPlots.stick_robot(RbtMdlPar, q,r_RF+r_RF_W, rot_W_RF');
drawnow;
end