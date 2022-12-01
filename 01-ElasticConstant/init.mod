# NOTE: This script can be modified for different atomic structures, 
# units, etc. See in.elastic for more info.
#

# Define the finite deformation size. Try several values of this
# variable to verify that results do not depend on it.
variable up equal 1.0e-6
 
# Define the amount of random jiggle for atoms
# This prevents atoms from staying on saddle points
variable atomjiggle equal 1.0e-4

# Uncomment one of these blocks, depending on what units
# you are using in LAMMPS and for output

# metal units, elastic constants in eV/A^3
#units		metal
#variable cfac equal 6.2414e-7
#variable cunits string eV/A^3

# metal units, elastic constants in GPa
units		metal
variable cfac equal 1.0e-4
variable cunits string GPa

# real units, elastic constants in GPa
#units		real
#variable cfac equal 1.01325e-4
#variable cunits string GPa

# Define minimization parameters
variable etol equal 1.0e-8
variable ftol equal 1.0e-8
variable maxiter equal 100000
variable maxeval equal 100000
variable dmax equal 1.0e-2

# generate the box and atom positions using a diamond lattice
boundary	p p p
atom_style      atomic
# diamond cubic
#variable a equal 6.649639224
#lattice custom $a a1 1.0 0.0 0.0 a2 0.0 1.0 0.0 a3 0.0 0.0 1.0 &
#                basis 0.0 0.0 0.0 basis 0.5 0.5 0.0 basis 0.5 0.0 0.5 basis 0.0 0.5 0.5 &
#                basis 0.25 0.25 0.25  basis 0.25 0.75 0.75 basis 0.75 0.25 0.75 basis 0.75 0.75 0.25

# beta Sn
variable a equal 5.909067992
lattice custom $a a1 1.0 0.0 0.0 a2 0.0 1.0 0.0 a3 0.0 0.0 0.5499413222862777 &
                basis 0.0 0.0 0.0 basis 0.5 0.0 0.25 basis 0.5 0.5 0.5 basis 0.0 0.5 0.75

region  whole prism 0.0 1.0 0.0 1.0 0 1.0 0.0 0.0 0.0 units lattice
create_box 1 whole
create_atoms 1 region whole

#replicate 2 2 2
# Need to set mass to something, just to satisfy LAMMPS
mass 1 118
