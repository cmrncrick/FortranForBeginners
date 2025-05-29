program main

implicit none

integer :: age
integer :: status
integer :: unit
character(len=20) :: hometown
character(len=20) :: name

! ! Providing initial value
! name = "UNK"
! age = 0
! hometown = "UNK"

! Open the file
open(newunit=unit, file="hello_input.txt", status="OLD")

! Read the user input
read(unit, *, iostat=status) name, age, hometown

close(unit)

! Say hello
! Trim will cut off unneeded white space
print *, "Hello, " // trim(name) // "!"
print *, "You look great for ", age
print *, "What's the weather like in " // trim(hometown) // "?"

end program main