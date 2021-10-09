
data "aws_caller_identity" "current" {}
output "account_id" {
  value = data.aws_caller_identity.current.account_id
}



resource "aws_iam_role" "stack_end_users_access" {
  name               = "role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRoleWithSAML"
        Effect = "Allow"
        Principal = {
          Federated = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:saml-provider/${var.IDPProviderName}"
        }
        Condition = {
           StringEquals = {
             "SAML:aud" = "https://signin.aws.amazon.com/saml"
           }
        }
      },
   ]
})
  tags = {
    TagName = "stack_end_users_role"
  }
}

resource "aws_iam_role_policy" "appstream_policy" {
  name   = "policy"
  role   = aws_iam_role.stack_end_users_access.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "appstream:Stream"
        Effect = "Allow"
        Resource = [
         "arn:aws:appstream:${var.region}:${data.aws_caller_identity.current.account_id}:stack/${var.StackName}"
        ]
        Condition = {
          StringEquals = {
            "appstream:userId" = "{saml:sub}"
        }
      }
      }
    ]
  })
}

