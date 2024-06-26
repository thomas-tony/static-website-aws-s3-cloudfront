#!/bin/bash

# Variables
BUCKET_NAME="your-bucket-name"
CF_DISTRIBUTION_ID="your-cloudfront-distribution-id"

# Sync files to S3
aws s3 sync . s3://$BUCKET_NAME --exclude ".git/*" --exclude "deploy.sh"

# Invalidate CloudFront cache
aws cloudfront create-invalidation --distribution-id $CF_DISTRIBUTION_ID --paths "/*"

echo "Deployment complete."