meteord:
	docker build -t byscontrol/meteord:base -f base/Dockerfile ./base

devbuild: meteord
	docker build -t byscontrol/meteord:devbuild -f devbuild/Dockerfile ./devbuild

onbuild: meteord
	docker build -t byscontrol/meteord:onbuild -f onbuild/Dockerfile ./onbuild

devbuildmeteor-1.3.2.4: meteord
	docker build -t byscontrol/meteord:devbuildmeteor-1.3.2.4 -f devbuildmeteor/Dockerfile-1.3.2.4 ./devbuildmeteor

devbuildmeteor-1.3.4.1: meteord
	docker build -t byscontrol/meteord:devbuildmeteor-1.3.4.1 -f devbuildmeteor/Dockerfile-1.3.4.1 ./devbuildmeteor

devbuildmeteor-1.3.4.4: meteord
	docker build -t byscontrol/meteord:devbuildmeteor-1.3.4.4 -f devbuildmeteor/Dockerfile-1.3.4.4 ./devbuildmeteor
