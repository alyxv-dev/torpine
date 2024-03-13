FROM alpine:latest

ARG TOR_NICKNAME
ARG TOR_ORPORT
ARG TOR_ADDRESS
ARG TOR_BANDWITH
ARG TOR_BANDWITH_BURST
ARG TOR_CONTACT

# download tor package and gettext (for envsubst command)
RUN apk add tor gettext envsubst

# add group tor to set /lib/tor for user tor's full ownership
RUN addgroup tor

# create the /lib/tor home directory
RUN mkdir -p /lib/tor

# give user tor full ownership over /lib/tor
RUN chown -R tor:tor /lib/tor
RUN chmod -R 700 /lib/tor

# copy the torrc as a template file into tor setting dir
COPY ./config/torrc /etc/tor/torrc.tpl

ENV SERVICE_TOR_NICKNAME=$TOR_NICKNAME
ENV SERVICE_TOR_ORPORT=$TOR_ORPORT
ENV SERVICE_TOR_ADDRESS=$TOR_ADDRESS
ENV SERVICE_TOR_RELAY_BANDWIDTH_RATE=$TOR_BANDWITH
ENV SERVICE_TOR_RELAY_BANDWIDTH_BURST=$TOR_BANDWITH_BURST
ENV SERVICE_TOR_CONTACT_INFO=$TOR_CONTACT

# copy entrypoint to local binary dir
RUN envsubst < /etc/tor/torrc.tpl > /etc/tor/torrc

# start tor service
CMD ["tor"]