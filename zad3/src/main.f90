program main
use mod_integrate
use mod_funs

implicit none


real(kind = 8):: ibeg, iend, pi
!procedure(integrated):: myfun
real(kind=8):: res 

pi = 4.D0 * DATAN(1.D0)

ibeg = - pi / 2 
iend = pi

res = do_integrate(ibeg, iend, mysin, 0, 's') 
call tprint_real(res)

res = do_integrate(ibeg, iend, mysin, 0, 't') 
call tprint_real(res)

res = do_integrate(ibeg, iend, mysin, 0, 'g') 
call tprint_real(res)

iend = 1
res = do_integrate(ibeg, iend, poly6, 0, 's') 
call tprint_real(res)

res = do_integrate(ibeg, iend, poly6, 0, 't') 
call tprint_real(res)

res = do_integrate(ibeg, iend, poly6, 0, 'g') 
call tprint_real(res)

contains
    subroutine tprint_real(r)
        real(kind=8), intent(in):: r

        if (this_image() == 1) then
            print *, r
        end if
    end subroutine 

end program main
