program to_the_power
    implicit none

    integer :: status
    integer :: x
    integer :: y

    do
        print *, "What's the base number?"
        read(*, *, iostat = status) x
        if (status == 0) exit
        print *, "Sorry, I didn't understand that."
    end do
    do
        print *, "To what power?"
        read(*, *, iostat = status) y
        if (status == 0) exit
        print *, "Sorry, I didn't understand that."
    end do
    print *, x, "**", y, " is ", x**y
end program to_the_power
