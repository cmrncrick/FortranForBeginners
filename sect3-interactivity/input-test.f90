program main

implicit none

integer :: base_num
integer :: power_num
integer :: result
integer :: status

do

    print *, "What is the base number?"

    read(*, *, iostat=status) base_num

    if (status == 0) exit
        print *, "Sorry, I didn't understand that."
end do

do
    print *, "To what power?"

    read (*, *, iostat=status) power_num

    if (status == 0) exit
        print *, "Sorry, I didn't understand that."
end do

result = (base_num**power_num)

print *, "Your result is ", result

end program main