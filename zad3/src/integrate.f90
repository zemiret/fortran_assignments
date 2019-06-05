module mod_integrate 
implicit none

interface
    function integrated(x) result(y)
        real(kind=8), intent(in):: x
        real(kind=8):: y
    end function integrated
end interface

interface
    function integrate(ibeg, iend, myfun, p) result(res)
        real(kind = 8), intent(in):: ibeg, iend
        procedure(integrated):: myfun
        integer(kind=4), intent(in):: p
        real(kind=8):: res 

    end function integrate 
end interface

contains
    function sq_integrate(ibeg, iend, myfun, p) result(res)
        real(kind = 8), intent(in):: ibeg, iend
        procedure(integrated):: myfun
        integer(kind=4), intent(in):: p
        real(kind=8):: res 
        integer(kind=8):: i, n
        real(kind=8):: x, step

        n = 1000
        res = 0.0
        step = (iend - ibeg) / n
 
        x = ibeg + (step / 2)
        do i = 0, n - 1
            res = res + (myfun(x) * step)
            x = x + step
        end do
    end function sq_integrate 

    function trap_integrate(ibeg, iend, myfun, p) result(res)
        real(kind = 8), intent(in):: ibeg, iend
        procedure(integrated):: myfun
        integer(kind=4), intent(in):: p
        real(kind=8):: res 
        integer(kind=8):: i, n
        real(kind=8):: x1, x2, step

        n = 1000
        res = 0.0
        step = (iend - ibeg) / n
 
        x1 = ibeg
        do i = 0, n - 1
            x2 = x1 + step
            res = res + ((myfun(x2) + myfun(x1)) * step)
            x1 = x2
        end do

        res = res / 2
    end function trap_integrate 

end module mod_integrate

