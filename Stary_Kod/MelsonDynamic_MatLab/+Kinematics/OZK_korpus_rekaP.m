function [ q ] = OZK_korpus_rekaP(RbtMdlPar, r_W_RH , fi_CH)
% Zadanie odwrotne kinematyki dla koñczyny górnej prawej
% Wejœcie:
% r_W_RH - po³o¿enie koñcówki (d³oni) w uk³adzie bioder
% fi_CH - k¹t obrotu miêdzy biodrami a klatk¹ piersiow¹ (opcjonalnie)
% Wyjœcie
% q - wektor wsp. z³¹czowych
% q = [ fi_RAy fi_RAx fi_RFA];

if( nargin<3 )
   fi_CH = 0; 
end

% Wczytanie wymiarów)
% Kinematics.wymiary;

% Macierz rotacji miêdzy uk³adami klatki piersiowej i bioder
rot_W_CH = [cos(fi_CH) -sin(fi_CH) 0;
          sin(fi_CH) cos(fi_CH) 0;
          0 0 1];

% Po³o¿enie koñcówki (d³oni) w uk³adzie klatki piersiowej
r_CH_RH = rot_W_CH' * r_W_RH;

% Prawa strona równania
r = r_CH_RH - RbtMdlPar.r_CH_RA;

% D³ugoœci cz³onów
l_RA = RbtMdlPar.r_RA_RFA(3);     %d³ugoœæ ramienia (ujemna!) 
l_RFA = RbtMdlPar.r_RFA_RH(3);    %d³ugoœæ przedramienia (ujemna!) 

% Wyliczanie wartoœci wsp. z³¹czowych
fi_RFA = -acos( (r'*r - l_RA^2 - l_RFA^2) / (2*l_RA*l_RFA));
fi_RAx = asin( -r(2) / (l_RA + l_RFA*cos(fi_RFA)));

% Wyznaczenie fi_RAy
% uk³ad rónañ liniowych:

A(1,1) = (l_RA + l_RFA*cos(fi_RFA)) * cos(fi_RAx);
A(1,2) = l_RFA*sin(fi_RFA);
A(2,1) = - l_RFA * sin(fi_RFA);
A(2,2) = (l_RFA * cos(fi_RFA) + l_RA) * cos(fi_RAx);

b = [r(1) ; r(3)];

x = A\b;
% x = [sin(fi_RAy); cos(fi_RAy)]

fi_RAy = atan2(real(x(1)), real(x(2)));

% zbudowanie wektora wsp. z³¹czowych
q = [ fi_RAy fi_RAx fi_RFA];
end

