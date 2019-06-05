program main
use mod_integrate
use mod_funs

implicit none


real(kind = 8):: ibeg, iend, pi
!procedure(integrated):: myfun
real(kind=8):: res 

pi = 4.D0 * DATAN(1.D0)

ibeg = 0
iend = pi

res = sq_integrate(ibeg, iend, mysin, 0) 
print *, res

res = trap_integrate(ibeg, iend, mysin, 0) 
print *, res

iend = 1
res = sq_integrate(ibeg, iend, poly6, 0) 
print *, res

res = trap_integrate(ibeg, iend, poly6, 0) 
print *, res

end program main
