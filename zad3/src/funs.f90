module mod_funs
implicit none
    real(kind=8), dimension(10):: coeffs = [1, 4, 6, 1, 2, 6, 7, 2, 1, 2]

contains

function mysin(x) result(y)
    real(kind=8), intent(in):: x
    real(kind=8):: y

    y = sin(x)
end function mysin

function myexp(x) result(y)
    real(kind=8), intent(in):: x
    real(kind=8):: y

    y = exp(x)
end function myexp 

function poly1 (x) result(y)
    real(kind=8), intent(in):: x
    real(kind=8):: y
    y = poly(x, 1)
end function

function poly2 (x) result(y)
    real(kind=8), intent(in):: x
    real(kind=8):: y
    y = poly(x, 2)
end function

function poly3 (x) result(y)
    real(kind=8), intent(in):: x
    real(kind=8):: y
    y = poly(x, 3)
end function

function poly4 (x) result(y)
    real(kind=8), intent(in):: x
    real(kind=8):: y
    y = poly(x, 4)
end function

function poly5 (x) result(y)
    real(kind=8), intent(in):: x
    real(kind=8):: y
    y = poly(x, 5)
end function

function poly6 (x) result(y)
    real(kind=8), intent(in):: x
    real(kind=8):: y
    y = poly(x, 6)
end function

function poly7 (x) result(y)
    real(kind=8), intent(in):: x
    real(kind=8):: y
    y = poly(x, 7)
end function

function poly8 (x) result(y)
    real(kind=8), intent(in):: x
    real(kind=8):: y
    y = poly(x, 8)
end function

function poly9 (x) result(y)
    real(kind=8), intent(in):: x
    real(kind=8):: y
    y = poly(x, 9)
end function

function poly10 (x) result(y)
    real(kind=8), intent(in):: x
    real(kind=8):: y
    y = poly(x, 10)
end function

function poly(x, p) result(y)
    real(kind=8), intent(in):: x
    integer(kind=4), intent(in):: p
    integer(kind=4):: i
    real(kind=8):: y

    y = 0.0
    do i = 1, p 
       y = y + (coeffs(i) * x**i) 
    end do
end function

end module mod_funs
