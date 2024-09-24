SUBROUTINE atom_info
   USE system_data_types
   IMPLICIT NONE
   INTEGER   I,J,K
   INTEGER, PARAMETER :: tl = 4, tn = 7, tk = 99
   INTEGER :: econfig(tl,tn,tk)
   CHARACTER*2 symbol_(tk)
   !REAL(dp), DIMENSION(99), PARAMETER :: 
      atom_mass = (/1.00797_dp,  &
      4.0026_dp,    6.939_dp,   9.0122_dp,   10.811_dp,&
      12.01115_dp,14.0067_dp,  15.9994_dp,  18.9984_dp,   &
      20.183_dp,22.9898_dp,  24.312_dp,  26.9815_dp,   &
      28.086_dp,  30.9738_dp,32.064_dp,   35.453_dp,   &
      39.948_dp,   39.102_dp,   40.080_dp,44.956_dp,   &
      47.900_dp,   50.942_dp,   51.996_dp,   54.938_dp,&
      55.847_dp,   58.933_dp,   58.710_dp,   63.540_dp,   &
      65.370_dp,69.720_dp,   72.590_dp,   74.922_dp,   &
      78.960_dp,   79.909_dp,83.800_dp,   85.470_dp,   &
      87.620_dp,   88.905_dp,   91.220_dp,92.906_dp,   &
      95.940_dp,   98.000_dp,  101.070_dp,  102.905_dp,&
      106.400_dp,  107.870_dp,  112.400_dp,  114.820_dp,  &
      118.690_dp,121.750_dp,  127.600_dp,  126.904_dp,  &
      131.300_dp,  132.905_dp,137.340_dp,  138.910_dp,  &
      140.120_dp,  140.907_dp,  144.240_dp,147.000_dp,  &
      150.350_dp,  151.960_dp,  157.250_dp,  158.924_dp,&
      162.500_dp,  164.930_dp,  167.260_dp,  168.934_dp,  &
      173.040_dp,174.970_dp,  178.490_dp,  180.948_dp,  &
      183.850_dp,  186.200_dp,190.200_dp,  192.200_dp,  &
      195.090_dp,  196.967_dp,  200.590_dp,204.370_dp,  &
      207.190_dp,  208.980_dp,  210.000_dp,  210.000_dp,&
      222.000_dp, 250.0_dp, 250.0_dp,250.0_dp,250.0_dp,&
      250.0_dp,250.0_dp,250.0_dp,250.0_dp,250.0_dp,&
      250.0_dp,250.0_dp,250.0_dp,250.0_dp/)

    DATA symbol_/'H','He','Li','Be','B','C','N','O',&
             'F','Ne','Na','Mg','Al','Si','P','S','Cl',&
             'Ar','K','Ca','Sc','Ti','V','Cr','Mn','Fe',&
             'Co','Ni','Cu','Zn','Ga','Ge','As','Se','Br',&
             'Kr','Rb','Sr','Y','Zr','Nb','Mo','Tc','Ru','Rh',&
             'Pd','Ag','Cd','In','Sn','Sb','Te','I','Xe',&
             'Cs','Ba','La','Ce','Pr','Nd','Pm','Sm','Eu','Gd',&
             'Tb','Dy','Ho','Er','Tm','Yb','Lu','Hf','Ta','W',&
             'Re','Os','Ir','Pt','Au','Hg','Tl','Pb','Bi','Po',&
             'At','Rn','Fr','Ra','Ac','Th','Pa','U','Np','Pu',&
             'Am','Cm','Bk','Cf','Es'/
     
     
     econfig(:, :,1:tk) = RESHAPE([&
     1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,&
     2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,&
     2,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,&
     2,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,&
     2,0,0,0,2,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,&
     2,0,0,0,2,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,&
     2,0,0,0,2,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,&
     2,0,0,0,2,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,&
     2,0,0,0,2,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,1,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,2,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,3,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,5,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,5,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,6,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,7,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,8,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,0,0,1,0,0,0,0,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,0,0,2,0,0,0,0,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,1,0,2,0,0,0,0,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,2,0,2,0,0,0,0,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,4,0,1,0,0,0,0,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,5,0,1,0,0,0,0,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,6,0,1,0,0,0,0,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,7,0,1,0,0,0,0,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,8,0,1,0,0,0,0,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,10,0,0,0,0,0,0,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,10,0,1,0,0,0,0,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,10,0,2,0,0,0,0,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,10,0,2,1,0,0,0,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,10,0,2,2,0,0,0,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,10,0,2,3,0,0,0,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,10,0,2,4,0,0,0,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,10,0,2,5,0,0,0,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,10,0,2,6,0,0,0,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,10,0,2,6,0,0,1,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,10,0,2,6,0,0,2,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,10,0,2,6,1,0,2,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,10,2,2,6,0,0,2,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,10,3,2,6,0,0,2,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,10,4,2,6,0,0,2,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,10,5,2,6,0,0,2,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,10,6,2,6,0,0,2,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,10,7,2,6,0,0,2,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,10,7,2,6,1,0,2,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,10,9,2,6,0,0,2,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,10,10,2,6,0,0,2,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,10,11,2,6,0,0,2,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,10,12,2,6,0,0,2,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,10,13,2,6,0,0,2,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,10,14,2,6,0,0,2,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,10,14,2,6,1,0,2,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,10,14,2,6,2,0,2,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,10,14,2,6,3,0,2,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,10,14,2,6,4,0,2,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,10,14,2,6,5,0,2,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,10,14,2,6,6,0,2,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,10,14,2,6,7,0,2,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,10,14,2,6,9,0,1,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,10,14,2,6,10,0,1,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,10,14,2,6,10,0,2,0,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,10,14,2,6,10,0,2,1,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,10,14,2,6,10,0,2,2,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,10,14,2,6,10,0,2,3,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,10,14,2,6,10,0,2,4,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,10,14,2,6,10,0,2,5,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,10,14,2,6,10,0,2,6,0,0,0,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,10,14,2,6,10,0,2,6,0,0,1,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,10,14,2,6,10,0,2,6,0,0,2,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,10,14,2,6,10,0,2,6,1,0,2,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,10,14,2,6,10,0,2,6,2,0,2,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,10,14,2,6,10,2,2,6,1,0,2,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,10,14,2,6,10,3,2,6,1,0,2,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,10,14,2,6,10,4,2,6,1,0,2,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,10,14,2,6,10,6,2,6,0,0,2,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,10,14,2,6,10,7,2,6,0,0,2,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,10,14,2,6,10,7,2,6,1,0,2,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,10,14,2,6,10,9,2,6,0,0,2,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,10,14,2,6,10,10,2,6,0,0,2,0,0,0,&
     2,0,0,0,2,6,0,0,2,6,10,0,2,6,10,14,2,6,10,11,2,6,0,0,2,0,0,0],&
     [tl,tn,tk])

      DO i=1,tk
        !atom_mass(i)=atom_mass_1(i)
        symbol(i)=symbol_(i)
        DO j=1,tn
          DO k=1,tl
            e_config(k,j,i)=econfig(k,j,i)
          ENDDO
        ENDDO
      ENDDO

      RETURN
      END SUBROUTINE atom_info
