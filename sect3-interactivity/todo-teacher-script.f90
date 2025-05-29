program todo
    implicit none

    integer, parameter :: MAX_TASKS = 99
    character(len=*), parameter :: TODO_FILE = "todo.txt"
    integer :: i
    integer :: num_tasks
    character(len=1) :: response
    integer :: status
    integer :: task
    character(len=100) :: tasks(MAX_TASKS)
    integer :: unit

    open(newunit=unit, file=TODO_FILE)

    do i = 1, MAX_TASKS
        read(unit, '(A)', iostat=status) tasks(i)
        if (status /= 0) then
            num_tasks = i - 1
            exit
        else
            num_tasks = i
        end if
    end do

    close(unit)

    do
        print *, "Here are your current tasks"
        do i = 1, num_tasks
            print '(I3,", ",A)', i, trim(tasks(i))
        end do

        print *, "What would you like to do? (a)dd, (d)elete, (q)uit"
        read(*, '(A1)') response

        select case (response)
        case ('a')
            print *, "What's the task?"
            num_tasks = num_tasks + 1
            read(*, '(A)') tasks(num_tasks)
        case ('d')
            do
                print *, "Which one would you like to delete?"
                read(*, *, iostat=status) task
                if (status == 0) then
                    if (task < 1) then
                        print *, "Task number must be > 1"
                    else if (task > num_tasks) then
                        print *, "Task number must be <= ", num_tasks
                    else
                        do i = task, num_tasks
                            tasks(i) = tasks(i+1)
                        end do
                        num_tasks = num_tasks - 1
                        exit
                    end if
                else
                    print *, "Sorry, I didn't understand that."
                end if
            end do
        case ('q')
            exit
        case default
            print *, "Sorry, I didn't understand that."
        end select

        open(newunit=unit, file=TODO_FILE, status='REPLACE')

        do i = 1, num_tasks
            write(unit, '(A)') trim(tasks(i))
        end do

        close(unit)
    end do
end program todo
