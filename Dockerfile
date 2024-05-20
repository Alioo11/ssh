# Use the latest Ubuntu image as the base
FROM ubuntu:latest

# Update packages and install OpenSSH server
RUN apt-get update && \
    apt-get install -y openssh-server && \
    # Optionally, generate new SSH key pair (replace "myuser" with your desired username)
    adduser --disabled-password --gecos '' myuser && \
    mkdir /var/run/sshd && \
    echo 'root:YOUR_PASSWORD_HERE' | chpasswd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Expose port 22 for SSH access
EXPOSE 22

# Run SSH server
CMD ["/usr/sbin/sshd", "-D"]

