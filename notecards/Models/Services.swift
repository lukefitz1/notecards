//
//  Services.swift
//  notecards
//
//  Created by Luke Fitzgerald on 9/20/20.
//  Copyright © 2020 Luke Fitzgerald. All rights reserved.
//

import Foundation

struct Services {
    func getName(service: String) -> String {
        switch(service) {
        case "beanstalk":
            return "Elastic Beanstalk"
        case "route53":
            return "Route 53"
        case "storage_gateway":
            return "Storage Gateway"
        case "global_accelerator":
            return "Global Accelerator"
        case "swf":
            return "Simple Workflow Service"
        case "fsx":
            return "Amazon FSx"
        case "rds":
            return "RDS"
        case "cloudfront":
            return "CloudFront"
        case "ec2":
            return "EC2"
        case "step_functions":
            return "Step Functions"
        case "sqs":
            return "SQS"
        case "elb":
            return "Elastic Load Balancer"
        case "cloudformation":
            return "CloudFormation"
        case "ecs":
            return "Elastic Container Service (ECS)"
        case "cicd":
            return "CI/CD"
        case "elasticache":
            return "ElastiCache"
        case "s3":
            return "S3"
        case "glacier":
            return "Glacier"
        case "snowball":
            return "Snowball"
        case "kinesis":
            return "Kinesis"
        case "ebs":
            return "EBS"
        case "cloudwatch":
            return "CloudWatch"
        case "asg":
            return "Auto Scaling Groups (ASG)"
        case "sns":
            return "SNS"
        case "instance_storage":
            return "Instance Store"
        case "efs":
            return "Elastic File System (EFS)"
        case "snowmobile":
            return "Snowmobile"
        case "waf":
            return "Web Application Firewall (WAF)"
        case "shield":
            return "AWS Shield"
        case "opsworks":
            return "OpsWorks"
        case "config":
            return "AWS Config"
        case "cloudtrail":
            return "CloudTrail"
        case "organizations":
            return "AWS Organizations"
        case "vpc":
            return "VPC"
        case "lambda":
            return "Lambda"
        case "parameter_store":
            return "SSM Parameter Store"
        case "secrets_manager":
            return "AWS Secrets Manager"
        case "mq":
            return "ActiveMQ"
        case "transcoder":
            return "Elastic Transcoder"
        case "dynamodb":
            return "DynamoDB"
        case "event_bridge":
            return "Event Bridge"
        case "api_gateway":
            return "API Gateway"
        case "workspaces":
            return "AWS Workspaces"
        case "ecr":
            return "Elastic Container Registry"
        case "elasticsearch":
            return "ElasticSearch"
        case "redshift":
            return "Redshift"
        case "appsync":
            return "AppSync"
        case "documentdb":
            return "DocumentDB"
        case "emr":
            return "Elastic MapReduce (EMR)"
        case "cloudhsm":
            return "CloudHSM"
        case "eks":
            return "Elastic Kubernets Service (EKS)"
        case "athena":
            return "Athena"
        case "dms":
            return "Database Migration Service (DMS)"
        case "iam":
            return "IAM"
        case "neptune":
            return "Neptune"
        case "glue":
            return "AWS Glue"
        case "acm":
            return "Amazon Certificate Manager (ACM)"
        case "inspector":
            return "Amazon Inspector"
        case "random":
            return "Random Cards"
        case "cognito":
            return "Cognito"
        case "data_pipeline":
            return "Data Pipeline"
        case "xray":
            return "X-Ray"
        case "sts":
            return "Secure Token Service (STS)"
        case "white_papers":
            return "White Papers"
        case "sam":
            return "Serverless Application Model (SAM)"
        case "on_prem":
            return "On Premises"
        case "data_sync":
            return "Data Sync"
        case "ses":
            return "SES"
        case "disaster_recovery":
            return "Disaster Recovery"
        case "kms":
            return "KMS"
        case "quicksite":
            return "QuickSight"
        case "efa":
            return "Elastic Fabric Adapter"
        case "trusted_advisor":
            return "Trusted Advisor"
        case "sso":
            return "Single Sign On (SSO)"
        case "ram":
            return "Resource Access Manager (RAM)"
        case "artifact":
            return "Artifact"
        case "aurora":
            return "Aurora"
        case "budgets":
            return "Budgets"
        case "control_tower":
            return "Control Tower"
        case "cost_allocation_tags":
            return "Cost Allocation Tags"
        case "cost_explorer":
            return "Cost Explorer"
        case "dlm":
            return "Data Lifecycle Manager"
        case "guard_duty":
            return "Guard Duty"
        case "macie":
            return "Macie"
        case "raid":
            return "RAID"
        case "service_catalog":
            return "Service Catalog"
        case "service_health_dashboard":
            return "Service Health Dashboard"
        case "systems_manager":
            return "Systems Manager"
        default:
            return "Fix me - \(service)"
        }
    }
}
