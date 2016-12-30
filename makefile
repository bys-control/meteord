meteord:
	docker build -t byscontrol/meteord:base -f base/Dockerfile ./base

devbuild: meteord
	docker build -t byscontrol/meteord:devbuild -f devbuild/Dockerfile ./devbuild

onbuild: meteord
	docker build -t byscontrol/meteord:onbuild -f onbuild/Dockerfile ./onbuild

devbuildmeteor-1.3.2.4: meteord
	docker build --build-arg CDN_SERVER='http://10.0.0.4:8080' --build-arg METEOR_RELEASE='1.3.2.4' -t byscontrol/meteord:devbuildmeteor-1.3.2.4 -f devbuildmeteor/Dockerfile ./devbuildmeteor

devbuildmeteor-1.3.4.1: meteord
	docker build --build-arg CDN_SERVER='http://10.0.0.4:8080' --build-arg METEOR_RELEASE='1.3.4.1' -t byscontrol/meteord:devbuildmeteor-1.3.2.4 -f devbuildmeteor/Dockerfile ./devbuildmeteor

devbuildmeteor-1.3.4.4: meteord
	docker build --build-arg CDN_SERVER='http://10.0.0.4:8080' --build-arg METEOR_RELEASE='1.3.4.4' -t byscontrol/meteord:devbuildmeteor-1.3.2.4 -f devbuildmeteor/Dockerfile ./devbuildmeteor
