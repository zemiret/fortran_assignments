program main
use mod_integrate
use mod_funs

implicit none


real(kind = 8):: ibeg, iend, pi
real(kind=8):: res 
character, dimension(3):: options = ['s', 't', 'g']

pi = 4.D0 * DATAN(1.D0)
ibeg = - pi / 2 
iend = pi

if (this_image() == 1) then
    print *, 'Function    ', 'result    ', 'error    '
end if

call run(mysin, 1._8, 'sin')

ibeg = 0 
iend = 2
call run(myexp, 6.389056_8, 'exp')
call run(poly1, 2._8, 'poly1')
call run(poly2, 12.6666666666666666_8, 'poly2')
call run(poly3, 36.6666666666666666_8, 'poly3')
call run(poly4, 43.0666666666666666_8, 'poly4')
call run(poly5, 64.4_8, 'poly5')
call run(poly6, 174.114285714285714_8, 'poly6')
call run(poly7, 398.114285714285714_8, 'poly7')
call run(poly8, 511.892063492063492_8, 'poly8')
call run(poly9, 614.292063492063492_8, 'poly9')
call run(poly10, 986.65569985569985_8, 'poly10')


contains
    subroutine tprint_real(r)
        real(kind=8), intent(in):: r

        if (this_image() == 1) then
            print *, r
        end if
    end subroutine 

    subroutine run(myfun, actual_res, fun_name)
        procedure(integrated):: myfun
        real(kind=8):: actual_res
        real(kind=8):: res
        character(*):: fun_name

        res = do_integrate(ibeg, iend, myfun, 0, 's')
        if (this_image() == 1) then
            print *, fun_name, ', sq ', ': ', res, (res - actual_res)
        end if

        res = do_integrate(ibeg, iend, myfun, 0, 't')
        if (this_image() == 1) then
            print *, fun_name, ', trap ', ': ', res, (res - actual_res)
        end if

        res = do_integrate(ibeg, iend, myfun, 0, 'g')
        if (this_image() == 1) then
            print *, fun_name, ', gauss ', ': ', res, (res - actual_res)
        end if

        if (this_image() == 1) then
            print *
        end if

    end subroutine

end program main
