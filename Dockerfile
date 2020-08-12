FROM stardog/stardog:7.3.4-java11-preview

# fix perms
RUN chmod -R 666 /var/opt/stardog
