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
        import integrated

        real(kind = 8), intent(in):: ibeg, iend
        procedure(integrated):: myfun
        integer(kind=4), intent(in):: p
        real(kind=8):: res 

    end function integrate 
end interface

contains
    ! kind is either:
    ! 's' - sqare rule
    ! 't' - trapezoid rule
    ! 'g' - gauss rule
    function do_integrate(ibeg, iend, myfun, p, kind) result(res)
        real(kind = 8), intent(in):: ibeg, iend
        procedure(integrated):: myfun
        integer(kind=4), intent(in):: p
        real(kind=8):: res 

        real(kind=8), codimension[*]:: dim_res = 0.0
        character:: kind
        real(kind=8):: range_step
        integer(kind=4):: i

        procedure (integrate), pointer :: f_ptr => null ()

        if (kind .eq. 's') then
            f_ptr => sq_integrate
        else if (kind .eq. 't') then
            f_ptr => trap_integrate
        else if (kind .eq. 'g') then
            f_ptr => gauss_integrate
        else
            print *, "Unknown integration kind!"
            res = -1
            return
        end if

        res = 0

        range_step = (iend - ibeg) / num_images()


        dim_res = f_ptr(ibeg + (this_image() - 1) * range_step, ibeg + this_image() * range_step, myfun, p)

        syncall()

        do i = 1, num_images()
            res = res + dim_res[i]
        end do
    end function 

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

    function gauss_integrate(ibeg, iend, myfun, p) result(res)
        real(kind = 8), intent(in):: ibeg, iend
        procedure(integrated):: myfun
        integer(kind=4), intent(in):: p
        real(kind=8):: res
        integer(kind=8)::i, n
        !real(kind=8):: r(2, n)
        real(kind=8), allocatable :: r(:,:)
        real(kind=8):: w1, w2, s

        w1 = (iend - ibeg) / 2
        w2 = (ibeg + iend) / 2

        n = 20
        r = gaussquad(n)

        do i = 1, size(r, 2)
            s = s + r(2, i) * myfun(w2 + r(1, i) * w1)
        end do

        res = w1 * s
    end function


    function gaussquad(n) result(r)
        integer(kind=8):: n
        real(kind=8), parameter :: pi = 4*atan(1._8)
        real(kind=8):: r(2, n), x, f, df, dx
        procedure(integrated):: myfun
        integer:: i,  iter
        real(kind=8), allocatable :: p0(:), p1(:), tmp(:)
        integer:: k
 
        p0 = [1._8]
        p1 = [1._8, 0._8]
 
        do k = 2, n
           tmp = ((2*k-1)*[p1,0._8]-(k-1)*[0._8, 0._8,p0])/k
           p0 = p1; p1 = tmp
        end do
        do i = 1, n
          x = cos(pi*(i-0.25_8)/(n+0.5_8))
          do iter = 1, 10
            f = p1(1); df = 0._8
            do k = 2, size(p1)
              df = f + x*df
              f  = p1(k) + x * f
            end do
            dx =  f / df
            x = x - dx
            if (abs(dx)<10*epsilon(dx)) exit
          end do
          r(1,i) = x
          r(2,i) = 2/((1-x**2)*df**2)
        end do
    end function
end module mod_integrate

