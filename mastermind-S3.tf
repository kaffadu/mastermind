resource "aws_s3_bucket" "Mastermind" {
  bucket = "mastermind-test-bucket"

  tags = {
    Name        = "mastermind bucket"
    Environment = "Dev"
  }
}