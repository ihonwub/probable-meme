# VPC Kratix Promise

A Kratix Promise for managing AWS VPC resources using Terraform. This Promise wraps the terraform-aws-modules/terraform-aws-vpc module to provide VPC provisioning through Kubernetes.

> **Note**: This is a personal example project created to learn and experiment with Kratix. It demonstrates how to build and configure Promises for infrastructure provisioning.

## Repository Contents

- `promise-vpc-hcp/promise.yaml` - The main Promise definition
- `promise-vpc-hcp/example-resource.yaml` - Example VPC resource
- `promise-vpc-hcp/internal/configure-pipeline/` - Pipeline scripts for resource lifecycle
- `promise-vpc-hcp/test/` - Testing framework and examples
- `bucketstatestore.yaml` - S3 state store configuration
- `gitstatestore.yaml` - Git state store configuration

## Quick Start

### 1. Install the Promise

```bash
kubectl apply -f promise-vpc-hcp/promise.yaml
```

### 2. Set Up State Store

Choose between S3 or Git for storing Terraform state:

**Option A: S3 State Store**
```bash
# Create secret for AWS credentials
kubectl create secret generic kratix-creds \
  --from-literal=accessKeyID=YOUR_ACCESS_KEY \
  --from-literal=secretAccessKey=YOUR_SECRET_KEY \
  -n practice

# Apply S3 state store and destination
kubectl apply -f bucketstatestore.yaml
```

**Option B: Git State Store**
```bash
# Create secret for Git credentials
kubectl create secret generic git-creds \
  --from-literal=username=YOUR_USERNAME \
  --from-literal=password=YOUR_TOKEN \
  -n practice

# Apply Git state store and destination
kubectl apply -f gitstatestore.yaml
```

### 3. Create a VPC Resource

```bash
kubectl apply -f promise-vpc-hcp/example-resource.yaml
```

## State Stores and Destinations

**State Store**: Where Terraform state files are stored (S3 bucket or Git repo)
**Destination**: Defines where resources are deployed and which state store to use

The Destination links your VPC resources to a specific state store:
- S3 Destination stores state in `s3://kratixstatestore41222/destinations/terraform-cloud/`
- Git Destination stores state in the `probable-meme` repo under `destinations/terraform-cloud/`

## Testing and Local Development

### Run Pipeline Tests
```bash
# Build the pipeline image
promise-vpc-hcp/internal/scripts/pipeline-image build

# Run the test pipeline
promise-vpc-hcp/test/scripts/test-pipeline
```

This creates test output in `promise-vpc-hcp/test/output/` showing what Terraform files would be generated.

### Test with Different Inputs
1. Edit `promise-vpc-hcp/test/input/object.yaml`
2. Run `promise-vpc-hcp/test/scripts/test-pipeline`
3. Check generated files in `promise-vpc-hcp/test/output/`

## Troubleshooting

### Check Promise Status
```bash
kubectl get promises
kubectl describe promise vpc
```

### Check Resource Status
```bash
kubectl get vpcs
kubectl describe vpc YOUR_VPC_NAME
```

### Check Controller Logs
```bash
# Kratix platform controller logs
kubectl logs -n kratix-platform-system deployment/kratix-platform-controller-manager

# Worker cluster logs (if using worker clusters)
kubectl logs -n kratix-worker-system deployment/kratix-work-creator-controller-manager
```

### Check Pipeline Execution
```bash
# List pipeline jobs
kubectl get jobs -n kratix-platform-system

# Check specific job logs
kubectl logs job/JOB_NAME -n kratix-platform-system
```

### Check Destination Status
```bash
kubectl get destinations -n kratix-platform-system
kubectl describe destination DESTINATION_NAME -n kratix-platform-system
```

### Common Issues
- **Pipeline fails**: Check image exists with `docker images | grep vpc-pipeline-image`
- **State store connection**: Verify secrets exist in the correct namespace
- **Resource stuck**: Check if destination labels match the resource requirements
- **Terraform errors**: Review pipeline job logs for detailed error messages

## Resource Configuration

The VPC resource supports these key fields:
- `cidr`: VPC CIDR block (required)
- `enable_nat_gateway`: Enable NAT Gateway (required)
- `create_igw`: Create Internet Gateway (optional)
- `tags`: Resource tags (optional)

See `promise-vpc-hcp/example-resource.yaml` for a complete example.