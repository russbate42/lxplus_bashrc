# .bashrc

##############################
## NONINTERACTIVE COMPONENT ##
##############################

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc

fi

# check if shell is in noninteractive
if [ -z "$PS1" ]; then
    # prompt var is not set, so this is *not* an interactive shell
    return
fi

###########################
## INTERACTIVE COMPONENT ##
###########################

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
export RUCIO_ACCOUNT=rbate
export ALRB_TutorialData=/cvmfs/atlas.cern.ch/repo/tutorials/asg/cern-mar2022
export KRB5_CONFIG=$ATLAS_LOCAL_ROOT_BASE/user/krb5.conf

# Python Configuration
# scl enable rh-python38 bash --norc
PYTHON_VERSION=$(python -V 2>&1) #Need to redirect, python -V goes to stderr(?)

# basically if there is a two that shows up in the python version
if [[ "$PYTHON_VERSION" == "Python 2."* ]]; then
	echo ""
	echo "Python version auto configured to"
	python -V
	echo ""
	echo "to configure python version manually type scl enable rh-python* bash"
	echo "current reccomendation at 2022-09-07 is rh-python38"
	echo ""

else
	echo ""
	echo "Python version configured to"
	python -V
	echo ""
fi

echo "Hostname: $HOSTNAME"
echo "For remote port forwarding in a new terminal type"
echo "ssh -R 52698:127.0.0.1:52698 rbate@($HOSTNAME).cern.ch -N -f"
echo ""

# Setting up root automatically 
# export ALRB_rootVersion=6.26.04-x86_64-centos7-gcc11-opt

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/afs/cern.ch/user/r/rbate/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/afs/cern.ch/user/r/rbate/miniconda3/etc/profile.d/conda.sh" ]; then
#        . "/afs/cern.ch/user/r/rbate/miniconda3/etc/profile.d/conda.sh"
#    else
#        export PATH="/afs/cern.ch/user/r/rbate/miniconda3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
# <<< conda initialize <<<

