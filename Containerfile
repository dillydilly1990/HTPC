FROM ghcr.io/ublue-os/bazzite-deck:stable

# `yq` be used to pass BlueBuild modules configuration written in yaml
COPY --from=docker.io/mikefarah/yq /usr/bin/yq /usr/bin/yq

RUN \
  # add in the module source code
  --mount=type=bind,from=ghcr.io/blue-build/modules:latest,src=/modules,dst=/tmp/modules,rw \
  # add in the script that sets up the module run environment
  --mount=type=bind,from=ghcr.io/blue-build/cli/build-scripts:latest,src=/scripts/,dst=/tmp/scripts/ \
# run the module
config=$'\
type:  \n\
install: \n\
    - / \n\
    - / \n\
' && \
/tmp/scripts/run_module.sh "$(echo "$config" | yq eval '.type')" "$(echo "$config" | yq eval -o=j -I=0)"

### MODIFICATIONS
## make modifications desired in your image and install packages by modifying the build.sh script
## the following RUN directive does all the things required to run "build.sh" as recommended.
COPY build.sh /tmp/build.sh

RUN mkdir -p /var/lib/alternatives && \
    /tmp/build.sh && \
    ostree container commit
    
