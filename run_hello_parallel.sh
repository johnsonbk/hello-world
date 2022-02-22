#!/bin/bash
#SBATCH -N 1
#SBATCH --partition=workq
#SBATCH -J hello_parallel
#SBATCH --mail-user=johnsonb@ucar.edu
#SBATCH --mail-type=ALL
#SBATCH -A k1421
#SBATCH -t 00:15:00
#SBATCH -e run_hello_parallel.%j.err
#SBATCH -o run_hello_parallel.%j.out

#OpenMP settings:
export OMP_NUM_THREADS=1


#run the application:
srun --hint=nomultithread --ntasks=32 --ntasks-per-node=32 --ntasks-per-socket=16 --cpus-per-task=1 --ntasks-per-core=1 --mem-bind=v,local --cpu-bind=threads ./hello_parallel
