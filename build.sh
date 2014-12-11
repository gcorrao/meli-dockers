#!/bin/bash
USER=$1
VERSION=$(cat version)
IMAGES=( "melibuntu" "melibuntujdk" "tomcat-runtime" "grails" )

for IMAGE in "${IMAGES[@]}" ; do
	cd $IMAGE
	echo "----------------------------------------"
	echo "Starting building process of: $IMAGE"
	echo "----------------------------------------"

	sudo docker build -t $USER/$IMAGE:$VERSION .
	if [ $? -ne 0 ]; then
		exit $?
	fi

	sudo docker tag $USER/$IMAGE:$VERSION $USER/$IMAGE:latest
	if [ $? -ne 0 ]; then
		exit $?
	fi

	sudo docker push $USER/$IMAGE:$VERSION
	if [ $? -ne 0 ]; then
		exit $?
	fi

	sudo docker push $USER/$IMAGE:latest
	if [ $? -ne 0 ]; then
		exit $?
	fi

	echo " "
	cd ..
done
cd grails/onbuild
sudo docker build -t  $USER/grails:onbuild .
sudo docker push $USER/grails:onbuild

