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
            return "Elastic MapReduce"
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
        default:
            return "Fix me - \(service)"
        }
    }
}