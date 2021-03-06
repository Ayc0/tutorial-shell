FROM alpine

RUN apk update && apk upgrade
RUN apk --no-cache add busybox-suid
RUN apk --no-cache add zsh nano curl man openssh-server
RUN apk --no-cache add python3

RUN echo 'root:this_was_a_triumph, huge_success' | chpasswd

RUN mkdir /var/run/sshd
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

COPY etc /etc
COPY var /var
COPY setup.sh /usr/local/
COPY run.sh /usr/local/

EXPOSE 22

ENTRYPOINT ["zsh", "/usr/local/run.sh"]
