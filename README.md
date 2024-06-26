# Deploy a Static Website on AWS S3 and CloudFront

This project demonstrates how to deploy a static website on AWS S3 and CloudFront.

## Prerequisites

- AWS account
- AWS CLI configured
- S3 bucket
- CloudFront distribution

## Step 1: Create an S3 Bucket

### 1.1 Log in to AWS Management Console

- Go to the AWS Management Console and log in with your credentials.

### 1.2 Create an S3 Bucket

- Navigate to the S3 service.
- Click on “Create bucket.”
- Enter a unique bucket name (e.g., `my-static-website`).
- Choose a region that is geographically close to your users for lower latency.
- Click “Create bucket” to finalize.

### 1.3 Configure the Bucket for Static Website Hosting

- Select your newly created bucket.
- Go to the “Properties” tab.
- Scroll down to the “Static website hosting” section and click “Edit.”
- Select “Enable” and specify the index document (e.g., `index.html`). Optionally, you can also specify an error document (e.g., `error.html`).
- Click “Save changes.”

### 1.4 Upload Your Website Files

- Go to the “Objects” tab.
- Click “Upload” and add your website files (e.g., HTML, CSS, JS, images).
- Click “Upload” to confirm.

## Step 2: Set Bucket Permissions

### 2.1 Make Your Bucket Public

- Select your bucket and go to the “Permissions” tab.
- Scroll down to “Bucket policy” and click “Edit.”
- Add the following bucket policy to allow public read access:

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicReadGetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::my-static-website/*"
    }
  ]
}

- Replace my-static-website with your bucket name.
- Click “Save changes.”

### 2.2 Enable Cross-Origin Resource Sharing (CORS)

- If your website needs to make requests to other domains or services, configure CORS:
- Go to the “Permissions” tab
- Scroll down to “CORS configuration” and click “Edit.”
- Add your CORS rules:

```xml
<CORSConfiguration>
  <CORSRule>
    <AllowedOrigin>*</AllowedOrigin>
    <AllowedMethod>GET</AllowedMethod>
  </CORSRule>
</CORSConfiguration>

- Click “Save changes.”

## Step 3: Set Up CloudFront Distribution

### 3.1 Create a CloudFront Distribution

- Go to the CloudFront service in the AWS Management Console.
- Click “Create Distribution.”
- Select “Get Started” under the Web section.

### 3.2 Configure Distribution Settings

- Origin Domain Name: Select your S3 bucket from the dropdown list.
- Origin Path: Leave this blank.
- Viewer Protocol Policy: Choose “Redirect HTTP to HTTPS” for better security.
- Allowed HTTP Methods: Select “GET, HEAD” (and other methods if needed).
- Default Cache Behavior: Customize caching settings as per your requirements.
- Distribution Settings: Configure other settings such as logging, error pages, etc.

### 3.3 Create Distribution

- Click “Create Distribution.”
- Note the CloudFront Distribution Domain Name (e.g., d123456abcdef8.cloudfront.net).

## Step 4: Update DNS Settings

### 4.1 Configure DNS for Your Domain

- If you have a custom domain, update your DNS settings to point to the CloudFront distribution.
- In your DNS provider’s management console, create a CNAME record that points your domain to the CloudFront Distribution Domain Name.

### 4.2 Test Your Setup

- Access your website via the CloudFront Distribution Domain Name or your custom domain.
- Verify that the website loads correctly and all resources are accessible.

## Additional Resources

For a detailed step-by-step guide, please refer to [my blog post](https://tonythomas.in/https://tonythomas.in/how-to-deploy-a-static-website-on-aws-s3-and-cloudfront/).

## Automate Deployment

Use the provided 'deploy.sh' script if you want to automate the deployment process.


