## CENTOS-LEMP소개

LEMP 스펙을 구축하는 쉘스크립트 입니다 
CENTOS7을 기준으로 작성되었습니다 

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

SUDO유저생성( 개인키인증 ) 
 - 관리자로그인 / 패스워드 로그인 OFF 권장 

## 사용방법 

1. ROOT권한으로 쉘에접속후 아래코드를 실행합니다

<pre>
<code>
# TIMEZONE SET
timedatectl set-timezone Asia/Seoul     

# PACKAGE UPDATE
sudo yum update -y                     

# GIT 설치
sudo yum  install -y git

# LEMP구축 스크립트 다운로드 
git clone https://github.com/runup-dev/centos7-lemp.git
cd centos7-lemp

# NGINX 설치
./set_webserver.sh

# PHP설치
./set_php.sh

# MARIADB설치
./set_database.sh

# 추가패키지설치
./set_package.sh

# SUDO유저를 생성하려면 실행하세요 
./set_user.sh -u {SUDO유저명} -p {개인키비밀번호}

# 시스템 재시작 
shutdown -r 

</code>
</pre>

2. SUDO유저권한으로 로그인 후 이상이 없으면 ROOT 로그인 / 패스워드 로그인을 OFF 하시길 권장드립니다   
- 수정방법은 아래와 같습니다 
 
<pre>
<code>
sudo vi /etc/ssh/sshd_config

# PasswordAuthentication yes
PasswordAuthentication no

# PermitRootLogin yes
PermitRootLogin no

# 텍스트편집기 저장후 종료 

# RESTART sshd 
sudo systemctl restart sshd
</code>
</pre>

