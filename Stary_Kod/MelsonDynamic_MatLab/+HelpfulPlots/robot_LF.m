function [] = robot_RF(RbtMdlPar,q)

fi_LTz = q(7);
fi_LTx = q(8);
fi_LTy = q(9);
fi_LS  = q(10);
fi_LFy = q(11);
fi_LFx = q(12);

rot_W_LT = RotZ(fi_LTz) * RotX(fi_LTx) * RotY(fi_LTy);
rot_W_LS = rot_W_LT * RotY(fi_LS);
rot_W_LF = rot_W_LS * RotY(fi_LFy) * RotX(fi_LFx);
        
r_LF_W = - RotX(-fi_LFx) * RotY(-fi_LFy) * RbtMdlPar.r_LS_LF ...
         - RotX(-fi_LFx) * RotY(-fi_LFy) * RotY(-fi_LS) * RbtMdlPar.r_LT_LS ...
         - RotX(-fi_LFx) * RotY(-fi_LFy) * RotY(-fi_LS) * RotY(-fi_LTy) * RotX(-fi_LTx) * RotZ(-fi_LTz) * RbtMdlPar.r_W_LT;
        
clf;
HelpfulPlots.stick_robot(RbtMdlPar, q,r_LF_W, rot_W_LF');
drawnow;
end