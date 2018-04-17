FROM szewec/centos:7.3

RUN INSTALL_PKGS="rh-ruby23 rh-ruby23-ruby-devel rh-ruby23-rubygem-rake rh-ruby23-rubygem-bundler" && \
    yum update -y && \
    yum install -y centos-release-scl && \
    yum install -y --setopt=tsflags=nodocs  $INSTALL_PKGS && rpm -V $INSTALL_PKGS && \
    scl enable rh-ruby23 bash && \
    yum clean all -y

ENV PATH=/opt/rh/rh-ruby23/root/usr/local/bin:/opt/rh/rh-ruby23/root/usr/bin${PATH:+:${PATH}}
ENV LD_LIBRARY_PATH=/opt/rh/rh-ruby23/root/usr/local/lib64:/opt/rh/rh-ruby23/root/usr/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
ENV MANPATH=/opt/rh/rh-ruby23/root/usr/local/share/man:/opt/rh/rh-ruby23/root/usr/share/man:$MANPATH
ENV PKG_CONFIG_PATH=/opt/rh/rh-ruby23/root/usr/local/lib64/pkgconfig:/opt/rh/rh-ruby23/root/usr/lib64/pkgconfig${PKG_CONFIG_PATH:+:${PKG_CONFIG_PATH}}
ENV XDG_DATA_DIRS=/opt/rh/rh-ruby23/root/usr/local/share:/opt/rh/rh-ruby23/root/usr/share:${XDG_DATA_DIRS:-/usr/local/share:/usr/share}
