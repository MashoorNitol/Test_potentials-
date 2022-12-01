# NOTE: This script can be modified for different pair styles
# See in.elastic for more info.

# Choose potential
pair_style  rann
pair_coeff * *  Sn_2.nn.677 Sn

#pair_style meam/c
#pair_coeff * * library.meam Sn Sn.meam Sn

# Setup neighbor style
neighbor 1.0 nsq
neigh_modify once no every 1 delay 0 check yes

# Setup minimization style
min_style        cg
min_modify       dmax ${dmax} line quadratic

# Setup output
thermo      1
thermo_style custom step temp pe press pxx pyy pzz pxy pxz pyz lx ly lz vol
thermo_modify norm no
variable natoms equal "count(all)"
variable ecoh equal "pe/v_natoms"
variable LX0 equal "lx"
variable LY0 equal "ly"
variable LZ0 equal "lz"
variable CArat equal "v_LZ0/v_LX0"
