terraform{
    required_providers {
        aws={
            source="hashicorp/aws"
            version="~>6.0"
        }
    }
    backend "s3"{
        bucket="roboshop-terra-state"
        key="remote-tfstate"
        region="us-east-1"
        encrypt=true
        use_lockfile=true

    }
}
provider "aws"{
    region="us-east-1"
}