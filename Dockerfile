FROM conanio/clang9 as prereqs
COPY conanfile.txt /app/
RUN sudo pip install conan --upgrade && mkdir -p /home/conan/build && cd /home/conan/build && conan install /app --remote=conan-center

FROM prereqs AS builder
COPY . /app
RUN cd /home/conan/build && cmake -G "Ninja" /app -DCMAKE_BUILD_TYPE=RelWithDebInfo
WORKDIR /home/conan/build
CMD [ "cmake", "--build", ".", "-j" ]
