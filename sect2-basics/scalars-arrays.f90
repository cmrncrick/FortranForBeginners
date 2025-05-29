program main

    implicit none

    integer :: i
    integer :: squares(10)

    squares = 0

    print *, squares

    do i = 1, 10
        squares(i) = i**2
    end do

    do i = 10, 1, -1
        print *, squares(i)
    end do

    ! Slice of an array
    print *, squares(2:4)



end program main