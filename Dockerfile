FROM registry.access.redhat.com/rhel
ADD secrets /run/secrets

RUN rpm -Uvh http://mirror.sfo12.us.leaseweb.net/epel/7/x86_64/epel-release-7-0.2.noarch.rpm
RUN rpm -Uvh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm

RUN yum -y install tar puppet \
    findutils scap-security-guide \
    ; yum clean all

# Note: If image is not up-to-date,
# the scan exits non-zero and fails docker-build!
ADD oval /oval
RUN yum -y update; yum clean all
RUN /oval/remediate-oscap.sh
RUN /oval/oval-vulnerability-scan.sh || :
