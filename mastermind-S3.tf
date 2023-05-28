resource "aws_s3_bucket" "Mastermind" {
  bucket = "mastermind-Henrietta-bucket"

  tags = {
    Name        = "mastermind-Henrietta-bucket"
    Environment = "Dev"
  }
}