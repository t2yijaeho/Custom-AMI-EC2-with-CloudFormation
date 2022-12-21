# Custom AMI Amazon EC2 with AWS CloudFormation

## 1. Launch AWS CloudShell

* Refer to [AWS CloudShell](https://github.com/t2yijaeho/AWS-CloudShell)


## 2. Create an Amazon EC2

### 1. Get an AWS CloudFormation stack template body

```bash
wget https://github.com/t2yijaeho/Custom-AMI-EC2-with-CloudFormation/raw/matia/Template/EC2-MigVM.yaml
```

### 2. Get your local machine public IP address in the browser

* [Your public IP address](http://checkip.amazonaws.com/)

### 3. Create an AWS CloudFormation stack

* ***Change `<My Custom Image ID>` to your Custom Amazon Machine Image ID***

* ***Change `<My IP>` to your local machine IP address (ParameterValue must be in CIDR block)***

```bash
aws cloudformation create-stack \
    --stack-name MigrationVM \
    --template-body file://./EC2-MigVM.yaml \
    --parameters ParameterKey=CustomImageID,ParameterValue="<My Custom Image ID>" \
    ParameterKey=LocalLocation,ParameterValue="<My IP>/32"
```

### 4. AWS CloudFormation returns following output

```json
{
"StackId": "arn:aws:cloudformation:us-abcd-x:123456789012:stack/MigrationVM/b4d0f5e0-d4c2-11ec-9529-06edcc65f112"
}
```

### 5. Monitor the progress by the stack's events in AWS management console

<img src="https://github.com/t2yijaeho/Custom-AMI-EC2-with-CloudFormation/blob/matia/images/CloudFormation%20Stack%20Creation%20Events.png?raw=true">
