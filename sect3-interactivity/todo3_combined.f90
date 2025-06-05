program todo3
    use todo_routines_m, only: readPreviousTasks, interact, TASK_LENGTH, MAX_TASKS

    implicit none

    integer :: num_tasks
    character(len=TASK_LENGTH) :: tasks(MAX_TASKS)

    call readPreviousTasks(tasks, num_tasks)
    call interact(tasks, num_tasks)
end program todo3

module todo_routines_m
    implicit none
    private

    integer, public, parameter :: MAX_TASKS = 99
    integer, public, parameter :: TASK_LENGTH = 100
    character(len=*), parameter :: TODO_FILE = "todo.txt"

    public :: readPreviousTasks, interact
contains
    subroutine readPreviousTasks(tasks_, num_tasks_)
        character(len=TASK_LENGTH), intent(out) :: tasks_(MAX_TASKS)
        integer, intent(out) :: num_tasks_

        integer :: i
        integer :: status
        integer :: unit

        open(newunit=unit, file=TODO_FILE)

        do i = 1, MAX_TASKS
            read(unit, '(A)', iostat=status) tasks_(i)
            if (status /= 0) then
                num_tasks_ = i - 1
                exit
            else
                num_tasks_ = i
            end if
        end do

        close(unit)
    end subroutine readPreviousTasks

    subroutine interact(tasks_, num_tasks_)
        character(len=TASK_LENGTH), intent(inout) :: tasks_(MAX_TASKS)
        integer, intent(inout) :: num_tasks_

        integer :: i
        character(len=1) :: response

        do
            print *, "Here are your current tasks"
            do i = 1, num_tasks_
                print '(I3,") ",A)', i, trim(tasks_(i))
            end do

            print *, "What would you like to do? (a)dd, (d)elete, (q)uit"
            read(*, '(A1)') response

            select case (response)
            case ('a')
                call add(tasks_, num_tasks_)
            case ('d')
                call delete(tasks_, num_tasks_)
            case ('q')
                exit
            case default
                print *, "Sorry, I didn't understand that."
            end select

            call save(tasks_, num_tasks_)
        end do
    end subroutine interact

    subroutine add(tasks_, num_tasks_)
        character(len=TASK_LENGTH), intent(inout) :: tasks_(MAX_TASKS)
        integer, intent(inout) :: num_tasks_

        print *, "What's the task?"
        num_tasks_ = num_tasks_ + 1
        read(*, '(A)') tasks_(num_tasks_)
    end subroutine add

    subroutine delete(tasks_, num_tasks_)
        character(len=TASK_LENGTH), intent(inout) :: tasks_(MAX_TASKS)
        integer, intent(inout) :: num_tasks_

        integer :: i
        integer :: status
        integer :: task

        do
            print *, "Which one would you like to delete?"
            read(*, *, iostat=status) task
            if (status == 0) then
                if (task < 1) then
                    print *, "Task number must be > 1"
                else if (task > num_tasks_) then
                    print *, "Task number must be <= ", num_tasks_
                else
                    do i = task, num_tasks_
                        tasks_(i) = tasks_(i+1)
                    end do
                    num_tasks_ = num_tasks_ - 1
                    exit
                end if
            else
                print *, "Sorry, I didn't understand that."
            end if
        end do
    end subroutine delete

    subroutine save(tasks_, num_tasks_)
        character(len=TASK_LENGTH), intent(in) :: tasks_(MAX_TASKS)
        integer, intent(in) :: num_tasks_

        integer :: i
        integer :: unit

        open(newunit=unit, file=TODO_FILE, status='REPLACE')

        do i = 1, num_tasks_
            write(unit, '(A)') trim(tasks_(i))
        end do

        close(unit)
    end subroutine save
end module todo_routines_m
