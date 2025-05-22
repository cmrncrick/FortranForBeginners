program main

implicit none

INTEGER*4 i,P

! Loop over P by an increment of 2 until it gets to 10
Do P = 1, 10, 2
    print *, P
End Do



! Will print In once before breaking loop
Do While (P < 12)
    print *, "In"
    print *, P
    P = 13
End Do




end program main