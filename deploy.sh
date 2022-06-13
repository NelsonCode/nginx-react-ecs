dotenv () {
  set -a
  [ -f .env ] && . .env
  set +a
}

dotenv

# UPLOAD IMAGES TO DOCKER HUB

docker login -u $DOCKER_USER -p $DOCKER_PASSWORD

docker build ./frontend -t $DOCKER_USER/react-app:latest

docker build ./nginx -t $DOCKER_USER/mynginx:latest

docker push $DOCKER_USER/react-app:latest

docker push $DOCKER_USER/mynginx:latest


# REGISTER TASK DEFINITION

aws ecs register-task-definition --cli-input-json file://task-definition.json