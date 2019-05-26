program transform 
use fftw 

implicit none

real(kind = 8), dimension(:), allocatable:: xs
real(kind = 8):: x, data_divider
integer:: i, data_size

type(C_PTR) :: plan
complex(C_DOUBLE_COMPLEX), dimension(:), allocatable :: inmat, outmat

data_size = 400
data_divider = 100

allocate(xs(data_size))
allocate(inmat(data_size))
allocate(outmat(data_size))

open(unit=1, file="res/plotdata/before_transform.plt", action="write")
open(unit=2, file="res/plotdata/after_transform_real.plt", action="write")
open(unit=3, file="res/plotdata/after_transform_complex.plt", action="write")

do i = 1, data_size, 1
    x = real(i) / data_divider 
    xs(i) = x
    inmat(i) = calcfun(x)

    write(1, '(ES12.5," ",ES12.5)') x, inmat(i)
end do

plan = fftw_plan_dft_1d(data_size, inmat, outmat, FFTW_FORWARD, FFTW_ESTIMATE)

call fftw_execute_dft(plan, inmat, outmat)
call fftw_destroy_plan(plan)

do i = 1, data_size, 1
    x = xs(i)
    write(2, '(ES12.5," ",ES12.5)') x, real(real(outmat(i)))
    write(3, '(ES12.5," ",ES12.5)') x, real(aimag(outmat(i)))
end do


deallocate(xs)
deallocate(inmat)
deallocate(outmat)

contains
    function calcfun(t) result(res)
        real(kind = 8), intent(in) :: t
        real(kind = 8) :: res, PI

        PI=4.D0*DATAN(1.D0)

        res = sin(2 * PI * t * 200) + 2 * sin(2 * PI * t * 400)
    end function

end program transform
