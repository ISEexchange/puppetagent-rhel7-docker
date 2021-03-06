FROM registry.access.redhat.com/rhel
ADD secrets /run/secrets

RUN rpm -Uvh http://mirror.pnl.gov/epel/7/x86_64/epel-release-7-1.noarch.rpm
RUN rpm -Uvh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm

RUN yum -y install tar puppet \
    findutils scap-security-guide \
    ; yum clean all

ADD oval /oval
RUN yum -y update; yum clean all
RUN /oval/remediate-oscap.sh
