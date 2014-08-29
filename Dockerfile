FROM registry.access.redhat.com/rhel
ADD secrets /run/secrets

RUN rpm -Uvh http://mirror.sfo12.us.leaseweb.net/epel/7/x86_64/epel-release-7-0.2.noarch.rpm
RUN rpm -Uvh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm

RUN yum -y install tar puppet; yum clean all
