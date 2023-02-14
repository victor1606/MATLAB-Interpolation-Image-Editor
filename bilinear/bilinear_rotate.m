
function R = bilinear_rotate(I, rotation_angle)
    % =========================================================================
    % Roteste imaginea alb-negru I de dimensiune m x n cu unghiul
    % rotation_angle, aplicand interpolare biliniara.
    % rotation_angle este exprimat in radiani.
    % =========================================================================
    
    [m n nr_colors] = size(I);
    
    % daca imaginea e alb negru, ignora
    if nr_colors > 1
        R = -1;
        return
    endif

    % Obs:
    % Atunci cand se aplica o scalare, punctul (0, 0) al imaginii nu se va
    % deplasa.
    % In Octave, pixelii imaginilor sunt indexati de la 1 la n.
    % Daca se lucreaza in indici de la 1 la n si se inmulteste x si y cu s_x
    % si s_y, atunci originea imaginii se va deplasa de la (1, 1) la (sx, sy)!
    % De aceea, trebuie lucrat cu indici in intervalul de la 0 la n - 1!

    % TODO: calculeaza cos si sin de rotation_angle
	cos_r = cos(rotation_angle);
	sin_r = sin(rotation_angle);
	
    % TODO: initializeaza matricea finala
	R = zeros(m ,n);
	
    % TODO: calculeaza matricea de transformare
	T_rot = [cos_r, -sin_r; sin_r, cos_r];
	
    % TODO: calculeaza inversa transformarii
	T_rot_i = T_rot ^-1;
	
    % parcurge fiecare pixel din imagine
    % foloseste coordonate de la 0 la n - 1
    for y = 0 : m - 1
        for x = 0 : n - 1
            % TODO: aplica transformarea inversa asupra (x, y) si calculeaza
            % x_p si y_p din spatiul imaginii initiale
			xy_p = T_rot_i * [x, y]';

            % trece (xp, yp) din sistemul de coordonate de la 0 la n - 1 in
            % sistemul de coordonate de la 1 la n pentru a aplica interpolarea
            x_p = xy_p(1, 1) + 1;
            y_p = xy_p(2, 1) + 1;

            % TODO: daca xp sau yp se afla in afara imaginii, pune un pixel
            % negru in imagine si treci mai departe
			if x_p > n || y_p > m || x_p < 1 || y_p < 1
				R(y + 1, x + 1) = 0;
			else
            	% TODO: afla punctele ce inconjoara punctul (xp, yp)
				[x1, y1, x2, y2] = surrounding_points(n, m, x_p, y_p);
				
            	% TODO: calculeaza coeficientii de interpolare a
				coef = bilinear_coef(I, x1, y1, x2, y2);
           	 	a0 = coef(1, 1);
            	a1 = coef(2, 1);
            	a2 = coef(3, 1);
            	a3 = coef(4, 1);
			
           	 	% TODO: calculeaza valoarea interpolata a pixelului (x, y)
            	% Obs: pentru scrierea in imagine, x si y sunt in coordonate de
            	% la 0 la n - 1 si trebuie aduse in coordonate de la 1 la n
            	R(y + 1, x + 1) = a0 + a1 * x_p + a2 * y_p + a3 * x_p * y_p;
			endif
        endfor
    endfor

    % transforma matricea rezultat in uint8 pentru a fi o imagine valida
    R = uint8(R);
endfunction
