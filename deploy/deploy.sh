# run me from the deploy folder
aws cloudformation validate-template --template-body file://../cf/ecr.yaml
aws cloudformation validate-template --template-body file://../cf/ecs.yaml
aws cloudformation validate-template --template-body file://../cf/nginx-service.yaml
aws cloudformation validate-template --template-body file://../cf/squid-service.yaml

aws cloudformation deploy \
    --stack-name master-ecr-techdebt \
    --tags $(cat tags.properties) \
    --template-file ../cf/ecr.yaml \

aws cloudformation deploy \
    --stack-name master-ecs-techdebt \
    --tags $(cat tags.properties) \
    --parameter-overrides $(cat ecs.params.dev.properties) \
    --template-file ../cf/ecs.yaml \
    --capabilities CAPABILITY_NAMED_IAM

aws cloudformation deploy \
    --stack-name master-ecs-service-nginx \
    --tags $(cat tags.properties) \
    --parameter-overrides $(cat ecs.service.nginx.dev.properties) \
    --template-file ../cf/nginx-service.yaml \
    --capabilities CAPABILITY_NAMED_IAM

aws cloudformation deploy \
    --stack-name master-ecs-service-squid \
    --tags $(cat tags.properties) \
    --parameter-overrides $(cat ecs.service.squid.dev.properties) \
    --template-file ../cf/squid-service.yaml \
    --capabilities CAPABILITY_NAMED_IAM
