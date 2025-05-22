program main

    implicit none

    ! Variables will be whacky values if not assigned like below
    INTEGER*4 interval
    INTEGER :: x
    integer :: y

    ! Declaring a variable and assigning value
    ! Value cannot be changed
    integer, parameter :: inches_per_foot = 12

    print *, interval
    print *, "x = ", x
    print *, "y = ", y

    interval = 0
    x = 0
    y = 0

    print *, interval
    print *, "x = ", x
    print *, "y = ", y

end program main