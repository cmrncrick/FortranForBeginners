program main

implicit none

integer :: x = 1
integer :: y = 2

! If, Elif, Else
if (x > y) then
    print *, x
else
    print*, y
end if

! If with single statement
if (x < y) print *, x

! select case
select case (x)
    case (2)
        print *, "Line 21"
    case (1)
        print *, "Line 23"
! case default
!     ! 
end select

select case (4)
    case (:4)
        print *, "Hi"
    case default
        print *, "Line 32"
end select


! SELECT CASE example in Fortran

! SELECT CASE evaluates the value of variable x.
! It then compares x against each CASE condition in order.
! The expression inside SELECT CASE must be a single variable or expression.
select case (x)
    
    ! CASE (2) matches when x == 2.
    ! Only constant values or constant ranges are allowed in CASE.
    case (2)                 
        ! Executes if x equals 2.
        print *, "Line 47"   

    ! CASE (1) matches when x == 1.
    ! Each CASE is checked top-down. If x == 1, this block runs.
    case (1)
        ! Executes if x equals 1.
        print *, "Line 53"

    ! (Optional) CASE DEFAULT can be added at the end as a fallback
    case default
        ! if none of the CASE values match.
        print *, "Defaulting Here"

! Marks the end of the SELECT CASE block.
end select

end program main