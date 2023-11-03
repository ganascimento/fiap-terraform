resource "aws_iam_role" "lambda_exec_role" {
  name = "LambdaExecutionRole"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "labda_AmazonCognitoPowerUser" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonCognitoPowerUser"
  role       = aws_iam_role.lambda_exec_role.name
}
