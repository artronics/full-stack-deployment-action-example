include .env

aws_cred := -e AWS_ACCESS_KEY_ID=$(AWS_ACCESS_KEY_ID) -e AWS_SECRET_ACCESS_KEY=$(AWS_SECRET_ACCESS_KEY)
tf := docker run --rm -it $(aws_cred) -v $(shell pwd):/app

#command <path=""> <workspace=default> <options=""> <dryrun=false> <destroy=false>
terraform-deploy:
	  $(tf) terraform-flow /app/terraform jaho "" false false
terraform-destroy:
	docker run --rm -it -v $(pwd):/app -w /app artronics/terraform-flow:latest terraform jaho "" false true
