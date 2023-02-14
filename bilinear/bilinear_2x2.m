function out = bilinear_2x2(f, STEP = 0.1)
    % =========================================================================
    % Aplica interpolare biliniara pe imaginea 2x2 f cu puncte intermediare
    % echidistante.
    % f are valori cunoscute in punctele (1, 1), (1, 2), (2, 1) si (2, 2).
    % 
    % Parametrii:
    % - f = imaginea ce se doreste sa fie interpolata
    % - STEP = distanta dintre doua puncte succesive
    % =========================================================================
    
    f=double(f);

    % defineste coordonatele x si y ale punctelor intermediare
    x_int = 1 : STEP : 2;
    y_int = 1 : STEP : 2;

    % afla nr. de puncte
    n = length(x_int);

    % cele 4 punctele incadratoare vor fi aceleasi pentru toate punctele din
    % interior
    x1 = y1 = 1;
    x2 = y2 = 2;

    % TODO: calculeaza coeficientii de interpolare biliniara folosind bilinear_coef
    coef = bilinear_coef(f, x1, y1, x2, y2);
    a0 = coef(1, 1);
    a1 = coef(2, 1);
    a2 = coef(3, 1);
    a3 = coef(4, 1);
    
    % TODO: initializeaza rezultatul cu o matrice n x n plina de zero
    out = zeros(n, n);
    
    % parcurge fiecare pixel din imaginea finala
    for i = 1 : n
        for j = 1 : n
            % TODO: calculeaza valoarea pixelului
            out(j, i) = a0 + a1 * x_int(i) + a2 * y_int(j) + a3 * x_int(i) * y_int(j);
        endfor
    endfor

    % TODO: converteste rezultatul la uint8 pentru a ramane o imagine
    out = uint8(out);
    
endfunction
