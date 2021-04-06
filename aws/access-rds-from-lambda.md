# Access RDS from Lambda

You will need to add your Lambda function to your VPC by clicking on the
function in the *Lambda* console, clicking on *Configuration*, and then clicking
on *VPC*.

Next, go to the *EC2* console, and click on *Security Groups* in the
*Network & Security* menu in the left-hand side-bar. Create a group for your
lambda function and name it something descriptive. Then configure the outbound
rule for the Lambda function security group to have the RDS security group as
its destination.

Next, configure the inbound rule for the RDS security group to have the Lambda
function security group as its destination.

[Official Documentation](https://aws.amazon.com/premiumsupport/knowledge-center/connect-lambda-to-an-rds-instance/)
