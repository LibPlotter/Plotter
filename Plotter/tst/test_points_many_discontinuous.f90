program main
	USE Plotter
	implicit none
	integer :: i
	real :: x,y,phi,r,PI=DACOS(-1.D0)
	real,dimension(:,:,:),allocatable :: matrix
	real,dimension(:,:,:), allocatable :: restr
	phi = 0
	x = 0
	y = 0
	r = 0
	allocate(matrix(3,8400,2))
	do i=1,8400
		phi = phi+PI/4096.
		r=(1+sin(phi))*(1-0.9*abs(sin(4*phi)))*(0.9+0.05*cos(phi))
		matrix(1,i,1) = cos(phi)*r*5
		matrix(2,i,1) = sin(phi)*r*5
		matrix(3,i,1) = 0.
		matrix(1,i,2) = cos(phi)*r*5
		matrix(2,i,2) = -sin(phi)*r*5
		matrix(3,i,2) = 0.
	end do
	allocate(restr(6,1,2))
	!X
	restr(1,1,1) = -1.
	restr(2,1,1) = 1.
	!Y
	!Равные ограничения не учитываются
	restr(3,1,1) = 0
	restr(4,1,1) = 0
	!Z
	restr(5,1,1) = 0
	restr(6,1,1) = 0
	!Следующий набор
	restr(1,1,2) = 0
	restr(2,1,2) = 0
	restr(3,1,2) = -3.
	restr(4,1,2) = -2.
	restr(5,1,2) = 0
	restr(6,1,2) = 0
	!Передаём размеры окна, массив точек и их количество
	call DrawGraph(960,720,matrix,8400,2,restr,1)
end
