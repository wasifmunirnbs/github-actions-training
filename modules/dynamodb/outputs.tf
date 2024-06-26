output "table_name" {
  value = aws_dynamodb_table.basic-dynamodb-table.name
}

output "table_arn" {
  value = aws_dynamodb_table.basic-dynamodb-table.arn
}