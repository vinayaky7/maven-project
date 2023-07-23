# java-maven-tomcat-sample-project

This is a ready-to-deploy java web application built for Tomcat using Maven and webapp-runner.

## Running Locally

(need maven and java installed)

1. Build the package 
   ```
   mvn clean install
   ```

2. Deploy the Apache-tomcat web service on default port. 

   ```
   java -jar target/dependency/webapp-runner.jar target/*.war
   ```

3. Deploy the Apache-tomcat web service on custom port.
   ```
   java -jar target/dependency/webapp-runner.jar target/*.war  --port 9090 & 
   ```
  
## Running through Jenkins(Build/Automation Server)

1. Build the package 
   ```
   mvn clean install
   ```

2. Run below command from your Jenkins Job to deploy the Apache-tomcat web service -- > Execute Shell 
   ```
   #/bin/bash

   BUILD_ID=dontKillMe sh deploy-webservice.sh
   ```

   The application will be available on `http://localhost:9090` locally or `http://PUBLIC-IP:9090` publicly. Please change the port as per the deployment.

3. Test
   ```
   curl -kv http://YOUR-JENKINS-PUBLIC-IP:PORT-NO
   ```
4. Run the app using JAVA Docker image
   ```
   docker run -it --name java -p 9999:9999 -v /var/lib/jenkins/workspace/java-maven-test/target:/app/target bitnami/java:latest java -jar /app/target/dependency/webapp-runner.jar /app/target/java-maven-tomcat-example.war --port 9999 &
   ```

5. Run the app using custom Docker image. Please refer Dockerfile ([here](https://gitlab.com/andromeda99/webserver-docker/-/blob/master/Dockerfile)  )
   ```
   docker run -it --name javaApp -p 9999:8080  java-jdk-13:latest &
   ```
   The image is available on my ([dockerhub account](https://hub.docker.com/r/aamirs/java-jdk-13)  )

## How This Was Built

1. Generate the project using a Maven archetype(optional).

   ```
   mvn archetype:generate -DarchetypeArtifactId=maven-archetype-webapp
   ```

2. Add the webapp-runner plugin into the `pom.xml` if not already added to invoke apache-tomcat from within the POM via the webapp-runner jar:

   ```
   <build>
     <!-- ... -->
     <plugins>
       <!-- ... -->
       <plugin>
         <groupId>org.apache.maven.plugins</groupId>
         <artifactId>maven-dependency-plugin</artifactId>
         <version>2.3</version>
         <executions>
           <execution>
             <phase>package</phase>
             <goals><goal>copy</goal></goals>
             <configuration>
               <artifactItems>
                 <artifactItem>
                   <groupId>com.github.jsimone</groupId>
                   <artifactId>webapp-runner</artifactId>
                   <version>8.5.11.3</version>
                   <destFileName>webapp-runner.jar</destFileName>
                 </artifactItem>
               </artifactItems>
             </configuration>
           </execution>
         </executions>
       </plugin>
     </plugins>
   </build>
   ```
