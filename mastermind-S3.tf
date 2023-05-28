resource "aws_s3_bucket" "Mastermind" {
  bucket = "mastermind-Henrietta-bucket"

  tags = {
    Name        = "mastermind bucket"
    Environment = "Prod"
  }
}