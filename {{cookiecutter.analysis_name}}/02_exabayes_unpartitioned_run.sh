#!/bin/bash
#PBS -q workq
#PBS -l nodes={{cookiecutter.analysis_nodes}}:ppn={{cookiecutter.analysis_ppn}}
#PBS -l walltime=72:00:00
#PBS -o 02_exabayes_unpartitioned.stdout
#PBS -e 02_exabayes_unpartitioned.stderr
#PBS -N 02_exabayes_unpartitioned
#PBS -A {{cookiecutter.allocation_name}}

export workdir={{cookiecutter.top_level_directory}}/{{cookiecutter.analysis_name}}
export phylip=$workdir/{{cookiecutter.phylip_file}}.binary

# compute some values on the fly
procs=$(({{cookiecutter.analysis_nodes}} * {{cookiecutter.analysis_ppn}}))

cd $workdir
mpirun -np $procs exabayes -f $phylip -n $phylip -s $RANDOM -c config.nexus
