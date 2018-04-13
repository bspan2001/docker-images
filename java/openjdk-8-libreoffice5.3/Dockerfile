FROM szewec/java:openjdk-8

ENV LIBREOFFICE_VERSION=5.3.7
ENV LIBREOFFICE_VERSION_MINOR=5.3
ENV DOWNLOAD_URL=http://download.documentfoundation.org/libreoffice/stable/${LIBREOFFICE_VERSION}/deb/x86_64/LibreOffice_${LIBREOFFICE_VERSION}_Linux_x86-64_deb.tar.gz

RUN apt-get update && \
    apt-get install -y libgtk2.0 libdbus-glib-1-2 libsm6 libglu1-mesa && \
    apt-get clean && \
    wget -q "${DOWNLOAD_URL}" -O /tmp/LibreOffice.tar.gz && \
    mkdir -p /tmp/LibreOffice && \
    tar -xzvf /tmp/LibreOffice.tar.gz -C /tmp/LibreOffice && \
    dpkg -i /tmp/LibreOffice/*/DEBS/*.deb && \
    rm -rf /tmp/LibreOffice* && \
    ln -s /opt/libreoffice${LIBREOFFICE_VERSION_MINOR}/program/soffice /usr/local/bin/soffice && \
    ln -s /opt/libreoffice${LIBREOFFICE_VERSION_MINOR}/program/soffice /usr/local/bin/libreoffice
