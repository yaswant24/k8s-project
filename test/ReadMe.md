Deploy a Java Application on Kubernetes cluster - Step by Step Guide

Step 1: Quick Understanding of the Code

📁 Project Overview
Name: LoginWebApp

Type: Java Web Application (JSP/Servlets)
A Java Web Application is software built using Java that runs on a web server (like Apache Tomcat) and is accessed via a browser and is typically packaged as a .war (Web Application Archive) file.
It is used to build dynamic web applications. 

Build Tool: Maven

Maven is a build automation and project management tool for Java projects.
✅ A recipe book that tells your computer:
How to compile your code
Which libraries (dependencies) your project needs
How to package your app (e.g., into a .war file)
Web Files: JSPs (index.jsp, login.jsp, userRegistration.jsp)

Deployment Target: Tomcat server
Apache Tomcat is a lightweight, open-source web server and  is designed specifically to run Java web applications — especially those using Servlets and JSPs.

Folder/File	Purpose
pom.xml:	Maven build config (dependencies, plugins)
target/:	Compiled output and WAR file
src/main/webapp/:	JSP files, HTML, CSS, JS
src/main/webapp/WEB-INF/:	Config files like web.xml (optional now)
index.jsp, login.jsp, etc.	Front-end views using JSP


Step 2 : Build the war file
WAR stands for Web Application Archive.
It’s a special .war file (similar to .zip) that bundles everything your Java web app needs to run on a server like Apache Tomcat.

Required pom.xml: It is a Maven configuration file for building a Java web application packaged as a WAR, with dependencies for Servlet API, MySQL JDBC driver, and JUnit for testing, and it sets the final WAR name as LoginWebApp

For now we will generate the war file locally ,later will create pipeline for this.
2.1. Pre-requisite : Make sure java is installed .
java -version

2.2. Refer below link for install mvn 
https://maven.apache.org/install.html
mvn -v : Check if maven is installed

2.3 Generate WAR File
mvn clean package
📦 After it builds successfully, the .war file will be created at:
target/LoginWebApp.war

Step 3: 

Write a Dockerfile that creates a container which:
-> Starts with Tomcat 8.5 installed.
-> Deploys your LoginWebApp.war automatically.
-> Runs the Tomcat server so your app is accessible.

Step 4:
Write a Dockerfile for mysql container where you are creating a user database table to save info like name, email, username, password, and registration date — with a unique ID assigned to every user automatically.

cd C:\Users\81708\Desktop\DTS\Projects\Week1\k8s-deployment
>docker login
docker build -f Dockerfile-tomcat -t loginwebapp:11 .
docker build -f Dockerfile-mysql -t mysql:11 .
docker tag loginwebapp:11 kritikajha94/loginwebapp:11
docker tag mysql:11  kritikajha94/mysql:11
docker push  kritikajha94/loginwebapp:11
docker push kritikajha94/mysql:11

http://localhost:30008/LoginWebApp/
