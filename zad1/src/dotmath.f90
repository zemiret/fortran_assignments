module dotmath 
    implicit none
    private

    public:: dotmul 
    private:: mul4, mul8, mul16

    interface dotmul 
       procedure mul4, mul8, mul16 
    end interface

contains
    function mul4(A, B) result(C)
        real(kind = 4), intent(in), dimension(:, :) :: A, B
        real(kind = 4) :: C(size(A, 1), size(B, 2)) 
        integer:: i, j, k
        C = 0

        do i = 1, size(A, 1)
            do j = 1, size(B, 2)
                C(i, j) = dot_product(A(i,:), B(:,j))
            end do
        end do
    end function mul4

    function mul8(A, B) result(C)
        real(kind = 8), intent(in), dimension(:, :) :: A, B
        real(kind = 8) :: C(size(A, 1), size(B, 2)) 
        integer:: i, j, k
        C = 0

        do i = 1, size(A, 1)
            do j = 1, size(B, 2)
                C(i, j) = dot_product(A(i,:), B(:,j))
            end do
        end do
    end function mul8

    function mul16(A, B) result(C)
        real(kind = 16), intent(in), dimension(:, :) :: A, B
        real(kind = 16) :: C(size(A, 1), size(B, 2)) 
        integer:: i, j, k
        C = 0

        do i = 1, size(A, 1)
            do j = 1, size(B, 2)
                C(i, j) = dot_product(A(i,:), B(:,j))
            end do
        end do
    end function mul16

end module dotmath 
