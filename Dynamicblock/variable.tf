variable "traffic"{
    default=[
        {
            port=22
            cidr_blocks=["0.0.0.0/0"]
            description="allow every one"
        },
        {
            port=443
            cidr_blocks=["0.0.0.0/0"]
            description="allow-all"
        },
        {
            port=3306
            cidr_blocks=["0.0.0.0/0"]
            description="allow"
        }
    ]
}