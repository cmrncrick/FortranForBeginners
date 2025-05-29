program main

implicit none

integer :: age
integer :: status
integer :: unit
character(len=20) :: hometown
character(len=20) :: name

! Providing initial value
name = "UNK"
age = 0
hometown = "UNK"

do
    ! Ask user for name
    print *, "Can you tell me your name, age, and where you live?"

    ! Read the user input
    read(*, *, iostat=status) name, age, hometown

    ! If there was a problem
    if (status == 0) exit
        print *, "Sorry, I didn't understand that."
end do

open(newunit=unit, file="hello.txt", status="REPLACE")

! Say hello
! Trim will cut off unneeded white space
! print *, "Hello, " // trim(name) // "!"
! print *, "You look great for ", age
! print *, "What's the weather like in " // trim(hometown) // "?"

write(unit, *) "Hello, " // trim(name) // "!"
write(unit, *) "You look great for ", age
write(unit, *) "What's the weather like in " // trim(hometown) // "?"

close(unit)

end program main