# Quick XLNet QANet test

### Steps

1. Build the container, e.g. `docker build -t hf .`
1. To test on a single multi-gpu node, start like this: `docker run --rm --gpus all --ipc=host -ti hf bash`
1. Edit runmp.sh to set the correct number of local GPUs 
1. Start the run, e.g. sh runmp.sh

If you are running across multiple nodes, your setup will depend on your scheduler (e.g. Slurm, LSF...). Each nvidia container contains mpi compiled with Slurm bindings.
If you don't have one of these schedulers, additional instructions are needed
