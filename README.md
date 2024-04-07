                            ****************JENKINS CI-CD*******************

STEP 1:
    -> Create a EC2 Instance that have role to acccess ECR 
    
![Screenshot from 2024-04-07 16-36-24](https://github.com/kalaiprasanth/jenkins-ci-cd/assets/161060613/bf7c0f60-7402-416c-ba85-adc19b139e08)
![Screenshot from 2024-04-07 16-37-15](https://github.com/kalaiprasanth/jenkins-ci-cd/assets/161060613/76bf27d8-0936-40e0-805f-d1512db90889)

    -> In my github repository have html file & Dockerfile
![Screenshot from 2024-04-07 16-40-27](https://github.com/kalaiprasanth/jenkins-ci-cd/assets/161060613/879462ab-a7ba-4cf5-a607-20ae759c34b5)

STEP 2:
    -> EC2 instance connects into local terminal via ssh
    
![Screenshot from 2024-04-07 16-41-18](https://github.com/kalaiprasanth/jenkins-ci-cd/assets/161060613/96b015ee-58b7-4021-911c-b016d26cb53c)

    -> Then need to install jenkins
    cmd:-
    sudo apt-get install fontconfig openjdk-17-jre
    sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
    sudo apt update
    sudo apt-get install jenkins
    service jenkins start
    service jenkins status


![Screenshot from 2024-04-07 16-45-23](https://github.com/kalaiprasanth/jenkins-ci-cd/assets/161060613/8cb97394-9db0-4aa8-9154-2dde797069cd)


    -> Install docker 
    cmd:-
    sudo apt install docker.io
    service docker status
 ![Screenshot from 2024-04-07 16-47-46](https://github.com/kalaiprasanth/jenkins-ci-cd/assets/161060613/52ff36de-2904-49f0-95dc-6f71122faf64)

STEP 3:
    ->copy your public ip and paste on new tab with :8080
    

 ![Screenshot from 2024-04-07 16-48-33](https://github.com/kalaiprasanth/jenkins-ci-cd/assets/161060613/95ec5614-0432-445b-955e-c057290a332b)

    -> then install needed plugins to ci-cd

 ![Screenshot from 2024-04-07 16-49-26](https://github.com/kalaiprasanth/jenkins-ci-cd/assets/161060613/d9565f1f-4465-49db-9509-72cbc7fb1288)

    ->select freestyle project 
    
 ![Screenshot from 2024-04-07 17-09-04](https://github.com/kalaiprasanth/jenkins-ci-cd/assets/161060613/d141c209-4398-46db-8b8c-154416bca810)


    ->open sudoers file in EC2 instance
      then create a jenkins with no password access
      ![Screenshot from 2024-04-07 16-50-59](https://github.com/kalaiprasanth/jenkins-ci-cd/assets/161060613/fd4674b9-7889-4aa4-88bc-5425d61b4b48)

    ->Create a container in ECR:
  ![Screenshot from 2024-04-07 17-12-00](https://github.com/kalaiprasanth/jenkins-ci-cd/assets/161060613/c8dad595-774b-4d50-a4fa-b3569dfef558)

    -> Install awscli
    cmd : sudo apt install awscli
          aws ecr get-login-password --region ap-south-1 |sudo docker login --username AWS --password-stdin 975050015935.dkr.ecr.ap-south-1.amazonaws.com
          This command retrieves an authentication token from Amazon ECR (Elastic Container Registry) using the AWS CLI.

STEP 4:

    -> Execute commands in jenkins

       git clone https://github.com/kalaiprasanth/jenkins-ci-cd.git ==> it clones the repository

       cp -r ./jenkins-ci-cd/* . ==> copy my repository into current directory -r (recursive copy)

       sudo docker build -t test . ==> Build a dockerimage like httpd

       aws ecr get-login-password --region ap-south-1 |sudo docker login --username AWS --password-stdin 975050015935.dkr.ecr.ap-south-1.amazonaws.com ==> it retrives a token from ECR

       sudo docker tag test 975050015935.dkr.ecr.ap-south-1.amazonaws.com/myworkimage ==> This command tags the Docker image named "test" 

       sudo docker push 975050015935.dkr.ecr.ap-south-1.amazonaws.com/myworkimage ==> Its pushes the docker image named as "myworkimage"

       sudo docker run -d -p 80:80 975050015935.dkr.ecr.ap-south-1.amazonaws.com/myworkimage ==> Its runs a docker container port mapping into(80:80)



     -> Then Build on jenkins project
  ![Screenshot from 2024-04-07 17-12-50](https://github.com/kalaiprasanth/jenkins-ci-cd/assets/161060613/0197f447-ecc1-410a-8110-6ed40f68c43a)

     -> Finally copy your public IP and paste it on Browser

        Final output for JENKINS-CI-CD
        
   ![Screenshot from 2024-04-07 17-13-57](https://github.com/kalaiprasanth/jenkins-ci-cd/assets/161060613/cae67602-2337-4fed-a8de-2ba023d5918b)


        

     
    

    
