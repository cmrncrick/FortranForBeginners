program todo4
    use todo_m, only: Todo_t

    implicit none

    type(Todo_t) :: todo

    call todo%readPreviousTasks()
    call todo%interact()
end program todo4

module todo_m
    implicit none
    private

    integer, parameter :: MAX_TASKS = 99
    integer, parameter :: TASK_LENGTH = 100
    character(len=*), parameter :: TODO_FILE = "todo.txt"

    type, public :: Todo_t
        private
        character(len=TASK_LENGTH) :: tasks(MAX_TASKS)
        integer :: num_tasks
    contains
        private
        procedure, public :: readPreviousTasks
        procedure, public :: interact
        procedure :: add
        procedure :: delete
        procedure :: save
    end type Todo_t
contains
    subroutine readPreviousTasks(self)
        class(Todo_t), intent(out) :: self

        integer :: i
        integer :: status
        integer :: unit

        open(newunit=unit, file=TODO_FILE)

        do i = 1, MAX_TASKS
            read(unit, '(A)', iostat=status) self%tasks(i)
            if (status /= 0) then
                self%num_tasks = i - 1
                exit
            else
                self%num_tasks = i
            end if
        end do

        close(unit)
    end subroutine readPreviousTasks

    subroutine interact(self)
        class(Todo_t), intent(inout) :: self

        integer :: i
        character(len=1) :: response

        do
            print *, "Here are your current tasks"
            do i = 1, self%num_tasks
                print '(I3,") ",A)', i, trim(self%tasks(i))
            end do

            print *, "What would you like to do? (a)dd, (d)elete, (q)uit"
            read(*, '(A1)') response

            select case (response)
            case ('a')
                call self%add()
            case ('d')
                call self%delete()
            case ('q')
                exit
            case default
                print *, "Sorry, I didn't understand that."
            end select

            call self%save()
        end do
    end subroutine interact

    subroutine add(self)
        class(Todo_t), intent(inout) :: self

        print *, "What's the task?"
        self%num_tasks = self%num_tasks + 1
        read(*, '(A)') self%tasks(self%num_tasks)
    end subroutine add

    subroutine delete(self)
        class(Todo_t), intent(inout) :: self

        integer :: i
        integer :: status
        integer :: task

        do
            print *, "Which one would you like to delete?"
            read(*, *, iostat=status) task
            if (status == 0) then
                if (task < 1) then
                    print *, "Task number must be > 1"
                else if (task > self%num_tasks) then
                    print *, "Task number must be <= ", self%num_tasks
                else
                    do i = task, self%num_tasks
                        self%tasks(i) = self%tasks(i+1)
                    end do
                    self%num_tasks = self%num_tasks - 1
                    exit
                end if
            else
                print *, "Sorry, I didn't understand that."
            end if
        end do
    end subroutine delete

    subroutine save(self)
        class(Todo_t), intent(in) :: self

        integer :: i
        integer :: unit

        open(newunit=unit, file=TODO_FILE, status='REPLACE')

        do i = 1, self%num_tasks
            write(unit, '(A)') trim(self%tasks(i))
        end do

        close(unit)
    end subroutine save
end module todo_m
