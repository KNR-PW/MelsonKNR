function r_syms = function_r_syms(fi_RTz,fi_RTx,fi_RTy,fi_RS,fi_RFy,fi_RFx,fi_LTz,fi_LTx,fi_LTy,fi_LS,fi_LFy,fi_LFx,fi_RAy,fi_RAx,fi_RFA,fi_LAy,fi_LAx,fi_LFA,fi_CH)
%FUNCTION_R_SYMS
%    R_SYMS = FUNCTION_R_SYMS(FI_RTZ,FI_RTX,FI_RTY,FI_RS,FI_RFY,FI_RFX,FI_LTZ,FI_LTX,FI_LTY,FI_LS,FI_LFY,FI_LFX,FI_RAY,FI_RAX,FI_RFA,FI_LAY,FI_LAX,FI_LFA,FI_CH)

%    This function was generated by the Symbolic Math Toolbox version 8.2.
%    15-Nov-2018 02:33:07

t2 = cos(fi_RTz);
t3 = sin(fi_RTy);
t4 = cos(fi_RTy);
t5 = sin(fi_RTx);
t6 = sin(fi_RTz);
t7 = cos(fi_RS);
t8 = t2.*t3;
t9 = t4.*t5.*t6;
t10 = t8+t9;
t11 = sin(fi_RS);
t12 = t2.*t4;
t19 = t3.*t5.*t6;
t13 = t12-t19;
t14 = cos(fi_LTz);
t15 = sin(fi_LTy);
t16 = cos(fi_LTy);
t17 = sin(fi_LTx);
t18 = sin(fi_LTz);
t20 = cos(fi_RFy);
t21 = sin(fi_RFy);
t22 = t3.*t6;
t28 = t2.*t4.*t5;
t23 = t22-t28;
t24 = t4.*t6;
t25 = t2.*t3.*t5;
t26 = t24+t25;
t27 = cos(fi_LS);
t29 = sin(fi_LS);
t30 = cos(fi_RTx);
t31 = cos(fi_LTx);
t32 = t4.*t7.*t30;
t72 = t3.*t11.*t30;
t33 = t32-t72;
t34 = t3.*t7.*t30;
t35 = t4.*t11.*t30;
t36 = t34+t35;
t37 = t4.*t30.*9.6283e1;
t38 = t4.*t7.*t30.*9.5e1;
t39 = t15.*t29.*t31.*9.5e1;
t40 = sin(fi_RFx);
t41 = t7.*t23;
t42 = t11.*t26;
t43 = t41+t42;
t44 = t7.*t26;
t77 = t11.*t23;
t45 = t44-t77;
t46 = cos(fi_RFx);
t47 = t3.*t6.*9.6283e1;
t48 = t15.*t18;
t81 = t14.*t16.*t17;
t49 = t48-t81;
t50 = t7.*t23.*9.5e1;
t51 = t16.*t18;
t52 = t14.*t15.*t17;
t53 = t51+t52;
t54 = t11.*t26.*9.5e1;
t55 = t14.*t16.*t17.*9.6283e1;
t80 = t15.*t18.*9.6283e1;
t82 = t27.*t49.*9.5e1;
t83 = t29.*t53.*9.5e1;
t84 = t2.*t4.*t5.*9.6283e1;
t56 = t47+t50+t54+t55-t80-t82-t83-t84+4.28e2./5.0;
t57 = t7.*t10;
t58 = t11.*t13;
t59 = t57+t58;
t60 = t7.*t13;
t86 = t10.*t11;
t61 = t60-t86;
t62 = t14.*t15.*9.6283e1;
t63 = t14.*t15;
t64 = t16.*t17.*t18;
t65 = t63+t64;
t66 = t27.*t65.*9.5e1;
t67 = t14.*t16;
t91 = t15.*t17.*t18;
t68 = t67-t91;
t69 = t29.*t68.*9.5e1;
t70 = t16.*t17.*t18.*9.6283e1;
t89 = t2.*t3.*9.6283e1;
t90 = t7.*t10.*9.5e1;
t92 = t11.*t13.*9.5e1;
t93 = t4.*t5.*t6.*9.6283e1;
t71 = t62+t66+t69+t70-t89-t90-t92-t93;
t73 = t20.*t33;
t111 = t21.*t36;
t74 = t73-t111;
t109 = t3.*t11.*t30.*9.5e1;
t75 = t37+t38+t39-t109-t16.*t31.*9.6283e1-t16.*t27.*t31.*9.5e1;
t76 = t20.*t43;
t78 = t21.*t45;
t79 = t76+t78;
t85 = t20.*t59;
t87 = t21.*t61;
t88 = t85+t87;
t94 = t21.*t59;
t95 = sin(fi_CH);
t96 = sin(fi_RAx);
t97 = cos(fi_CH);
t98 = cos(fi_RAx);
t99 = sin(fi_RAy);
t148 = t20.*t61;
t100 = t94-t148;
t101 = t21.*t43;
t102 = cos(fi_RFA);
t103 = cos(fi_RAy);
t104 = sin(fi_RFA);
t152 = t20.*t45;
t105 = t101-t152;
t106 = t20.*t36;
t107 = t21.*t33;
t108 = t106+t107;
t110 = t5.*t46;
t112 = t40.*t74;
t113 = t110+t112;
t114 = t99.*t104.*9.0e1;
t133 = t98.*t103.*1.03e2;
t134 = t98.*t102.*t103.*9.0e1;
t115 = t37+t38-t109+t114-t133-t134+6.17e2./4.0;
t116 = t40.*t79;
t117 = t2.*t30.*t46;
t118 = t116+t117;
t119 = t96.*t97.*1.03e2;
t120 = t96.*t97;
t138 = t95.*t98.*t99;
t121 = t120-t138;
t122 = t102.*t121.*9.0e1;
t137 = t97.*1.02e2;
t139 = t95.*t103.*t104.*9.0e1;
t140 = t95.*t98.*t99.*1.03e2;
t123 = t47+t50+t54-t84+t119+t122-t137-t139-t140+2.14e2./5.0;
t124 = t40.*t88;
t163 = t6.*t30.*t46;
t125 = t124-t163;
t126 = t95.*1.02e2;
t127 = t95.*t96;
t128 = t97.*t98.*t99;
t129 = t127+t128;
t144 = t95.*t96.*1.03e2;
t145 = t102.*t129.*9.0e1;
t146 = t97.*t103.*t104.*9.0e1;
t147 = t97.*t98.*t99.*1.03e2;
t130 = t89+t90+t92+t93+t126-t144-t145-t146-t147;
t131 = t5.*t40;
t172 = t46.*t74;
t132 = t131-t172;
t135 = t46.*t79;
t175 = t2.*t30.*t40;
t136 = t135-t175;
t141 = t46.*t88;
t142 = t6.*t30.*t40;
t143 = t141+t142;
t149 = sin(fi_LAx);
t150 = cos(fi_LAx);
t151 = sin(fi_LAy);
t153 = cos(fi_LFA);
t154 = cos(fi_LAy);
t155 = sin(fi_LFA);
t156 = t151.*t155.*9.0e1;
t173 = t150.*t154.*1.03e2;
t174 = t150.*t153.*t154.*9.0e1;
t157 = t37+t38-t109+t156-t173-t174+6.17e2./4.0;
t158 = t97.*t149.*1.03e2;
t159 = t97.*t149;
t176 = t95.*t150.*t151;
t160 = t159-t176;
t161 = t153.*t160.*9.0e1;
t177 = t95.*t154.*t155.*9.0e1;
t178 = t95.*t150.*t151.*1.03e2;
t162 = t47+t50+t54-t84+t137+t158+t161-t177-t178+2.14e2./5.0;
t164 = t95.*t149.*1.03e2;
t165 = t95.*t149;
t166 = t97.*t150.*t151;
t167 = t165+t166;
t168 = t153.*t167.*9.0e1;
t169 = t97.*t154.*t155.*9.0e1;
t170 = t97.*t150.*t151.*1.03e2;
t171 = -t89-t90-t92-t93+t126+t164+t168+t169+t170;
t179 = cos(fi_LFy);
t180 = t29.*t49;
t186 = t27.*t53;
t181 = t180-t186;
t182 = sin(fi_LFy);
t183 = t27.*t49;
t184 = t29.*t53;
t185 = t183+t184;
t187 = t181.*t182;
t188 = cos(fi_LFx);
t189 = sin(fi_LFx);
t240 = t179.*t185;
t190 = t187-t240;
t191 = t29.*t65;
t197 = t27.*t68;
t192 = t191-t197;
t193 = t27.*t65;
t194 = t29.*t68;
t195 = t193+t194;
t196 = t179.*t195;
t263 = t182.*t192;
t198 = t196-t263;
t199 = t16.*t27.*t31;
t204 = t15.*t29.*t31;
t200 = t199-t204;
t201 = t15.*t27.*t31;
t202 = t16.*t29.*t31;
t203 = t201+t202;
t205 = t179.*t200;
t212 = t182.*t203;
t206 = t205-t212;
t207 = t151.*1.471668716687167e-2;
t208 = t99.*1.471668716687167e-2;
t209 = t17.*1.368019680196802e-2;
t210 = t149.*t154.*2.390077900779008e-2;
t211 = t5.*t46.*4.318728987289873e-1;
t213 = t188.*t206.*6.300533005330053e-2;
t214 = t46.*t74.*6.300533005330053e-2;
t215 = t40.*t74.*4.318728987289873e-1;
t216 = t150.*t154.*5.130888888888889;
t217 = t98.*t103.*5.130888888888889;
t218 = t16.*t31.*1.605038007380074e1;
t219 = t16.*t27.*t31.*1.090243747437474e1;
t220 = t150.*t153.*t154.*1.566989749897499;
t221 = t98.*t102.*t103.*1.566989749897499;
t222 = t15.*t27.*t31.*2.350213202132021e-1;
t223 = t16.*t29.*t31.*2.350213202132021e-1;
t224 = t3.*t7.*t30.*2.350213202132021e-1;
t225 = t4.*t11.*t30.*2.350213202132021e-1;
t226 = t3.*t11.*t30.*8.409756252562526e1;
t282 = t5.*3.318819188191882e-2;
t283 = t96.*t103.*2.390077900779008e-2;
t284 = t17.*t188.*4.318728987289873e-1;
t285 = t15.*t31.*4.935793357933579e-2;
t286 = t3.*t30.*4.935793357933579e-2;
t287 = t151.*t155.*1.566989749897499;
t288 = t99.*t104.*1.566989749897499;
t289 = t17.*t189.*6.300533005330053e-2;
t290 = t5.*t40.*6.300533005330053e-2;
t291 = t179.*t203.*1.165963099630996;
t292 = t20.*t36.*1.165963099630996;
t293 = t182.*t200.*1.165963099630996;
t294 = t21.*t33.*1.165963099630996;
t295 = t189.*t206.*4.318728987289873e-1;
t296 = t4.*t30.*8.023261992619926e1;
t297 = t4.*t7.*t30.*8.409756252562526e1;
t298 = t15.*t29.*t31.*1.090243747437474e1;
t227 = t207+t208+t209+t210+t211+t213+t214+t215+t216+t217+t218+t219+t220+t221+t222+t223+t224+t225+t226-t282-t283-t284-t285-t286-t287-t288-t289-t290-t291-t292-t293-t294-t295-t296-t297-t298-4.617575891758918e1;
t228 = t97.*5.402214022140221e-3;
t229 = t97.*t149.*5.130888888888889;
t230 = t95.*t154.*1.471668716687167e-2;
t231 = t96.*t97.*5.130888888888889;
t232 = t95.*t103.*1.471668716687167e-2;
t233 = t3.*t6.*8.023261992619926e1;
t234 = t153.*t160.*1.566989749897499;
t235 = t102.*t121.*1.566989749897499;
t236 = t27.*t53.*2.350213202132021e-1;
t237 = t7.*t26.*2.350213202132021e-1;
t238 = t7.*t23.*8.409756252562526e1;
t239 = t179.*t181.*1.165963099630996;
t241 = t188.*t190.*6.300533005330053e-2;
t242 = t11.*t26.*8.409756252562526e1;
t243 = t182.*t185.*1.165963099630996;
t244 = t21.*t43.*1.165963099630996;
t245 = t97.*t98.*2.390077900779008e-2;
t246 = t2.*t30.*3.318819188191882e-2;
t247 = t14.*t31.*t188.*4.318728987289873e-1;
t248 = t14.*t31.*t189.*6.300533005330053e-2;
t249 = t14.*t16.*t17.*1.605038007380074e1;
t250 = t2.*t30.*t40.*6.300533005330053e-2;
t251 = t95.*t96.*t99.*2.390077900779008e-2;
t252 = t97.*4.017146371463715e-1;
t253 = t95.*5.402214022140221e-3;
t254 = t95.*t98.*2.390077900779008e-2;
t255 = t14.*t15.*1.605038007380074e1;
t256 = t6.*t30.*3.318819188191882e-2;
t257 = t95.*t149.*5.130888888888889;
t258 = t95.*t96.*5.130888888888889;
t259 = t153.*t167.*1.566989749897499;
t260 = t102.*t129.*1.566989749897499;
t261 = t27.*t65.*1.090243747437474e1;
t262 = t20.*t61.*1.165963099630996;
t264 = t188.*t198.*6.300533005330053e-2;
t265 = t46.*t88.*6.300533005330053e-2;
t266 = t29.*t65.*2.350213202132021e-1;
t267 = t29.*t68.*1.090243747437474e1;
t268 = t10.*t11.*2.350213202132021e-1;
t269 = t40.*t88.*4.318728987289873e-1;
t270 = t14.*t16.*4.935793357933579e-2;
t271 = t2.*t4.*4.935793357933579e-2;
t272 = t97.*t154.*t155.*1.566989749897499;
t273 = t97.*t103.*t104.*1.566989749897499;
t274 = t97.*t150.*t151.*5.130888888888889;
t275 = t97.*t98.*t99.*5.130888888888889;
t276 = t18.*t31.*t188.*4.318728987289873e-1;
t277 = t97.*t149.*t151.*2.390077900779008e-2;
t278 = t18.*t31.*t189.*6.300533005330053e-2;
t279 = t16.*t17.*t18.*1.605038007380074e1;
t280 = t6.*t30.*t40.*6.300533005330053e-2;
t299 = t95.*t150.*2.390077900779008e-2;
t300 = t18.*t31.*1.368019680196802e-2;
t301 = t2.*t3.*8.023261992619926e1;
t302 = t27.*t68.*2.350213202132021e-1;
t303 = t7.*t10.*8.409756252562526e1;
t304 = t7.*t13.*2.350213202132021e-1;
t305 = t179.*t192.*1.165963099630996;
t306 = t11.*t13.*8.409756252562526e1;
t307 = t182.*t195.*1.165963099630996;
t308 = t21.*t59.*1.165963099630996;
t309 = t189.*t198.*4.318728987289873e-1;
t310 = t97.*t154.*1.471668716687167e-2;
t311 = t97.*t103.*1.471668716687167e-2;
t312 = t6.*t30.*t46.*4.318728987289873e-1;
t313 = t96.*t97.*t99.*2.390077900779008e-2;
t314 = t4.*t5.*t6.*8.023261992619926e1;
t315 = t15.*t17.*t18.*4.935793357933579e-2;
t316 = t3.*t5.*t6.*4.935793357933579e-2;
t281 = t252+t253+t254+t255+t256+t257+t258+t259+t260+t261+t262+t264+t265+t266+t267+t268+t269+t270+t271+t272+t273+t274+t275+t276+t277+t278+t279+t280-t299-t300-t301-t302-t303-t304-t305-t306-t307-t308-t309-t310-t311-t312-t313-t314-t315-t316+4.966642066420664;
r_syms = [-t56.*t105+t71.*t100-t75.*t108;t56.*t118+t75.*t113-t71.*t125;t56.*t136-t75.*t132-t71.*t143;-t108.*t115-t105.*t123-t100.*t130;t113.*t115+t118.*t123+t125.*t130;-t115.*t132+t123.*t136+t130.*t143;-t108.*t157-t105.*t162+t171.*(t94-t148);t113.*t157+t118.*t162-t125.*t171;-t132.*t157+t136.*t162-t143.*t171;t108.*t227+t281.*(t94-t148)-t105.*(t95.*(-4.017146371463715e-1)+t228+t229+t230+t231+t232+t233+t234+t235+t236+t237+t238+t239+t241+t242+t243+t244+t245+t246+t247+t248+t249+t250+t251-t4.*t6.*4.935793357933579e-2-t15.*t18.*1.605038007380074e1-t11.*t23.*2.350213202132021e-1-t16.*t18.*4.935793357933579e-2-t14.*t31.*1.368019680196802e-2-t20.*t45.*1.165963099630996-t27.*t49.*1.090243747437474e1-t29.*t49.*2.350213202132021e-1-t29.*t53.*1.090243747437474e1-t40.*t79.*4.318728987289873e-1-t46.*t79.*6.300533005330053e-2-t97.*t150.*2.390077900779008e-2-t189.*t190.*4.318728987289873e-1-t2.*t3.*t5.*4.935793357933579e-2-t2.*t4.*t5.*8.023261992619926e1-t14.*t15.*t17.*4.935793357933579e-2-t2.*t30.*t46.*4.318728987289873e-1-t95.*t98.*t99.*5.130888888888889-t95.*t103.*t104.*1.566989749897499-t95.*t149.*t151.*2.390077900779008e-2-t95.*t150.*t151.*5.130888888888889-t95.*t154.*t155.*1.566989749897499+4.279867978679787e1);-t113.*t227-t125.*t281+t118.*(t95.*(-4.017146371463715e-1)+t228+t229+t230+t231+t232+t233+t234+t235+t236+t237+t238+t239+t241+t242+t243+t244+t245+t246+t247+t248+t249+t250+t251-t4.*t6.*4.935793357933579e-2-t15.*t18.*1.605038007380074e1-t11.*t23.*2.350213202132021e-1-t16.*t18.*4.935793357933579e-2-t14.*t31.*1.368019680196802e-2-t20.*t45.*1.165963099630996-t27.*t49.*1.090243747437474e1-t29.*t49.*2.350213202132021e-1-t29.*t53.*1.090243747437474e1-t40.*t79.*4.318728987289873e-1-t46.*t79.*6.300533005330053e-2-t97.*t150.*2.390077900779008e-2-t189.*(t187-t240).*4.318728987289873e-1-t2.*t3.*t5.*4.935793357933579e-2-t2.*t4.*t5.*8.023261992619926e1-t14.*t15.*t17.*4.935793357933579e-2-t2.*t30.*t46.*4.318728987289873e-1-t95.*t98.*t99.*5.130888888888889-t95.*t103.*t104.*1.566989749897499-t95.*t149.*t151.*2.390077900779008e-2-t95.*t150.*t151.*5.130888888888889-t95.*t154.*t155.*1.566989749897499+4.279867978679787e1);t132.*t227-t143.*t281+t136.*(t95.*(-4.017146371463715e-1)+t228+t229+t230+t231+t232+t233+t234+t235+t236+t237+t238+t239+t241+t242+t243+t244+t245+t246+t247+t248+t249+t250+t251-t4.*t6.*4.935793357933579e-2-t15.*t18.*1.605038007380074e1-t11.*t23.*2.350213202132021e-1-t16.*t18.*4.935793357933579e-2-t14.*t31.*1.368019680196802e-2-t20.*t45.*1.165963099630996-t27.*t49.*1.090243747437474e1-t29.*t49.*2.350213202132021e-1-t29.*t53.*1.090243747437474e1-t40.*t79.*4.318728987289873e-1-t46.*t79.*6.300533005330053e-2-t97.*t150.*2.390077900779008e-2-t189.*(t187-t240).*4.318728987289873e-1-t2.*t3.*t5.*4.935793357933579e-2-t2.*t4.*t5.*8.023261992619926e1-t14.*t15.*t17.*4.935793357933579e-2-t2.*t30.*t46.*4.318728987289873e-1-t95.*t98.*t99.*5.130888888888889-t95.*t103.*t104.*1.566989749897499-t95.*t149.*t151.*2.390077900779008e-2-t95.*t150.*t151.*5.130888888888889-t95.*t154.*t155.*1.566989749897499+4.279867978679787e1)];