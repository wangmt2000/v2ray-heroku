
#FROM alpine:latest
FROM heroku/heroku:18

#ENV CONFIG_JSON1={\"log\":{\"access\":\"\",\"error\":\"\",\"loglevel\":\"warning\"},\"inbound\":{\"protocol\":\"vmess\",\"port\": 
#ENV CONFIG_JSON2=,\"settings\":{\"clients\":[{\"id\":\" 
#ENV CONFIG_JSON3=\",\"alterId\":64}]},\"streamSettings\":{\"network\":\"ws\"}},\"inboundDetour\":[],\"outbound\":{\"protocol\":\"freedom\",\"settings\":{}}} 

RUN mkdir -m 777 /v2raybin 
RUN cd /v2raybin
RUN curl -L -H "Cache-Control: no-cache" -o v2ray.zip https://github.com/v2ray/v2ray-core/releases/download/v$VER/v2ray-linux-64.zip 
RUN unzip v2ray-linux-64.zip 
RUN chmod +x /v2raybin/v2ray 
#rm -rf v2ray.zip 
RUN chgrp -R 0 /v2raybin 
RUN chmod -R g+rwX /v2raybin
ADD entrypoint.sh /entrypoint.sh
ADD server_config.json /v2raybin/config.json
RUN chmod +x /entrypoint.sh 

CMD /entrypoint.sh
