FROM python:slim
RUN apt update && apt install -y \
  vsftpd \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/vsftpd/empty

COPY vsftpd.conf /etc/vsftpd.conf

USER root
RUN echo 'root:password' | chpasswd

COPY --chown=root:root ftp.py /app/ftp.py
RUN chmod +x /app/ftp.py

WORKDIR /app

ENTRYPOINT ["sh","-c","/usr/sbin/vsftpd /etc/vsftpd.conf"]