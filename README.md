# java-maven-tomcat-sample-project

This is a ready-to-deploy java web application built for Tomcat using Maven and webapp-runner.

## Running Locally

(need maven and java installed)

1. Build the package 
   ```
   mvn clean install
   ```

2. Deploy the tomcat web service jar & the source compiled jar combined. 

   ```
   java -jar target/dependency/webapp-runner.jar target/*.war
   ```

3. Deploy the tomcat web service on desired port as required(optional)
   ```
   java -jar target/dependency/webapp-runner.jar target/*.war  --port 9090 & 
   ```
  
## Running through Jenkins(Build/Automation Server)

1. Build the package 
   ```
   mvn clean install
   ```

2. Run below command from your Jenkins Job -- > Execute Shell to deploy the tomcat web service. 
   ```
   BUILD_ID=dontKillMe sh deploy-webservice.sh
   ```

The application will be available on `http://localhost:9090` locally or `http://PUBLIC-IP:9090` publicly. Please change the port as per the deploy command.

3. Test
   ```
   curl -kv http://YOUR-JENKINS-PUBLIC-IP:PORT-NO
   ```

4. How to deploy a jar manually on Jfrog
   ```
   curl -X PUT -u username:password -T target/dependency/webapp-runner.jar https://radicaljune2023.jfrog.io/artifactory/test-libs-snapshot/com/radical/june/java-maven-tomcat-example/4.0-SNAPSHOT/webapp-runner.jar
   ```

5. How to pull a jar manually on Jfrog
   ```
   curl -u "user:password" -X GET https://radicaljune2023.jfrog.io/artifactory/test-libs-snapshot/com/radical/june/java-maven-tomcat-example/4.0-SNAPSHOT/webapp-runner-8.5.11.3.jar -H 'Content-Type:application/json' -o webapp-runner-8.5.11.3.jar
   ```
6. Run the app using JAVA Docker image
   ```
   docker run -it --name java -p 9999:9999 -v /var/lib/jenkins/workspace/java-maven-test/target:/app/target bitnami/java:latest java -jar /app/target/dependency/webapp-runner.jar /app/target/java-maven-tomcat-example.war --port 9999 &
   ```

7. Run the app using centos:centos7 custom Docker image ([Please refer Dockerfile](https://gitlab.com/andromeda99/maven-project/-/tree/java-test)  )
   ```
   docker run -it --name java -p 9999:8080  java:latest &
   ```

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
