#
# Dockerfile for all the tools
#

FROM ubuntu:19.10

# Need this to add repositories
RUN apt-get update && apt-get install -y software-properties-common gnupg ca-certificates

# Extra for mono
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" | tee /etc/apt/sources.list.d/mono-official-stable.list

# Install all the dependencies
RUN apt-get update && apt-get install -y \
    fsharp \
    g++ \
    git \
    libgmp-dev \
    make \
    mono-devel \
    python python-pip \
    time \
    wget

# Dotnet 
RUN wget -q https://packages.microsoft.com/config/ubuntu/19.10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN apt-get update
RUN apt-get install -y apt-transport-https
RUN apt-get update
RUN apt-get install -y dotnet-sdk-3.1

WORKDIR /mcBV

# Install z3[B
RUN git clone https://github.com/Z3Prover/z3.git z3-src && \
    cd z3-src && \ 
    python scripts/mk_make.py --dotnet && \
    cd build && make -j30 && make install

# Add mcBV directory
ADD . /mcBV/

# Link the compiled z3
RUN ln -s /usr/lib/libz3.so /mcBV/z3-mono/libz3.so
RUN ln -s /mcBV/z3-src/build/Microsoft.Z3.dll /mcBV/z3-mono/Microsoft.Z3.dll

# Build
RUN xbuild /p:Configuration=Release mcBV.docker.fsproj

# Settings
ENV PYTHONIOENCODING UTF-8

