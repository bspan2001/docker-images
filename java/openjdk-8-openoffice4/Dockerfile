FROM szewec/java:openjdk-8

ENV OPENOFFICE_VERSION=4.1.4
ENV OPENOFFICE_VERSION_MAJOR=4
ENV DOWNLOAD_URL=https://sourceforge.net/projects/openofficeorg.mirror/files/${OPENOFFICE_VERSION}/binaries/zh-CN/Apache_OpenOffice_${OPENOFFICE_VERSION}_Linux_x86-64_install-deb_zh-CN.tar.gz/download

RUN apt-get update && \
    apt-get install -y libgtk2.0 libdbus-glib-1-2 libsm6 libglu1-mesa && \
    apt-get clean && \
    wget -q "${DOWNLOAD_URL}" -O /tmp/Apache_OpenOffice.tar.gz && \
    mkdir -p /tmp/Apache_OpenOffice && \
    tar -xzvf /tmp/Apache_OpenOffice.tar.gz -C /tmp/Apache_OpenOffice && \
    dpkg -i /tmp/Apache_OpenOffice/zh-CN/DEBS/*.deb && \
    rm -rf /tmp/Apache_OpenOffice* && \
    ln -s /opt/openoffice${OPENOFFICE_VERSION_MAJOR}/program/soffice /usr/local/bin/soffice
