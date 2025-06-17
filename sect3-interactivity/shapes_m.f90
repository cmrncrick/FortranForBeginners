module shapes_m

    implicit none

    private

    type, public, abstract :: Shape_t
        private
        contains
            private 
            procedure(areaI), public, deferred :: area    
    end type Shape_t

    abstract interface
        elemental function areaI(self) result(area)
            import Shape_t
            class(Shape_t), intent(in) :: self
            real :: area
        end function areaI
    end interface

    type, public, extends(Shape_t) :: Circle_t
        private
        real :: radius
        contains
            private
            procedure, public :: area => circleArea
    end type Circle_t

    type, public, extends(Shape_t) :: Rectangle_t
        private
        real :: height
        real :: width
        contains
            procedure, public :: area => rectangleArea
    end type Rectangle_t

    public :: Circle, Rectangle

    contains
        elemental function Circle(radius)
            real, intent(in) :: radius
            type(Circle_t) :: Circle

            Circle%radius = radius
        end function Circle

        elemental function Rectangle(height, width)
            real, intent(in) :: height
            real, intent(in) :: width
            type(Rectangle_t) :: Rectangle

            Rectangle%height = height
            Rectangle%width = width
        end function Rectangle

        elemental function circleArea(self) result(area)
            class(Circle_t), intent(in) :: self
            real :: area

            area = 3.1415 * self%radius
        end function circleArea

        elemental function rectangleArea(self) result(area)
            class(Rectangle_t), intent(in) :: self
            real :: area

            area = self%height * self%width
        end function rectangleArea
    
end module shapes_m