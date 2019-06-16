function wave(x) result (y)
	use Plotter
	implicit none
	real, intent(in) :: x
	real :: y
	y=sin(x) + sin(x)/3. + sin(x)/5. + sin(x)/7.
end function wave

program main
	USE Plotter
	!Тут функции
	USE plotter_functions
	implicit none
	real,external :: wave
	!Обёртка над указателем - тогда их можно в массиве расположить
	type(functions),dimension(:),allocatable::test_function
	!Две функции
	allocate(test_function(2))
	!Указатели на функцию для каждой из них
	test_function(1)%function_y=>fourth_function
	test_function(1)%function_z=>first_function
	test_function(2)%function_y=>afourth_function
	test_function(2)%function_z=>third_function
	call Set_Step_X(0.01)
	!Передаём размер окна, интервал, функции, число функций
	call DrawGraph(960,720,-5.,5.,test_function,2)
end
