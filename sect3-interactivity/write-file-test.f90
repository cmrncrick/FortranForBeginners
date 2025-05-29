program main

    implicit none

    ! Initializing values
    character(len=100) :: note
    integer :: unit

    ! Opening file with append status
    open(newunit=unit, file="notes.txt", position="APPEND")

    do 
        print *, "Enter some notes."

        ! Reading in the note
        read(*, '(A)') note
        
        ! Exit the loop when user inputs DONE
        if (trim(note) == "DONE") exit

        ! Write the note to the file
        write(unit, *) trim(note)
    end do

    print *, "Exiting"

    ! Close file
    close(unit)

end program main