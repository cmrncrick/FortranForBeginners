program fib

implicit none

! Initializes needed variables
integer :: fibs(10)
integer :: i

! Assigns first 2 variables of fibs
fibs(1) = 1
fibs(2) = 1

! Calculating the fibs values starting with bit 3
do i = 3, 10
    fibs(i) = fibs(i-1) + fibs(i-2)
end do

! Print fibs
do i = 1, 10
    print *, fibs(i)
end do



end program fib