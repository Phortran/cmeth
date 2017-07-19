program test_FDAFDC
  use FDA
  implicit none
  real(kind(0.d0)), dimension(5)     :: xpts
  real(kind(0.d0)), dimension(5, 2)  :: c
  real(kind(0.d0))                   :: xbar
  integer                            :: i
  

  do i = 1, 5
    xpts(i) = real(i)
  end do

  xbar = 2.d5

  call FDAFDC(xbar,xpts,c)

  print '(a,5f3.2)', "Coefficienti: ", c

end program test_FDAFDC
