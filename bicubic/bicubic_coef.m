function A = bicubic_coef(f, Ix, Iy, Ixy, x1, y1, x2, y2)
    % =========================================================================
    % Calculeaza coeficientii de interpolare bicubica pentru 4 puncte alaturate
    % =========================================================================

    % TODO: calculeaza matricile intermediare
	B = [1, 0, 0 ,0; 0, 0, 1, 0; -3, 3, -2, -1; 2, -2, 1, 1];
		 
	C = [f(y1, x1), f(y2, x1), Iy(y1, x1), Iy(y2, x1);
		 f(y1, x2), f(y2, x2), Iy(y1, x2), Iy(y2, x2);
		 Ix(y1, x1), Ix(y2, x1), Ixy(y1, x1), Ixy(y2, x1);
		 Ix(y1, x2), Ix(y2, x2), Ixy(y1, x2), Ixy(y2, x2)];
	
    % TODO: converteste matricile intermediare la double
	B = double(B);
	C = double(C);

    % TODO: calculeaza matricea finala
	A = B * C * B';
	
endfunction