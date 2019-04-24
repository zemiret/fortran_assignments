module matgenerator
    implicit none
    private

    public:: matinit, random_matrix4, random_matrix8, random_matrix16

    contains
        subroutine matinit()
            call random_seed()
        end subroutine matinit

        function random_matrix4(n, k) result(RES)
            integer, intent(in):: n, k  ! n - rows, k - cols count 
            real(kind = 4):: RES(n, k)

            call random_number(RES)
        end function random_matrix4

        function random_matrix8(n, k) result(RES)
            integer, intent(in):: n, k  ! n - rows, k - cols count 
            real(kind = 8):: RES(n, k)

            call random_number(RES)
        end function random_matrix8

        function random_matrix16(n, k) result(RES)
            integer, intent(in):: n, k  ! n - rows, k - cols count 
            real(kind = 16):: RES(n, k)

            call random_number(RES)
        end function random_matrix16
end module matgenerator
