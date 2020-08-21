FROM ubuntu:latest

RUN apt-get update

RUN apt-get install curl wget gcc -yq

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.18.0/bin/linux/amd64/kubectl

RUN chmod +x ./kubectl

RUN cp kubectl /usr/bin

RUN curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash

RUN wget "https://golang.org/dl/go1.15.linux-amd64.tar.gz"

RUN tar -C /usr/local -xzf go1.15.linux-amd64.tar.gz

ENV PATH=$PATH:/usr/local/go/bin

CMD [ "/bin/bash" ]