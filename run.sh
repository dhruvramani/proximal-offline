# Note: all paths referenced here are relative to the Docker container.
#
# Add the Nvidia drivers to the path
export PATH="/usr/local/nvidia/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/nvidia/lib:$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/storage/home/dhruvramani/.mujoco/mujoco200/bin

# Tools config for CUDA, Anaconda installed in the common /tools directory
source /scratch/scratch2/dhruvramani/config.sh
# Activate your environment
source /scratch/scratch2/dhruvramani/miniconda3/bin/activate 
source /scratch/scratch2/dhruvramani/py3/bin/activate

# Change to the directory in which your code is present
cd /storage/home/dhruvramani/proximal-offline/
# Run the code. The -u option is used here to use unbuffered writes
# so that output is piped to the file as and when it is produced.
# Here, the code is the MNIST Tensorflow example.
python3 main.py &> proximal_offline.out
python3 main.py --algo_name BEAR &> bear.out
