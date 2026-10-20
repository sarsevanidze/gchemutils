FROM debian:trixie
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential autoconf automake libtool gettext pkg-config intltool \
    libgtk-3-dev libxml2-dev libgsf-1-dev libgoffice-0.10-dev \
    libopenbabel-dev libcairo2-dev libgdk-pixbuf-2.0-dev libglu1-mesa-dev \
    libx11-dev libgl-dev libcurl4-openssl-dev \
    shared-mime-info chemical-mime-data bodr libreadline-dev \
    yelp-tools itstool docbook-xml docbook-xsl xsltproc ca-certificates git \
 && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y --no-install-recommends curl xz-utils libpango1.0-dev bison flex \
 && rm -rf /var/lib/apt/lists/* \
 && cd /tmp && curl -sLO https://download.gnome.org/sources/lasem/0.5/lasem-0.5.1.tar.xz \
 && tar xf lasem-0.5.1.tar.xz && cd lasem-0.5.1 && ./configure --prefix=/usr 2>&1 | tail -5 && make -j8 2>&1 | tail -5 && make install | tail -2
RUN apt-get update && apt-get install -y --no-install-recommends xvfb xauth locales fonts-dejavu imagemagick x11-apps dbus-x11 \
 && rm -rf /var/lib/apt/lists/* && sed -i 's/# ka_GE.UTF-8/ka_GE.UTF-8/' /etc/locale.gen && locale-gen
