function [ q ] = OZK_korpus_rekaP( r_W_RH , q0, fi_W_CH)
% Zadanie odwrotne kinematyki dla koñczyny górnej Prawej
% Wejœcie:
% r_W_RH - po³o¿enie koñcówki (d³oni) w uk³adzie bioder
% fi_CH - k¹t obrotu miêdzy biodrami a klatk¹ piersiow¹ (opcjonalnie)
% Wyjœcie
% q - wektor wsp. z³¹czowych
% q = [ fi_RAy fi_RAx fi_RFA];

if( nargin<2 )
   fi_W_CH = 0;
   q0 = [0 0 -pi/2];
end

% Wczytanie wymiarów)
wymiary;

% Macierz rotacji miêdzy uk³adami klatki piersiowej i bioder
rot_W_CH = [cos(fi_W_CH) -sin(fi_W_CH) 0;
          sin(fi_W_CH) cos(fi_W_CH) 0;
          0 0 1];

% Po³o¿enie koñcówki (d³oni) w uk³adzie klatki piersiowej
r_CH_RH = rot_W_CH' * r_W_RH;

q0 = [0 0 -pi/2];

options = optimset('Display','off');
f = @(q) Kinematics.PZK_klatka_rekaP(q,r_CH_RH); 
q=fsolve(f,q0, options);

end

