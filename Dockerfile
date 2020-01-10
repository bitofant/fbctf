FROM ubuntu:xenial

ENV HOME /root

ARG DOMAIN
ARG EMAIL
ARG MODE=dev
ARG TYPE=self
ARG KEY
ARG CRT

ENV HHVM_DISABLE_NUMA true

WORKDIR $HOME
COPY . $HOME

RUN apt-get update && apt-get -y install sudo apt-utils
RUN ./extra/provision.sh -m $MODE -c $TYPE -k $KEY -C $CRT -D $DOMAIN -e $EMAIL -s `pwd` --docker

HEALTHCHECK --interval=20s --timeout=3s --start-period=20s CMD curl -f http://localhost/ || exit 1

CMD ["./extra/service_startup.sh"]