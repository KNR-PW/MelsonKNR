Funkcje:
IKS - zadanie odwrotne dla zadanej pozycji we wsp. zewnêtrznych i aktualnej konfiguracji z³¹czowej
calc_* - analityczne wyznaczenie funkcji:
       - e - orientacja lewej stopy wzglêdem prawej w parametrach Eulera e1 e2 e3
       - r - pozycje endpointów i œrodka masy
       - w (omega) - prêdkoœæ k¹towa w_RF_LF
       - J - Jakobian geometryczny
       - J_aug - rozszerzenie jakobianu, dot. pochylenia korpusu
       - r_aug - rozrzerzenie pozycji, k¹t pochylenia korpusu
function_  - wyznaczone funkcje, wykorzystywane przez polecenia eval_*
eval_* - funkcje wyliczaj¹ce wartoœci poszczególnych rzeczy

       - r - wektor r = [ r_RF_LF;
                          r_RF_RH;
                          r_RF_LH;
                          r_RF_CoM;
                          e_RF_LF]
       - r_aug - k¹t pochylenia korpusu
       - J - jakobian geometryczny  15x19
       - J_aug - roszerzenie jakobianu, dr_aug/dq