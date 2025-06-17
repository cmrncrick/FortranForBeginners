program shapes

    use shapes_m, only: Shape_t, Circle, Rectangle

    implicit none

    class(Shape_t), allocatable :: shape1
    class(Shape_t), allocatable :: shape2

    allocate(shape1, source = Circle(2.0))
    allocate(shape2, source = Rectangle(3.0, 4.0))

    print *, shape1%area()
    print *, shape2%area()

end program shapes