FROM fedora:23

RUN dnf -y install npm && dnf clean all

# When starting the container, map your project repo to this directory
RUN mkdir /src;

# When stating the container, map this (cpsc310-testing) repo to this directory
RUN mkdir /test;

# Make sure we are using a known version of npm
RUN npm install -g npm@1.4.12


# run npm install on the src directory to include any packages needed by the student's code. Will only run if package.json has new dependencies.
# run npm install on the test directory to include any packages needed by the testing code. Will only run if package.json has new dependencies.
# run the tests
# put the results on stdout
CMD cd /src && npm install > npm-install.log 2>&1 && \
    cd /test && npm install > npm-install.log 2>&1 && \
    node jasmine-runner.js > output.txt && \
    echo "**** Test Results ****" && \
    car results.json
