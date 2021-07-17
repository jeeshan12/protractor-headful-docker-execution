[![Linkedin](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/mohdjeeshan)

# Run Protractor Tests in Docker containers(Headful Chrome)


## Authors
* [Mohd Jeeshan](https://github.com/jeeshan12)

## Description
To run the tests on headful chrome we need to attach a fake display to chrome. To do this we will be using xvfb. Refer to the [Dockerfile](https://github.com/jeeshan12/protractor-headful-docker-execution/blob/main/Dockerfile) for the same.


## Clone the project
Clone the project by running below command in terminal
```
https://github.com/jeeshan12/protractor-headful-docker-execution.git
```

## Run Specs
### Build the image
Open the terminal in the root project and run the below task
```
docker build -t dragon12/protractorheadful .
```
### Run E2E in docker container
* Run below command to run e2e on docker containers for headful chrome
```
docker run --rm dragon12/protractorheadful
```
