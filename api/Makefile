build: 
	GOOS=linux go build -o main main.go
zip:
	zip main.zip main
update-aws:
	aws lambda update-function-code --function-name users_list --zip-file fileb://./main.zip
check-aws:
	aws lambda invoke --function-name users_list response.json --region us-east-2
test:
	curl -XPOST "http://localhost:9000/2015-03-31/functions/function/invocations"