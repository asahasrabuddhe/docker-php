.PHONY: build
build: build-base build-apache build-nginx

.PHONY: build-base
build-base:
	docker build -f debian-base/Dockerfile --build-arg version=jessie-slim -t ajitemsahasrabuddhe/debian-base:jessie-1.0 .
	docker build -f debian-base/Dockerfile --build-arg version=stretch-slim -t ajitemsahasrabuddhe/debian-base:stretch-1.0 .

.PHONY: build-apache
build-apache:
	docker build -f apache/Dockerfile --build-arg base_version=jessie-1.0 --build-arg php_version=5.6 -t ajitemsahasrabuddhe/php-apache:jessie-5.6-dev .
	docker build -f apache/Dockerfile --build-arg base_version=stretch-1.0 --build-arg php_version=5.6 -t ajitemsahasrabuddhe/php-apache:stretch-5.6-dev .
	docker build -f apache/Dockerfile --build-arg base_version=jessie-1.0 --build-arg php_version=5.6 --build-arg env=prod -t ajitemsahasrabuddhe/php-apache:jessie-5.6 .
	docker build -f apache/Dockerfile --build-arg base_version=stretch-1.0 --build-arg php_version=5.6 --build-arg env=prod -t ajitemsahasrabuddhe/php-apache:stretch-5.6 .
	docker build -f apache/Dockerfile --build-arg base_version=jessie-1.0  --build-arg php_version=7.0 -t ajitemsahasrabuddhe/php-apache:jessie-7.0-dev .
	docker build -f apache/Dockerfile --build-arg base_version=stretch-1.0  --build-arg php_version=7.0 -t ajitemsahasrabuddhe/php-apache:stretch-7.0-dev .
	docker build -f apache/Dockerfile --build-arg base_version=jessie-1.0 --build-arg php_version=7.0 --build-arg env=prod -t ajitemsahasrabuddhe/php-apache:jessie-7.0 .
	docker build -f apache/Dockerfile --build-arg base_version=stretch-1.0 --build-arg php_version=7.0 --build-arg env=prod -t ajitemsahasrabuddhe/php-apache:stretch-7.0 .
	docker build -f apache/Dockerfile --build-arg base_version=jessie-1.0 --build-arg php_version=7.1 -t ajitemsahasrabuddhe/php-apache:jessie-7.1-dev .
	docker build -f apache/Dockerfile --build-arg base_version=stretch-1.0 --build-arg php_version=7.1 -t ajitemsahasrabuddhe/php-apache:stretch-7.1-dev .
	docker build -f apache/Dockerfile --build-arg base_version=jessie-1.0 --build-arg php_version=7.1 --build-arg env=prod -t ajitemsahasrabuddhe/php-apache:jessie-7.1 .
	docker build -f apache/Dockerfile --build-arg base_version=stretch-1.0 --build-arg php_version=7.1 --build-arg env=prod -t ajitemsahasrabuddhe/php-apache:stretch-7.1 .
	docker build -f apache/Dockerfile --build-arg base_version=jessie-1.0 --build-arg php_version=7.2 -t ajitemsahasrabuddhe/php-apache:jessie-7.2-dev .
	docker build -f apache/Dockerfile --build-arg base_version=stretch-1.0 --build-arg php_version=7.2 -t ajitemsahasrabuddhe/php-apache:stretch-7.2-dev .
	docker build -f apache/Dockerfile --build-arg base_version=jessie-1.0 --build-arg php_version=7.2 --build-arg env=prod -t ajitemsahasrabuddhe/php-apache:jessie-7.2 .
	docker build -f apache/Dockerfile --build-arg base_version=stretch-1.0 --build-arg php_version=7.2 --build-arg env=prod -t ajitemsahasrabuddhe/php-apache:stretch-7.2 .
	docker build -f apache/Dockerfile --build-arg base_version=jessie-1.0 --build-arg php_version=7.3 -t ajitemsahasrabuddhe/php-apache:jessie-7.3-dev .
	docker build -f apache/Dockerfile --build-arg base_version=stretch-1.0 --build-arg php_version=7.3 -t ajitemsahasrabuddhe/php-apache:stretch-7.3-dev .
	docker build -f apache/Dockerfile --build-arg base_version=jessie-1.0 --build-arg php_version=7.3 --build-arg env=prod -t ajitemsahasrabuddhe/php-apache:jessie-7.3 .
	docker build -f apache/Dockerfile --build-arg base_version=stretch-1.0 --build-arg php_version=7.3 --build-arg env=prod -t ajitemsahasrabuddhe/php-apache:stretch-7.3 .

.PHONY: build-nginx
build-nginx:
	docker build -f nginx/Dockerfile --build-arg base_version=jessie-1.0 --build-arg php_version=5.6 -t ajitemsahasrabuddhe/php-nginx:jessie-5.6-dev .
	docker build -f nginx/Dockerfile --build-arg base_version=stretch-1.0 --build-arg php_version=5.6 -t ajitemsahasrabuddhe/php-nginx:stretch-5.6-dev .
	docker build -f nginx/Dockerfile --build-arg base_version=jessie-1.0 --build-arg php_version=5.6 --build-arg env=prod -t ajitemsahasrabuddhe/php-nginx:jessie-5.6 .
	docker build -f nginx/Dockerfile --build-arg base_version=stretch-1.0 --build-arg php_version=5.6 --build-arg env=prod -t ajitemsahasrabuddhe/php-nginx:stretch-5.6 .
	docker build -f nginx/Dockerfile --build-arg base_version=jessie-1.0  --build-arg php_version=7.0 -t ajitemsahasrabuddhe/php-nginx:jessie-7.0-dev .
	docker build -f nginx/Dockerfile --build-arg base_version=stretch-1.0  --build-arg php_version=7.0 -t ajitemsahasrabuddhe/php-nginx:stretch-7.0-dev .
	docker build -f nginx/Dockerfile --build-arg base_version=jessie-1.0 --build-arg php_version=7.0 --build-arg env=prod -t ajitemsahasrabuddhe/php-nginx:jessie-7.0 .
	docker build -f nginx/Dockerfile --build-arg base_version=stretch-1.0 --build-arg php_version=7.0 --build-arg env=prod -t ajitemsahasrabuddhe/php-nginx:stretch-7.0 .
	docker build -f nginx/Dockerfile --build-arg base_version=jessie-1.0 --build-arg php_version=7.1 -t ajitemsahasrabuddhe/php-nginx:jessie-7.1-dev .
	docker build -f nginx/Dockerfile --build-arg base_version=stretch-1.0 --build-arg php_version=7.1 -t ajitemsahasrabuddhe/php-nginx:stretch-7.1-dev .
	docker build -f nginx/Dockerfile --build-arg base_version=jessie-1.0 --build-arg php_version=7.1 --build-arg env=prod -t ajitemsahasrabuddhe/php-nginx:jessie-7.1 .
	docker build -f nginx/Dockerfile --build-arg base_version=stretch-1.0 --build-arg php_version=7.1 --build-arg env=prod -t ajitemsahasrabuddhe/php-nginx:stretch-7.1 .
	docker build -f nginx/Dockerfile --build-arg base_version=jessie-1.0 --build-arg php_version=7.2 -t ajitemsahasrabuddhe/php-nginx:jessie-7.2-dev .
	docker build -f nginx/Dockerfile --build-arg base_version=stretch-1.0 --build-arg php_version=7.2 -t ajitemsahasrabuddhe/php-nginx:stretch-7.2-dev .
	docker build -f nginx/Dockerfile --build-arg base_version=jessie-1.0 --build-arg php_version=7.2 --build-arg env=prod -t ajitemsahasrabuddhe/php-nginx:jessie-7.2 .
	docker build -f nginx/Dockerfile --build-arg base_version=stretch-1.0 --build-arg php_version=7.2 --build-arg env=prod -t ajitemsahasrabuddhe/php-nginx:stretch-7.2 .
	docker build -f nginx/Dockerfile --build-arg base_version=jessie-1.0 --build-arg php_version=7.3 -t ajitemsahasrabuddhe/php-nginx:jessie-7.3-dev .
	docker build -f nginx/Dockerfile --build-arg base_version=stretch-1.0 --build-arg php_version=7.3 -t ajitemsahasrabuddhe/php-nginx:stretch-7.3-dev .
	docker build -f nginx/Dockerfile --build-arg base_version=jessie-1.0 --build-arg php_version=7.3 --build-arg env=prod -t ajitemsahasrabuddhe/php-nginx:jessie-7.3 .
	docker build -f nginx/Dockerfile --build-arg base_version=stretch-1.0 --build-arg php_version=7.3 --build-arg env=prod -t ajitemsahasrabuddhe/php-nginx:stretch-7.3 .

.PHONY: push
push:
	docker push ajitemsahasrabuddhe/debian-base:jessie-1.0
	docker push ajitemsahasrabuddhe/debian-base:stretch-1.0
	docker push ajitemsahasrabuddhe/php-apache:jessie-5.6
	docker push ajitemsahasrabuddhe/php-apache:stretch-5.6
	docker push ajitemsahasrabuddhe/php-apache:jessie-5.6-dev
	docker push ajitemsahasrabuddhe/php-apache:stretch-5.6-dev
	docker push ajitemsahasrabuddhe/php-apache:jessie-7.0
	docker push ajitemsahasrabuddhe/php-apache:stretch-7.0
	docker push ajitemsahasrabuddhe/php-apache:jessie-7.0-dev
	docker push ajitemsahasrabuddhe/php-apache:stretch-7.0-dev
	docker push ajitemsahasrabuddhe/php-apache:jessie-7.1
	docker push ajitemsahasrabuddhe/php-apache:stretch-7.1
	docker push ajitemsahasrabuddhe/php-apache:jessie-7.1-dev
	docker push ajitemsahasrabuddhe/php-apache:stretch-7.1-dev
	docker push ajitemsahasrabuddhe/php-apache:jessie-7.2
	docker push ajitemsahasrabuddhe/php-apache:stretch-7.2
	docker push ajitemsahasrabuddhe/php-apache:jessie-7.2-dev
	docker push ajitemsahasrabuddhe/php-apache:stretch-7.2-dev
	docker push ajitemsahasrabuddhe/php-apache:jessie-7.3
	docker push ajitemsahasrabuddhe/php-apache:stretch-7.3
	docker push ajitemsahasrabuddhe/php-apache:jessie-7.3-dev
	docker push ajitemsahasrabuddhe/php-apache:stretch-7.3-dev
	docker push ajitemsahasrabuddhe/php-nginx:jessie-5.6
	docker push ajitemsahasrabuddhe/php-nginx:stretch-5.6
	docker push ajitemsahasrabuddhe/php-nginx:jessie-5.6-dev
	docker push ajitemsahasrabuddhe/php-nginx:stretch-5.6-dev
	docker push ajitemsahasrabuddhe/php-nginx:jessie-7.0
	docker push ajitemsahasrabuddhe/php-nginx:stretch-7.0
	docker push ajitemsahasrabuddhe/php-nginx:jessie-7.0-dev
	docker push ajitemsahasrabuddhe/php-nginx:stretch-7.0-dev
	docker push ajitemsahasrabuddhe/php-nginx:jessie-7.1
	docker push ajitemsahasrabuddhe/php-nginx:stretch-7.1
	docker push ajitemsahasrabuddhe/php-nginx:jessie-7.1-dev
	docker push ajitemsahasrabuddhe/php-nginx:stretch-7.1-dev
	docker push ajitemsahasrabuddhe/php-nginx:jessie-7.2
	docker push ajitemsahasrabuddhe/php-nginx:stretch-7.2
	docker push ajitemsahasrabuddhe/php-nginx:jessie-7.2-dev
	docker push ajitemsahasrabuddhe/php-nginx:stretch-7.2-dev
	docker push ajitemsahasrabuddhe/php-nginx:jessie-7.3
	docker push ajitemsahasrabuddhe/php-nginx:stretch-7.3
	docker push ajitemsahasrabuddhe/php-nginx:jessie-7.3-dev
	docker push ajitemsahasrabuddhe/php-nginx:stretch-7.3-dev
