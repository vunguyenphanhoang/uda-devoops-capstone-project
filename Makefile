setup:
	# Create a python virtualenv & activate it
	python3 -m venv ~/.devops
	# source ~/.devops/bin/activate

install:
	echo ":::: Install dependencies ::::"
	pip install --upgrade pip && pip install -r app/requirements.txt

install-hadolint:
	echo ":::: Installing hadolint ::::"
	sudo wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64 && chmod +x /bin/hadolint

install-docker:
	chmod +x install-docker.sh
	./install-docker.sh

install-kubectl:
	chmod +x install-kubectl.sh
	./install-kubectl.sh

install-eskctl:
	chmod +x install-eksctl.sh
	./install-eksctl.sh

run-docker:
	echo ":::: RUN DOCKER ::::"
	docker run -t --rm -p 80:80 devoops-capstone

build-docker:
	echo ":::: BUILD DOCKER ::::"
	docker build --tag devoops-capstone app

upload-docker:
	echo ":::: UPLOAD DOCKER ::::"
	docker login -u nvnhan
	docker image tag devoops-capstone nvnhan/devoops-capstone:v1
	docker push nvnhan/devoops-capstone:v1

create-cluster:
	chmod +x ./create-cluster.sh
	./create-cluster.sh

deployment:
	chmod +x ./deployment.sh
	./deployment.sh

rolling:
	chmod +x ./rolling.sh
	./rolling.sh

rollback:
	kubectl get deployments -o wide
	kubectl rollout undo deployment devoops-capstone
	kubectl describe pods | grep -i image
	kubectl get pods -o wide
	kubectl get deployments -o wide

forwarding:
	kubectl port-forward service/devoops-capstone 80:80

cleanup:
	chmod +x ./cleanup.sh
	./cleanup.sh

test:
	# Additional, optional, tests could go here
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb

lint:
	# See local hadolint install instructions:   https://github.com/hadolint/hadolint
	# This is linter for Dockerfiles
	hadolint app/Dockerfile
	# This is a linter for Python source code linter: https://www.pylint.org/
	# This should be run from inside a virtualenv
	pylint --disable=R,C,W1203,W1202 app/app.py

all: install lint test