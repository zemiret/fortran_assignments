program main

use naivemath
use bettermath
use dotmath
use matgenerator

implicit none

real(kind=4), dimension(:, :), allocatable:: A1, B1, C1
real(kind=8), dimension(:, :), allocatable:: A2, B2, C2
real(kind=16), dimension(:, :), allocatable:: A3, B3, C3
real :: start, finish

integer:: i, j

call matinit()

open(unit=1, file="res/plotdata/naive4.plt", action="write")
open(unit=2, file="res/plotdata/naive8.plt", action="write")
open(unit=3, file="res/plotdata/naive16.plt", action="write")

open(unit=11, file="res/plotdata/better4.plt", action="write")
open(unit=12, file="res/plotdata/better8.plt", action="write")
open(unit=13, file="res/plotdata/better16.plt", action="write")

open(unit=21, file="res/plotdata/dot4.plt", action="write")
open(unit=22, file="res/plotdata/dot8.plt", action="write")
open(unit=23, file="res/plotdata/dot16.plt", action="write")

open(unit=31, file="res/plotdata/matmul4.plt", action="write")
open(unit=32, file="res/plotdata/matmul8.plt", action="write")
open(unit=33, file="res/plotdata/matmul16.plt", action="write")

do i = 10, 1280, 10
    A1 = random_matrix4(i, i)
    B1 = random_matrix4(i, i)

    A2 = random_matrix8(i, i)
    B2 = random_matrix8(i, i)

    A3 = random_matrix16(i, i)
    B3 = random_matrix16(i, i)

    ! naivemul 
    call cpu_time(start)
         C1 = naivemul(A1, B1) 
    call cpu_time(finish)
    write(1, "(I4 f6.3)") i, (finish-start)

    call cpu_time(start)
         C2 = naivemul(A2, B2) 
    call cpu_time(finish)
    write(2, "(I4 f6.3)") i, (finish-start)

    call cpu_time(start)
         C3 = naivemul(A3, B3) 
    call cpu_time(finish)
    write(3, "(I4 f6.3)") i, (finish-start)

    ! betmul
    call cpu_time(start)
         C1 = betmul(A1, B1) 
    call cpu_time(finish)
    write(11, "(I4 f6.3)") i, (finish-start)

    call cpu_time(start)
         C2 = betmul(A2, B2) 
    call cpu_time(finish)
    write(12, "(I4 f6.3)") i, (finish-start)

    call cpu_time(start)
         C3 = betmul(A3, B3) 
    call cpu_time(finish)
    write(13, "(I4 f6.3)") i, (finish-start)

    ! dotmul
    call cpu_time(start)
        C1 = dotmul(A1, B1) 
    call cpu_time(finish)
    write(21, "(I4 f6.3)") i, (finish-start)

    call cpu_time(start)
        C2 = dotmul(A2, B2) 
    call cpu_time(finish)
    write(22, "(I4 f6.3)") i, (finish-start)

    call cpu_time(start)
        C3 = dotmul(A3, B3) 
    call cpu_time(finish)
    write(23, "(I4 f6.3)") i, (finish-start)

    ! matmul 
    call cpu_time(start)
        C1 = matmul(A1, B1) 
    call cpu_time(finish)
    write(31, "(I4 f6.3)") i, (finish-start)

    call cpu_time(start)
        C2 = matmul(A2, B2) 
    call cpu_time(finish)
    write(32, "(I4 f6.3)") i, (finish-start)

    call cpu_time(start)
        C3 = matmul(A3, B3) 
    call cpu_time(finish)
    write(33, "(I4 f6.3)") i, (finish-start)

    write(*, "(I4)") i
end do

end program main
