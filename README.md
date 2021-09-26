### Pipeline worflow for DevOps World workshop

* You can create a Jenkins Docker image for this workshop by using the Dockerfile stored in this repository.
```bash
cd infra
docker build -t workshop-jenkins:1.0 .
```
* Launch newly created Docker image.
```bash
docker run -d --name jenkins -p 8080:8080 -p 50000:50000 workshop-jenkins:1.0
```
* To login to your Jenkins instance, ppen a browser of your choice and type  **http://<YOUR_IP_ADDRESS>:8080**
  
* Follow the prompts to complete the post-installazation wizard steps.
