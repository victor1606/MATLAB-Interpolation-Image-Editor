# MATLAB-Interpolation-Image-Editor
MATLAB Image Editor - supports resizing/rotation using 3 types of interpolation
(user selected): nearest-neighbour, bilinear, bicubic

Calugaritoiu Ion-Victor

Interpolare aplicata pe imagini

I. Interpolare nearest-neighbour

	- nn_2x2.m: am initializat matricea "out" cu zerouri si am parcurs
	fiecare pixel al imaginii finale; la fiecare iteratie am comparat i si j
	cu n/2 si m/2, astfel am determinat daca in matricea finala inserez valoarea
	x1 sau x2 respectiv y1 sau y2;
	- nn_2x2_RGB.m: am extras cele 3 canale de culori din "img"; am aplicat
	"nn_2x2" pe fiecare dintre cele 3 matrici rezultate si le-am concatenat in
	matricea "out";
	- nn_resize.m: am calculat factorii de scalare tinand cont de indexare;
	am calculat inversa matricii de transformare si am aplicat-o pe fiecare
	pixel din imaginea finala pentru a obtine indecsii din imaginea
	initiala; am calculat cel mai apropiat vecin folosind functia "round" si
	am inserat valorile corespunzatoare in matricea "out";
	- nn_resize_RGB.m: analog nn_2x2_RGB; am aplicat functia "nn_resize";

II. Interpolare biliniara

	- bilinear_coef.m: am calculat indicii de interpolare biliniara; am rezolvat
	sistemul astfel: a = A\b;
	- bilinear_2x2.m: am parcurs fiecare pixel din imaginea finala si am
	calculat valoarea acestora folosind coeficientii determinati anterior;
	- surrounding_points.m: am determinat punctele incadratoare folosind functia
	"floor"; am verificat daca indecsii se aflau in afara matricei; in caz
	contrar, am scazut 1 din x1, x2 sau y1, y2;
	- bilinear_resize.m: am calculat factorii de scalare tinand cont de
	indexare; am calculat inversa matricii de transformare si am aplicat-o pe
	fiecare pixel din imaginea finala pentru a obtine indecsii din imaginea
	initiala; am determinat punctele ce incadrau x_p si y_p folosind
	"surrounding_points" si coeficientii pentru interpolarea biliniara
	folosind "bilinear_coef"; astfel am calculat valoarea fiecarui punct din
	imaginea finala;
	- bilinear_rotate.m: am determinat matricea de transformare "T_rot" si am
	aplicat inversa acesteia pe fiecare pixel din imaginea finala; am verificat
	daca indecsii rezultati se incadreaza in [1, m] si [1, n], in caz contrar,
	am pus valoarea 0(negru) pe pixelul respectiv;

III. Interpolare bicubica

	- fx.m/fy.m/fxy.m: am calculat derivatele fata de x, y respectiv x si y
	in punctul (x, y);
	- precalc_d.m: am obtinut cele 3 matrici "Ix", "Iy", "Ixy" ce contin
	derivatele calculate cu functiile "fx", "fy", "fxy" pentru fiecare punct
	din matricea "I";
	- bicubic_coef.m: am calculat coeficientii "A" pentru interpolarea
	bicubica; am folosit matricea constanta "B" si transpusa sa, si matricea "C"
	formata din valorile matricei "f" si derivatelor precalculate anterior:
	A = B * C * B';
	- bicubic_resize.m: am calculat factorii de scalare tinand cont de
	indexare; am obtinut derivatele folosind "precalc_d"; am calculat
	inversa matricii de transformare si am aplicat-o pe fiecare pixel din
	imaginea finala pentru a obtine indecsii din imaginea initiala; am
	determinat punctele ce incadrau x_p si y_p folosind "surrounding_points" si
	coeficientii pentru interpolarea bicubica folosind "bicubic_coef";
	astfel, folosind formula de calcul pentru interpolare bicubica, am calculat
	valoarea fiecarui punct din imaginea finala;

