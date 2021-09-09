docker run 
	--name=tomcat_try_01 
	-d 
	-it 
	-m 2048M 
	--cpus=0.5
	-e JPDA_ADDRESS=8000 
	-e JPDA_TRANSPORT=dt_socket 
	-p 8888:8080 
	-p 31020:8080 
	-v D:/src/src_java/spring_proj01:/usr/local/tomcat/webapps/livro 
	-v D:/src/src_java/spring_proj01/config/tomcat-users.xml:/usr/local/tomcat/conf/tomcat-users.xml 
	tomcat 
	/usr/local/tomcat/bin/catalina.sh jpda run	
	/bin/bash -c "mv /usr/local/tomcat/webapps /usr/local/tomcat/webapps2; mv /usr/local/tomcat/webapps.dist /usr/local/tomcat/webapps; cp /tmp/context.xml /usr/local/tomcat/webapps/manager/META-INF/context.xml; catalina.sh run"

docker run 
	--name=TOMCAT_Remote_debug
	-it 
	-d
	-m 2048M 
	--cpus=0.5	
	-p 8088:8080 
	-p 8000:8000 
	-e CATALINA_OPTS="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:8000" 
	tomcat:9.0.17-jre11

docker run \
	--name=tomcat_try_01 \
	-d \
	-it \
	-m 2048M \
	--cpus=0.5 \
	-e JPDA_ADDRESS=8000 \
	-e JPDA_TRANSPORT=dt_socket \
	-p 8888:8080 \
	-p 31020:8080 \
	-v D:/src/src_java/spring_proj01:/usr/local/tomcat/webapps/livro \
	-v D:/src/src_java/spring_proj01/config/tomcat-users.xml:/usr/local/tomcat/conf/tomcat-users.xml \
	tomcat:latest \
	/usr/local/tomcat/bin/catalina.sh jpda run \
	/bin/bash -c "mv /usr/local/tomcat/webapps /usr/local/tomcat/webapps2; mv /usr/local/tomcat/webapps.dist /usr/local/tomcat/webapps; cp /tmp/context.xml /usr/local/tomcat/webapps/manager/META-INF/context.xml; catalina.sh run" \
		
docker run \
	--name=tomcat_try_01 \
	-d \
	-it \
	-m 2048M \
	--cpus=0.5 \
	-e JPDA_ADDRESS=8000 \
	-e JPDA_TRANSPORT=dt_socket \
	-p 8088:8080 \
	-p 31020:8080 \
	-v D:/src/src_java/spring_proj01:/usr/local/tomcat/webapps/livro \
	-v D:/src/src_java/spring_proj01/config/tomcat-users.xml:/usr/local/tomcat/conf/tomcat-users.xml \
	tomcat:latest \
	/usr/local/tomcat/bin/catalina.sh jpda run \
	/bin/bash -c "mv /usr/local/tomcat/webapps /usr/local/tomcat/webapps2; mv /usr/local/tomcat/webapps.dist /usr/local/tomcat/webapps; cp /tmp/context.xml /usr/local/tomcat/webapps/manager/META-INF/context.xml; catalina.sh run" \
		

	
docker run -it --rm -e JPDA_ADDRESS=8001 -e JPDA_TRANSPORT=dt_socket -p 8088:8080 -p 8001:8001 tomcat:latest /usr/local/tomcat/bin/catalina.sh jpda run		

docker run -it -m 2048M --cpus=0.5 -p 8088:8080 -p 8000:8000 -e CATALINA_OPTS="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:8000" tomcat:latest 

docker run --name=jsptomcatdebug -d -v ~/Documents/jsptomcat:/usr/local/tomcat/webapps/jsptutorial -p 31020:8080 -p 8000:8000 -e JPDA_ADDRESS=8000 tomcat catalina.sh jpda run