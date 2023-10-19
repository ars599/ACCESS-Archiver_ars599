#!/bin/bash
set -a
#########################
#
# This is the wrapper for the ACCESS Archiver
# 21/01/2022
#
# Developed by Chloe Mackallah, CSIRO Aspendale
#
#########################
# USER SETTINGS

#comp_proj = NCI project to charge compute
comp_proj=p66

#base_dir = location above raw output directory
#base_dir=/scratch/p66/fd0474/archive
#base_dir=/scratch/p66/txz599/archive
# highres /g/data/p66/mrd599/cq880
#base_dir=/g/data/p66/mrd599
#base_dir=/scratch/p66/ars599/archive
#base_dir=/scratch/p66/dhb599/archive
#base_dir=/scratch/p66/ars599/cylc-run/
#base_dir=/g/data/p66/mrd599
#base_dir=/scratch/p66/txz599/ACCESS_output
base_dir=/scratch/w40/dxd565/mom/archive

#arch_dir = location to archive
# for cmip runs
#arch_dir=/g/data/p73/archive/CMIP6/ACCESS-ESM1-5/
#arch_dir=/g/data/p73/archive/CMIP6/ACCESS-CM2/
# for non-cmip runs
#arch_dir=/g/data/p73/archive/non-CMIP/ACCESS-ESM1-5/
#arch_dir=/scratch/p73/ars599/ACCESS_output/
#arch_dir=/scratch/p66/ars599/ACCESS_output/
arch_dir=/g/data/p66/ars599/ACCESS_output/

#access_version = [cm2, cm2amip, cm2chem, esmscript, esmpayu, om2, gfdlpayu]
access_version=gfdlpayu

#ncexists = [true, false]
#true: Copy netcdf version of file if it exists; false: Always use UM pp-file if it exists, whether or not netcdf version exists
ncexists=false

#subdaily = [true, false]; convert subdaily atm files?
subdaily=false

#loc_exps = list of local experiment names (stored in 'base_dir') to archive
loc_exps=(
coralsea
twins
)

#task = [archive, check]
#archive: run ACCESS_Archiver.sh; check: run Archive_checker.sh
task=archive

# Optionally set year range to archive.
# Default if unset is all.
#first_year=1
#last_year=100

#
#########################
# DO NOT EDIT - FIXED TASKS

#run Archiver or checker
for loc_exp in ${loc_exps[@]}; do
  if [[ $task == archive ]]; then
    ./ACCESS_Archiver.sh
  elif [[ $task == check ]]; then
    ./Archive_checker.sh
  else
    echo "could not identify 'task'"; exit
  fi
done

#########################

exit
