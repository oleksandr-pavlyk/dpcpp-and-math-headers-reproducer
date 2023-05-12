# Instructions to reproduce

```bash
# proxies should be set up

# N.B.: The script below installs miniconda into $HOME/miniconda3
#       Adjust as needed to avoid exceeding disk quota

wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
chmod 755 Miniconda3-latest-Linux-x86_64.sh
./Miniconda3-latest-Linux-x86_64.sh -b -p $HOME/miniconda3
. miniconda3/etc/profile.d/conda.sh
git clone https://github.com/IntelPython/dpctl.git -b feature/elementwise-functions
cd dpctl
conda activate
conda build conda-recipe -c intel --no-test --python=3.9 --numpy=1.21
```

Once the build has failed, look for the folder `miniconda3/conda-bld/dpctl_XXXXX/work` in the log. For example, in my case the trailing part of the failed build log was

```
  File "/home/opavlyk/miniconda3/lib/python3.9/site-packages/conda_build/utils.py", line 391, in _func_defaulting_env_to_os_environ
    raise subprocess.CalledProcessError(proc.returncode, _args)
subprocess.CalledProcessError: Command '['/bin/bash', '-o', 'errexit', '/home/opavlyk/miniconda3/conda-bld/dpctl_1683924134428/work/conda_build.sh']' returned non-zero exit status 1.
```

Copy script run.sh into that folder and then change into it:

```bash
cp run.sh /home/opavlyk/miniconda3/conda-bld/dpctl_1683924134428/work
cd /home/opavlyk/miniconda3/conda-bld/dpctl_1683924134428/work
chmod 755 run.sh
./run.sh
```

Running this script reproduces the problem for me.
