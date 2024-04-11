provider "aws" {
    region = "us-east-2"
    access_key = ""
    secret_key = ""
}
resource "aws_iam_user" "admin-user" {
  name = "lucydevops"
  tags = {
    Description = "technical lead"
  }
  lifecycle {
    create_before_destroy = true
  }
}
resource "aws_iam_policy" "adminUser" {
  name   = "AdminUsers"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ec2:Describe*"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_user_policy_attachment" "lucydevops_admin_access" {
  user       = aws_iam_user.admin-user.name
  policy_arn = aws_iam_policy.adminUser.arn
}
