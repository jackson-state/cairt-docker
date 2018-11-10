FROM jsums/msf_openvas_conda_pycharm
MAINTAINER Ashley Abraham "ashley.abraham@jsums.edu"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update \ 
    && apt-get -qq -y install \
        sudo \
        nano \
        python3-pyqt5\
        python-pyqt5\
        pyqt5-dev-tools\
        qttools5-dev-tools \
        bzip2 \
        git 
        
RUN conda install -y \
        git \
        pyqt=5 \
        spyder 
        
RUN pip install --upgrade pip \
    && pip install \
        pyvas \    
        python-nmap \
        git+https://github.com/26huitailang/pymetasploit-py3.git \
        pydevd  \
        pyqt5
        
# Attach this container to stdin when running, like this:
# docker run --net=host -t -i jsums/cairt
#--net=host allows listening to incoming connections on the host ip

ADD ./init.sh /init.sh
RUN chmod +x /init.sh
ENTRYPOINT ./init.sh
