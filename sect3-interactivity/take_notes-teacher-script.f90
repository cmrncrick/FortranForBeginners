program take_notes
    implicit none

    character(len=*), parameter :: NOTES_FILE = "notes.txt"
    character(len=100) :: note
    integer :: unit

    open(newunit = unit, file = NOTES_FILE, position = 'APPEND')

    do
        print *, "Enter some notes. Enter 'DONE' to quit."
        read(*, '(A)') note
        if (trim(note) == "DONE") exit
        write(unit, '(A)') trim(note)
    end do

    close(unit)
end program take_notes
