FROM "alpine"

# Install tools
RUN apk update && apk add --no-cache bash yq kubectl curl git unzip dos2unix aws-cli jq

# Install Terraform
RUN curl -sSLo terraform.zip https://releases.hashicorp.com/terraform/1.7.1/terraform_1.7.1_linux_amd64.zip && \
    unzip terraform.zip && mv terraform /usr/local/bin/ && rm terraform.zip

# Create scripts directory
RUN mkdir -p /scripts

# Copy and fix script line endings
COPY configure /scripts/configure
COPY update-status /scripts/update-status
RUN dos2unix /scripts/* && chmod +x /scripts/*

# Set PATH and entrypoint
ENV PATH="/scripts:${PATH}"
CMD ["configure"]
ENTRYPOINT ["/bin/sh", "-c"]
