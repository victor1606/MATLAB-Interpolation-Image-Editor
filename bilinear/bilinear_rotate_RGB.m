function out = bilinear_rotate_RGB(img, rotation_angle)
    % =========================================================================
    % Aplica interpolare bilineara pentru a roti o imagine RGB cu un unghi dat.
    % =========================================================================
    
    % TODO: extrage canalul rosu al imaginii
    r = img(:, :, 1);
    % TODO: extrage canalul verde al imaginii
    g = img(:, :, 2);
    % TODO: extrace canalul albastru al imaginii
    b = img(:, :, 3);

    % TODO: aplica rotatie pe cele 3 canale ale imaginii
	r = bilinear_rotate(r, rotation_angle);
    g = bilinear_rotate(g, rotation_angle);
    b = bilinear_rotate(b, rotation_angle);
	
    % TODO: formeaza imaginea finala cu cele 3 canale de culori
    % Hint: functia cat
	out = cat(3, r, g, b);
    
endfunction