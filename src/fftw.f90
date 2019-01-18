module fftw
  use params, only: nfft
  implicit none 
  include 'fftw3.f'
  
  complex(kind(0d0)), allocatable :: cx(:)
  real(kind(0d0)), allocatable :: rx(:)
  integer(8) :: ifft, ifft2

  
contains
  
  !=====================================================================
  subroutine init_fftw()

    allocate(cx(nfft), rx(nfft))
    call dfftw_plan_dft_c2r_1d(ifft, nfft, cx, rx, FFTW_ESTIMATE)
    call dfftw_plan_dft_r2c_1d(ifft2, nfft, rx, cx, FFTW_ESTIMATE)
    
    return 
  end subroutine init_fftw
  !=====================================================================

end module fftw
