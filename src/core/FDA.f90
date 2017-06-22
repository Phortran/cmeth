!> @brief Finite Difference Approximations module
module FDA
implicit none

contains

  !> @brief Finite Difference Coefficient calculation

  !> Compute coefficients for finite difference approximation for the
  !! derivative of order k at xbar based on grid values at points in xpt.
  !!
  !! @param[in]   xbar   location at which we want to approximate the derivative
  !!                     (may but need not be a grid point)
  !! @param[in]   xpt    grid point locations which the stencil is to extend over
  !!                     (distinct, otherwise arbitrary)
  !! @param[out]  c      weights at grid locations xpt(0:n) for derivatives
  !!                     of order 0:m, found in c(0:n,0:m)
  subroutine FDAFDC(xbar, xpt, c)
    real(kind(0.d0)), intent(in)                    :: xbar
    real(kind(0.d0)), intent(in), dimension(:)      :: xpt
    real(kind(0.d0)), intent(out), dimension(:,:)   :: c

    ! local variables
    real(kind(0.d0))                                :: c1, c2, c3, c4, c5
    integer                                         :: k, j, i, mn, devs

    devs = size(c, dim=2)
    c1 = 1.d0
    c4 = xpt(1)-xbar

    do k = 1, devs
      do j = 1 , size(c, dim=1)
        c(j,k) = 0.d0
      end do
    end do

    c(1,1) = 1.d0
    do i = 2, size(c, dim=1)
      mn = min(i,devs)
      c2 = 1.0d0
      c5 = c4
      c4 = xpt(i) - xbar

      do j = 1, i
        c3 = xpt(i)-xpt(j)
        c2 = c2 * c3

        if ( j .eq. i ) then
          do k = mn, 1, -1
            c(i,k) = c1 * (k * c(i-1,k-1) - c5 * c(i-1,k))/c2
          end do

          c(i,1) = -c1 * c5 * c(i-1,1)/c2
        endif

        do k = mn, 2, -1
          c(j,k) = (c4 * c(j,k) - k * c(j,k-1))/c3
        end do

        c(j,1) = c4 * c(j,1)/c3
      end do

      c1 = c2
    end do

  end subroutine FDAFDC


end module FDA
