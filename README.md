Hello All,

Please follow below Project & Description.

Project:- Large scale webserver application programming and deployment using devops lifecycle(SDLC) PROCESS.

Software development lifecycle process.

Description:- 

1. Source code is created using devlopers IDE & checked into "Gitlab" as our SCM(Source Code Management) or our CI(Continuous Integration) tool.

2. The source code is then checked out using "Jenkins Automation Server". Following stages as per CI/CD phases. The stages consists of the following

a. Checkout

b. Build

c. Release

d. Testing. 

e. Deployment

3. Testing is performed on Test ENV which are configured using "Ansible(Configuration Management Tool)"

4. ENV created for Testing are built on "Docker" containers.

5. These containers are created on "Kubernetes" engine to provide large scale redundancy, scalability, monitoring & recovery.
 
6. Above infrastructure is based on industry standard DEV, UAT, SIT & PRD environments. 

7. Above infrastructure is created with the help of Ansible & Docker using Jenkins Automation server.
 
8. Nagios Monitoring Tool monitors all above clusters, infrastructures to provide detailed report on the centralised console or dashboard.

9. Above process is covered with industry standards CI/CD pipeline from checkout till deployment phase including auto trigger from git to Jenkins.

Please read & understand above project & description before mentioning it in the resume as we have already done above in the class.

Please practise all above. Thanks for the consideration.

Aamir Shaikh

Important Tips:-

## Repository Manager:- We have created a free account on free cloud repository JFrog. Please follow [JFrog free account](https://jfrog.com/artifactory/?utm_source=google&utm_medium=cpc&utm_campaign=Search|DSK|BrandAwareness|SearchPartners|India|202202&utm_term=artifactory%20cloud&utm_network=g&cq_plac=&cq_plt=gp&utm_content=u-bin&gclid=Cj0KCQiA45qdBhD-ARIsAOHbVdF07-xaEx-4FOrNBnxgKaibByJhrQ8i8e8va_DBNtGMr06VK8nqUXYaAjKlEALw_wcB) to create a free account & follow below steps.

### Login to your JFrog account & click on Quick Repository Creation as shown in below Pic.

![Alt text](jfrog/pic-1.jpg?raw=true "pic-1")

### Click on Maven icon as shown in the below pic & follow below steps.

![Alt text](jfrog/pic-2.jpg?raw=true "pic-2")

![Alt text](jfrog/pic-3.jpg?raw=true "pic-3")

![Alt text](jfrog/pic-4.jpg?raw=true "pic-4")

### After you click on Create, check "Repositories" under JFrog UI to check newly created Maven repository, Local repository & Virtual Repository as shown in below pics. 

![Alt text](jfrog/pic-5.jpg?raw=true "pic-5")

![Alt text](jfrog/pic-6.jpg?raw=true "pic-6")

![Alt text](jfrog/pic-7.jpg?raw=true "pic-7")

![Alt text](jfrog/pic-8.jpg?raw=true "pic-8")

### Later to use our own Maven repository, we need to generate a settings.xml file. Please follow below pics. 

![Alt text](jfrog/pic-9.jpg?raw=true "pic-9")

![Alt text](jfrog/pic-10.jpg?raw=true "pic-10")

![Alt text](jfrog/pic-11.jpg?raw=true "pic-11")

![Alt text](jfrog/pic-12.jpg?raw=true "pic-12")

![Alt text](jfrog/pic-13.jpg?raw=true "pic-13")

![Alt text](jfrog/pic-14.jpg?raw=true "pic-14")
    
## Sample settings.xml is mentioned here on the root folder. Please cross check with the file which you downloaded looking at above mentioned pics.

### We need to put this settings.xml file under our Maven Home Dir which is /var/lib/jenkins/.m2 folder on our Jenkins/Slave servers. 
#### Note:- This settings.xml file needs to present under every Maven Home Dir which is /var/lib/jenkins/.m2 folder WHICH YOU WILL USE to BUILD.

![Alt text](jfrog/pic-15.jpg?raw=true "pic-15")

## This will help you install all the dependencies from your own Maven repository.

## Now if you want to deploy your artifacts to your own JFrog repository. Put the distributionManagement block of code in your Parent pom.xml as shown below.

![Alt text](jfrog/pic-16.jpg?raw=true "pic-16")

## How to generate distributionManagement block of code, Please follow below steps

![Alt text](jfrog/pic-17.jpg?raw=true "pic-17")

### Select the folder which contains "local". This folder will store your artifacts which you deploy using maven deploy command. 

![Alt text](jfrog/pic-18.jpg?raw=true "pic-18")

![Alt text](jfrog/pic-19.jpg?raw=true "pic-19")

### Copy the above shown block of code in your pom.xml as shown in Pic-16




