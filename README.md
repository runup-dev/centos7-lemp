# CENTOS-LEMP소개

LEMP 스펙을 구축하는 쉘스크립트 입니다 
CENTOS7을 기준으로 작성되었습니다 
공서버에 SUDO권한 유저를 추가하고 개인키를 배포합니다 
SUDO권한 유저로 접속후 LEMP 및 추가패키지를 설치합니다 

LEMP 스펙
 - CENTOS7
 - Nginx 최신버전
 - PHP 7.3
 - Mariadb 최신버전 

추가패키지 
 - clamv
 - Dropbox Uploader
 - WP-CLI
 - Let's Encrypt


# 사용방법 

ROOT권한으로 쉘에접속후 아래코드를 실행합니다
(SUDO유저 생성 및 개인키 배포)

./set_user.sh {SUDO유저명}


개인키를 다운로드후 SUDO권한 유저로 쉘에 접속합니다

한번에 설치하려면 아래를 실행합니다

./set.sh


단계별로 설치하려면 아래를 실행합니다
(순서별로 NGINX -> PHP 7.3 -> MARIADB -> 추가패키지)


./set_webserver.sh
./set_php.sh
./set_database.sh
./set_package.sh
