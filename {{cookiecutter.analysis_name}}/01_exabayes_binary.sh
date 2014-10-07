#!/bin/bash
#PBS -q single
#PBS -l nodes=1:ppn=1
#PBS -l walltime=2:00:00
#PBS -o 01_exabayes_binary.stdout
#PBS -e 01_exabayes_binary.stderr
#PBS -N 01_exabayes_binary
#PBS -A {{cookiecutter.allocation_name}}

export workdir={{cookiecutter.top_level_directory}}/{{cookiecutter.analysis_name}}
export phylip=$workdir/{{cookiecutter.phylip_file}}

# keep the binary alignment file with the best tree
cd $workdir
# processing starts
date
# run command
parser -s $phylip -q aln.part -n {{cookiecutter.phylip_file}}
# processing ends
date
# done
exit 0
