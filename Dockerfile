FROM alpine

RUN apk update && apk upgrade
RUN apk --no-cache add busybox-suid
RUN apk --no-cache add zsh vim nano curl man sudo openssh-server
RUN apk --no-cache add python3

RUN echo 'root:this_was_a_triumph, huge_success' | chpasswd

RUN mkdir /var/run/sshd
#RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
# RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

COPY etc /etc
COPY var /var
COPY setup.sh /usr/local/
COPY SSI_test.sh /usr/local/

EXPOSE 22

ENTRYPOINT ["zsh", "/usr/local/setup.sh"]
