program todo

    implicit none

    character(len=1) :: response

    do

        print *, "Choose one: (a)first, (b)second, (c)third, (q)quit"
        read(*, '(A1)') response

        select case (response)

            case ('a')
                print *, "First"
            case ('b')
                print *, "Second"
            case ('c')
                print *, "Third"
            case ('q')
                exit
            case default
                print *, "Defaulted"

        end select

    end do


end program todo