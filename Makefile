.PHONY: build
build: build-base build-apache build-nginx

.PHONY: build-base
build-base:
	docker build -f debian-base/Dockerfile -t ajitemsahasrabuddhe/debian-base:1.0 .
	
# .PHONY: build-apache
# build-apache:
# 	docker build -f php7-apache/Dockerfile -t ajitemsahasrabuddhe/php-apache:7.0-dev .
# 	docker build -f php7-apache/Dockerfile --build-arg env=prod -t ajitemsahasrabuddhe/php-apache:7.0 .
# 	docker build -f php71-apache/Dockerfile -t ajitemsahasrabuddhe/php-apache:7.1-dev .
# 	docker build -f php71-apache/Dockerfile --build-arg env=prod -t ajitemsahasrabuddhe/php-apache:7.1 .
# 	docker build -f php72-apache/Dockerfile -t ajitemsahasrabuddhe/php-apache:7.2-dev .
# 	docker build -f php72-apache/Dockerfile --build-arg env=prod -t ajitemsahasrabuddhe/php-apache:7.2 .
# 	docker build -f php73-apache/Dockerfile -t ajitemsahasrabuddhe/php-apache:7.3-dev .
# 	docker build -f php73-apache/Dockerfile --build-arg env=prod -t ajitemsahasrabuddhe/php-apache:7.3 .

# .PHONY: build-nginx
# build-nginx:
# 	docker build -f php7-nginx/Dockerfile -t ajitemsahasrabuddhe/php-nginx:7.0-dev .
# 	docker build -f php7-nginx/Dockerfile --build-arg env=prod -t ajitemsahasrabuddhe/php-nginx:7.0 .
# 	docker build -f php71-nginx/Dockerfile -t ajitemsahasrabuddhe/php-nginx:7.1-dev .
# 	docker build -f php71-nginx/Dockerfile --build-arg env=prod -t ajitemsahasrabuddhe/php-nginx:7.1 .
# 	docker build -f php72-nginx/Dockerfile -t ajitemsahasrabuddhe/php-nginx:7.2-dev .
# 	docker build -f php72-nginx/Dockerfile --build-arg env=prod -t ajitemsahasrabuddhe/php-nginx:7.2 .
# 	docker build -f php73-nginx/Dockerfile -t ajitemsahasrabuddhe/php-nginx:7.3-dev .
# 	docker build -f php73-nginx/Dockerfile --build-arg env=prod -t ajitemsahasrabuddhe/php-nginx:7.3 .

.PHONY: build-apache
build-apache:
	docker build -f php-apache/Dockerfile --build-arg php_version=7.0 -t ajitemsahasrabuddhe/php-apache:7.0-dev .
	docker build -f php-apache/Dockerfile --build-arg php_version=7.0 --build-arg env=prod -t ajitemsahasrabuddhe/php-apache:7.0 .
	docker build -f php-apache/Dockerfile --build-arg php_version=7.1 -t ajitemsahasrabuddhe/php-apache:7.1-dev .
	docker build -f php-apache/Dockerfile --build-arg php_version=7.1 --build-arg env=prod -t ajitemsahasrabuddhe/php-apache:7.1 .
	docker build -f php-apache/Dockerfile --build-arg php_version=7.2 -t ajitemsahasrabuddhe/php-apache:7.2-dev .
	docker build -f php-apache/Dockerfile --build-arg php_version=7.2 --build-arg env=prod -t ajitemsahasrabuddhe/php-apache:7.2 .
	docker build -f php-apache/Dockerfile --build-arg php_version=7.3 -t ajitemsahasrabuddhe/php-apache:7.3-dev .
	docker build -f php-apache/Dockerfile --build-arg php_version=7.3 --build-arg env=prod -t ajitemsahasrabuddhe/php-apache:7.3 .

.PHONY: build-nginx
build-nginx:
	docker build -f php-nginx/Dockerfile --build-arg php_version=7.0 -t ajitemsahasrabuddhe/php-nginx:7.0-dev .
	docker build -f php-nginx/Dockerfile --build-arg php_version=7.0 --build-arg env=prod -t ajitemsahasrabuddhe/php-nginx:7.0 .
	docker build -f php-nginx/Dockerfile --build-arg php_version=7.1 -t ajitemsahasrabuddhe/php-nginx:7.1-dev .
	docker build -f php-nginx/Dockerfile --build-arg php_version=7.1 --build-arg env=prod -t ajitemsahasrabuddhe/php-nginx:7.1 .
	docker build -f php-nginx/Dockerfile --build-arg php_version=7.2 -t ajitemsahasrabuddhe/php-nginx:7.2-dev .
	docker build -f php-nginx/Dockerfile --build-arg php_version=7.2 --build-arg env=prod -t ajitemsahasrabuddhe/php-nginx:7.2 .
	docker build -f php-nginx/Dockerfile --build-arg php_version=7.3 -t ajitemsahasrabuddhe/php-nginx:7.3-dev .
	docker build -f php-nginx/Dockerfile --build-arg php_version=7.3 --build-arg env=prod -t ajitemsahasrabuddhe/php-nginx:7.3 .

.PHONY: push
push:
	docker push ajitemsahasrabuddhe/php-apache:7.0
	docker push ajitemsahasrabuddhe/php-apache:7.0-dev
	docker push ajitemsahasrabuddhe/php-apache:7.1
	docker push ajitemsahasrabuddhe/php-apache:7.1-dev
	docker push ajitemsahasrabuddhe/php-apache:7.2
	docker push ajitemsahasrabuddhe/php-apache:7.2-dev
	docker push ajitemsahasrabuddhe/php-apache:7.3
	docker push ajitemsahasrabuddhe/php-apache:7.3-dev
	docker push ajitemsahasrabuddhe/php-nginx:7.0
	docker push ajitemsahasrabuddhe/php-nginx:7.0-dev
	docker push ajitemsahasrabuddhe/php-nginx:7.1
	docker push ajitemsahasrabuddhe/php-nginx:7.1-dev
	docker push ajitemsahasrabuddhe/php-nginx:7.2
	docker push ajitemsahasrabuddhe/php-nginx:7.2-dev
	docker push ajitemsahasrabuddhe/php-nginx:7.3
	docker push ajitemsahasrabuddhe/php-nginx:7.3-dev