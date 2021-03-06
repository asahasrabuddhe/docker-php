.PHONY: build
build: build-base build-apache build-nginx

.PHONY: build-base
build-base: build-debian build-ubuntu build-centos build-amazonlinux

.PHONY: build-debian
build-debian:
	for base in "jessie" "stretch"; do \
		docker build -f bases/debian.Dockerfile --build-arg version="$$base"-slim -t ajitemsahasrabuddhe/debian-base:"$$base"-1.1 .; \
	done;

.PHONY: build-ubuntu
build-ubuntu:
	for base in "trusty" "xenial" "bionic"; do \
		docker build -f bases/ubuntu.Dockerfile --build-arg version="$$base" -t ajitemsahasrabuddhe/ubuntu-base:"$$base"-1.1 .; \
	done;

.PHONY: build-centos
build-centos:
	for base in "7"; do \
		docker build -f bases/centos.Dockerfile --build-arg version="$$base" -t ajitemsahasrabuddhe/centos-base:"$$base"-1.0 .; \
	done;

.PHONY: build-amazonlinux
build-amazonlinux:
	for base in "1" "2"; do \
		docker build -f bases/amazonlinux.Dockerfile --build-arg version="$$base" -t ajitemsahasrabuddhe/amazonlinux-base:"$$base"-1.0 .; \
	done;

.PHONY: build-apache
build-apache:
	for base_version in "jessie" "stretch"; do \
		for php_version in "5.6" "7.0" "7.1" "7.2" "7.3"; do \
			for env in "dev" "prod"; do \
				docker build -f apache/debian.Dockerfile --build-arg base_version="$$base_version"-1.1 --build-arg php_version="$$php_version" --build-arg env="$$env" -t ajitemsahasrabuddhe/php-apache:"$$base_version"-"$$php_version"-dev .; \
			done; \
		done; \
	done;
	for base_version in "trusty" "xenial" "bionic"; do \
		for php_version in "5.6" "7.0" "7.1" "7.2" "7.3"; do \
			for env in "dev" "prod"; do \
				docker build -f apache/ubuntu.Dockerfile --build-arg base_version="$$base_version"-1.1 --build-arg php_version="$$php_version" --build-arg env="$$env" -t ajitemsahasrabuddhe/php-apache:"$$base_version"-"$$php_version"-dev .; \
			done; \
		done; \
	done;
	for base_version in "7"; do \
		for php_version in "5.6" "7.0" "7.1" "7.2" "7.3"; do \
			for env in "dev" "prod"; do \
				docker build -f apache/centos.Dockerfile --build-arg base_version="$$base_version"-1.0 --build-arg php_version="$$php_version" --build-arg env="$$env" -t ajitemsahasrabuddhe/php-apache:"$$base_version"-"$$php_version"-dev .; \
			done; \
		done; \
	done;

.PHONY: build-nginx
build-nginx:
	for base_version in "jessie" "stretch"; do \
		for php_version in "5.6" "7.0" "7.1" "7.2" "7.3"; do \
			for env in "dev" "prod"; do \
				docker build -f nginx/debian.Dockerfile --build-arg base_version="$$base_version"-1.1 --build-arg php_version="$$php_version" --build-arg env="$$env" -t ajitemsahasrabuddhe/php-nginx:"$$base_version"-"$$php_version"-dev .; \
			done; \
		done; \
	done;
	for base_version in "trusty" "xenial" "bionic"; do \
		for php_version in "5.6" "7.0" "7.1" "7.2" "7.3"; do \
			for env in "dev" "prod"; do \
				docker build -f nginx/ubuntu.Dockerfile --build-arg base_version="$$base_version"-1.1 --build-arg php_version="$$php_version" --build-arg env="$$env" -t ajitemsahasrabuddhe/php-nginx:"$$base_version"-"$$php_version"-dev .; \
			done; \
		done; \
	done;

.PHONY: push
push: push-base push-apache push-nginx

.PHONY: push-base
push-base:
	for base in "jessie" "stretch"; do \
		docker push ajitemsahasrabuddhe/debian-base:"$$base"-1.1; \
	done; \
	for base in "trusty" "xenial" "bionic"; do \
		docker push ajitemsahasrabuddhe/ubuntu-base:"$$base"-1.1; \
	done; \
	for base in "7"; do \
		docker push ajitemsahasrabuddhe/centos-base:"$$base"-1.0; \
	done;
	for base in "1" "2"; do \
		docker push ajitemsahasrabuddhe/amazonlinux-base:"$$base"-1.0; \
	done;

.PHONY: push-apache
push-apache:
	for base_version in "jessie" "stretch"; do \
		for php_version in "5.6" "7.0" "7.1" "7.2" "7.3"; do \
				docker push ajitemsahasrabuddhe/php-apache:"$$base_version"-"$$php_version"; \
				docker push ajitemsahasrabuddhe/php-apache:"$$base_version"-"$$php_version"-dev; \
		done; \
	done;
	for base_version in "trusty" "xenial" "bionic"; do \
		for php_version in "5.6" "7.0" "7.1" "7.2" "7.3"; do \
				docker push ajitemsahasrabuddhe/php-apache:"$$base_version"-"$$php_version"; \
				docker push ajitemsahasrabuddhe/php-apache:"$$base_version"-"$$php_version"-dev; \
		done; \
	done;
	for base_version in "7"; do \
		for php_version in "5.6" "7.0" "7.1" "7.2" "7.3"; do \
				docker push ajitemsahasrabuddhe/php-apache:"$$base_version"-"$$php_version"; \
				docker push ajitemsahasrabuddhe/php-apache:"$$base_version"-"$$php_version"-dev; \
		done; \
	done;
	for base_version in "1" "2"; do \
		for php_version in "5.6" "7.0" "7.1" "7.2" "7.3"; do \
				docker push ajitemsahasrabuddhe/php-apache:"$$base_version"-"$$php_version"; \
				docker push ajitemsahasrabuddhe/php-apache:"$$base_version"-"$$php_version"-dev; \
		done; \
	done;
	
.PHONY: push-nginx
push-nginx:
	for base_version in "jessie" "stretch"; do \
		for php_version in "5.6" "7.0" "7.1" "7.2" "7.3"; do \
				docker push ajitemsahasrabuddhe/php-nginx:"$$base_version"-"$$php_version"; \
				docker push ajitemsahasrabuddhe/php-nginx:"$$base_version"-"$$php_version"-dev; \
		done; \
	done;
	for base_version in "trusty" "xenial" "bionic"; do \
		for php_version in "5.6" "7.0" "7.1" "7.2" "7.3"; do \
				docker push ajitemsahasrabuddhe/php-nginx:"$$base_version"-"$$php_version"; \
				docker push ajitemsahasrabuddhe/php-nginx:"$$base_version"-"$$php_version"-dev; \
		done; \
	done; \
