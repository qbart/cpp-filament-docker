build:
	docker run \
	  --name ldjam \
	  --rm -it \
	  --mount type=bind,source=/home/bart/jams/ld47/src,target=/app \
	  qbart:ldjam 

build.docker:
	docker build . -t qbart:ldjam
	#--mount type=bind,source="$(pwd)",target=/app \
