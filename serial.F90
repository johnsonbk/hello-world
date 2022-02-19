program serial
  use netcdf
  implicit none
  
  ! Name of the input file
  CHARACTER(len = *), parameter :: file_name = "input_file.nc"
  
  ! Declare the ids for the file and variable
  integer :: NCID, VARID
  
  ! Declare and assign the dimension sizes
  integer, parameter :: NLEV = 32, NLAT = 192, NLON = 288
  
  ! Declare an empty array
  real :: LEV(NLEV)
  real :: LAT(NLAT)
  real :: LON(NLON)

  ! Open the file
  print *, 'Open the file.'
  call check( nf90_open(FILE_NAME, NF90_NOWRITE, NCID) )
  
  ! Get the varid of the data variable, based on its name.
  call check( nf90_inq_varid(NCID, "lev", VARID) )
  call check( nf90_get_var(NCID, VARID, LEV) )
  call check( nf90_inq_varid(NCID, "lat", VARID) )
  call check( nf90_get_var(NCID, VARID, LAT) )
  call check( nf90_inq_varid(NCID, "lon", VARID) )
  call check( nf90_get_var(NCID, VARID, LON) )
  
  ! Print one of the values
  print *, "LEV(2) = ", LEV(2)
  print *, "LAT(2) = ", LAT(2)
  print *, "LON(2) = ", LON(2)
  
  ! Close the file, freeing all resources.
  call check( nf90_close(NCID) )
  
  print *, 'Success reading example file ', FILE_NAME, '!'

contains
  subroutine check(STATUS)
    integer, intent ( in ) :: STATUS

    if(STATUS /= nf90_noerr) then
      print *, trim(nf90_strerror(STATUS))
      stop "Stopped"
    end if
  end subroutine check 
end program serial

