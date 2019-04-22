program main

use naivemath
use bettermath
use dotmath

implicit none

real(kind=4), dimension(:, :), allocatable:: A1
real(kind=4), dimension(:, :), allocatable:: B1
real(kind=4), dimension(:, :), allocatable:: C1

integer:: i, j

allocate(A1(2, 3))
allocate(B1(3, 1))
allocate(C1(2, 1))

print *, size(A1, 2)
print *, size(A1, 1)

do j = 1, size(A1, 2)
    do i = 1, size(A1, 1)
        A1(i, j) = real(i + j, 4)
    end do
end do

do j = 1, size(B1, 2)
    do i = 1, size(B1, 1)
        B1(i, j) = real(i + j, 4)
    end do
end do

!C1 = naivemul(A1, B1)
!C1 = betmul(A1, B1)
C1 = dotmul(A1, B1)

print *, A1
print *, B1
print *, C1

end program main
