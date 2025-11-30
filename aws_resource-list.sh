#!/bin/bash

set -e
set -o pipefail

###################################################################################################################
# About: This Script is used to automate the process of listing all the AWS resources in an AWS Account
# Author: Venkatesh P R/ Devops Team
# Version: v.0.0.2
#
# Supported AWS Services by this Script
#
# Below are the services that are supported by this script:
# 1. EC2
# 2. RDS
# 3. S3
# 4. CloudFront
# 5. VPC
# 6. IAM
# 7. Route53
# 8. CloudWatch
# 9. CloudFormation
# 10. Lambda
# 11. SNS
# 12. SQS
# 13. DynamoDB
# 14. VPC
# 15. EBS
#
# Usage: ./aws_resource-list.sh <regiom> <service-name>
# Example: ./aws_resource-list.sh <ap-south-2> <ec2>
###################################################################################################################

# Validation Part
# Check if Script is executed using both command line Arguments
if [ $# -ne 2 ]; then
    echo "Usage: $0 <region> <aws-service-name>"
    echo "Example: ./aws_resource-list.sh <ap-south-2> <ec2>"
    exit 1
fi

# Installation Part
# check if AWS-CLI is Installed or not
if ! command -v aws &> /dev/null; then
    echo "AWS CLI iwas not Installed; Please Install AWS CLI"
    exit 1
fi

# Configuration Part
# Check if AWS-CLI was Configured or not
if [ ! -d ~/.aws ]; then
    echo "AWS CLI was not Configured; Please Configure AWS CLI"
    exit 1
fi

#Variable Assigning for commandline arguments
aws_service=$2
aws_region=$1

# Main Logic part
# Check based on User Input $2 will  service should be Executed
case $aws_service in
    ec2)
        echo "Listing EC2 Instances in $aws_region"
        aws ec2 describe-instances --region $aws_region
        ;;
    rds)
        echo "Listing RDS Instances in $aws_region"
        aws rds describe-db-instances --region $aws_region
        ;;
    s3)
        echo "Listing S3 Buckets in $aws_region"
        aws s3api list-buckets --region $aws_region
        ;;
    cloudfront)
        echo "Listing CloudFront Distributions in $aws_region"
        aws cloudfront list-distributions --region $aws_region
        ;;
    vpc)
        echo "Listing VPCs in $aws_region"
        aws ec2 describe-vpcs --region $aws_region
        ;;
    iam)
        echo "Listing IAM Users in $aws_region"
        aws iam list-users --region $aws_region
        ;;
    route5)
        echo "Listing Route53 Hosted Zones in $aws_region"
        aws route53 list-hosted-zones --region $aws_region
        ;;
    cloudwatch)
        echo "Listing CloudWatch Alarms in $aws_region"
        aws cloudwatch describe-alarms --region $aws_region
        ;;
    cloudformation)
        echo "Listing CloudFormation Stacks in $aws_region"
        aws cloudformation describe-stacks --region $aws_region
        ;;
    lambda)
        echo "Listing Lambda Functions in $aws_region"
        aws lambda list-functions --region $aws_region
        ;;
    sns)
        echo "Listing SNS Topics in $aws_region"
        aws sns list-topics --region $aws_region
        ;;
    sqs)
        echo "Listing SQS Queues in $aws_region"
        aws sqs list-queues --region $aws_region
        ;;
    dynamodb)
        echo "Listing DynamoDB Tables in $aws_region"
        aws dynamodb list-tables --region $aws_region
        ;;
    ebs)
        echo "Listing EBS Volumes in $aws_region"
        aws ec2 describe-volumes --region $aws_region
        ;;
    *)
        echo "Invalid service. Please enter a valid service."
        exit 1
        ;;
esac

# Last Updates: Nov'30 - 2025
#Scripts Ends
#Will Improvise it to use for more AWS Services
