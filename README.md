# 🖥️ 나만의 개발자 작업실 만들기

### Linux CLI · Docker · Nginx · Git & GitHub

---

# 1. 프로젝트 소개

본 프로젝트는 Linux CLI와 Docker를 활용하여 개발 환경을 직접 구축하고, 웹 서버를 실행하며, Git과 GitHub를 이용하여 프로젝트를 관리하는 것을 목표로 한다.

개발 환경을 직접 구성하는 과정에서 Linux의 기본 명령어, 파일 권한 관리, Docker 이미지와 컨테이너의 개념, 포트 포워딩, Bind Mount, Volume, 데이터 백업 및 복구, Git을 이용한 버전 관리 방법을 학습하였다.

## 프로젝트 목표

1. Linux CLI를 이용한 파일 및 디렉터리 관리
2. chmod를 이용한 파일 권한 설정
3. Docker 설치 및 데몬 상태 확인
4. Docker 이미지 생성 및 컨테이너 실행
5. Nginx 웹 서버 구축 및 접속
6. 포트 포워딩을 통한 네트워크 연결
7. Bind Mount를 이용한 호스트와 컨테이너 간 파일 공유
8. Volume을 이용한 데이터 영속성 확보
9. Volume 백업 및 복구
10. Git과 GitHub를 이용한 버전 관리

---

# 2. 개발 환경

| 구분         | 사용 환경              |
| ---------- | ------------------ |
| 운영체제       | Windows            |
| Linux 환경   | Ubuntu / WSL       |
| 개발 도구      | Visual Studio Code |
| 컨테이너 플랫폼   | Docker             |
| 웹 서버       | Nginx              |
| Docker 이미지 | nginx:alpine       |
| 버전 관리      | Git                |
| 원격 저장소     | GitHub             |
| 웹 페이지      | HTML               |

---

# 3. 프로젝트 디렉터리 구조

```text
my-development-workstation/
│
├── README.md
│
└── my-web/
    │
    ├── Dockerfile
    │
    └── site/
        │
        └── index.html
```

## 디렉터리 구성 설명

* `README.md` : 프로젝트 소개, 사용 명령어, 실행 방법 및 실습 내용을 기록한다.
* `my-web/` : 웹 서버 구축에 필요한 파일을 관리한다.
* `Dockerfile` : Nginx 기반 Docker 이미지를 생성하기 위한 설정 파일이다.
* `site/` : 웹 서버에서 제공할 HTML 파일을 저장한다.
* `index.html` : 브라우저에 표시할 메인 웹 페이지이다.

프로젝트 파일을 기능별로 분리하여 관리함으로써 파일의 위치를 쉽게 파악하고 유지보수할 수 있도록 구성하였다.

---

# 4. Linux CLI 실습

## 4-1. 작업 디렉터리 생성

Linux 터미널에서 프로젝트를 관리하기 위한 작업 공간을 생성하였다.

### 사용 명령어

```bash
mkdir -p ~/dev-workstation
cd ~/dev-workstation
pwd
```

### 명령어 설명

| 명령어     | 기능                     |
| ------- | ---------------------- |
| `mkdir` | 디렉터리 생성                |
| `-p`    | 상위 디렉터리까지 필요한 경우 함께 생성 |
| `cd`    | 디렉터리 이동                |
| `pwd`   | 현재 작업 디렉터리 확인          |

`~`는 현재 사용자의 홈 디렉터리를 의미한다.

`mkdir -p`를 사용하면 상위 디렉터리가 존재하지 않는 경우에도 필요한 디렉터리를 함께 생성할 수 있다.

### 실행 결과 예시

```text
$ mkdir -p ~/dev-workstation
$ cd ~/dev-workstation
$ pwd
/home/사용자이름/dev-workstation
```

위 출력은 명령어의 실행 결과 형식을 보여주는 예시이다. 실제 홈 디렉터리 경로는 사용자 환경에 따라 달라진다.

---

## 4-2. 파일 및 디렉터리 관리

Linux에서 파일과 디렉터리를 생성하고 목록을 확인하는 명령어를 실습하였다.

### 사용 명령어

```bash
mkdir test-folder
cd test-folder
touch test.txt
ls
ls -l
```

### 명령어 설명

| 명령어     | 기능                        |
| ------- | ------------------------- |
| `mkdir` | 디렉터리 생성                   |
| `touch` | 빈 파일 생성                   |
| `ls`    | 파일 및 디렉터리 목록 확인           |
| `ls -l` | 파일의 권한, 소유자, 크기, 수정 시간 확인 |

### 실행 결과 예시

```text
$ mkdir test-folder
$ cd test-folder
$ touch test.txt
$ ls
test.txt
```

---

## 4-3. 파일 권한 관리 - chmod

Linux에서는 파일과 디렉터리마다 접근 권한을 설정할 수 있다.

파일 권한은 읽기(Read), 쓰기(Write), 실행(Execute)으로 구분된다.

### 권한 종류

| 기호 | 권한          | 숫자 |
| -- | ----------- | -- |
| r  | 읽기(Read)    | 4  |
| w  | 쓰기(Write)   | 2  |
| x  | 실행(Execute) | 1  |
| -  | 권한 없음       | 0  |

### 권한 숫자 표기법

권한은 소유자(User), 그룹(Group), 기타 사용자(Other) 순서로 설정한다.

| 권한  | 소유자 | 그룹  | 기타 사용자 |
| --- | --- | --- | ------ |
| 777 | rwx | rwx | rwx    |
| 755 | rwx | r-x | r-x    |
| 644 | rw- | r-- | r--    |
| 600 | rw- | --- | ---    |

### chmod 644 실습

```bash
touch test.txt
chmod 644 test.txt
ls -l test.txt
```

예상 출력:

```text
-rw-r--r-- 1 user user 0 Oct 30 10:00 test.txt
```

`644`는 소유자에게 읽기와 쓰기 권한을 부여하고, 그룹과 기타 사용자에게는 읽기 권한만 부여한다.

### chmod 755 실습

```bash
chmod 755 test.txt
ls -l test.txt
```

예상 출력:

```text
-rwxr-xr-x 1 user user 0 Oct 30 10:00 test.txt
```

`755`는 소유자에게 모든 권한을 부여하고 그룹과 기타 사용자에게는 읽기 및 실행 권한을 부여한다.

실제 출력의 날짜, 사용자 이름, 파일 크기는 실행 환경에 따라 달라질 수 있다.

---

# 5. Docker 설치 및 기본 명령어 실습

## 5-1. Docker 버전 확인

Docker가 정상적으로 설치되었는지 확인한다.

```bash
docker --version
```

예상 출력 형식:

```text
Docker version XX.XX.X, build XXXXXXX
```

Docker 버전이 출력되면 Docker 명령어를 사용할 수 있는 상태이다.

## 5-2. Docker 데몬 상태 확인

Docker 데몬은 컨테이너와 이미지 관리 등 Docker의 주요 작업을 처리하는 백그라운드 서비스이다.

```bash
docker info
```

Docker 데몬이 정상적으로 작동하면 서버 정보, 컨테이너 개수, 이미지 개수, 저장 드라이버 등의 정보를 확인할 수 있다.

Docker 데몬이 실행되지 않는 경우에는 Docker Desktop 또는 Docker 서비스를 확인해야 한다.

## 5-3. Hello World 컨테이너 실행

Docker가 정상적으로 작동하는지 확인하기 위해 Hello World 이미지를 실행한다.

```bash
docker run hello-world
```

Docker는 로컬에 이미지가 없으면 Docker Hub에서 이미지를 내려받은 후 컨테이너를 생성하고 실행한다.

정상적으로 실행되면 다음과 같은 성공 메시지가 출력된다.

```text
Hello from Docker!
This message shows that your installation appears to be working correctly.
```

이 메시지는 Docker 이미지 다운로드, 컨테이너 생성 및 실행이 정상적으로 이루어졌다는 의미이다.

## 5-4. 컨테이너 목록 확인

```bash
docker ps
docker ps -a
```

| 명령어            | 기능                     |
| -------------- | ---------------------- |
| `docker ps`    | 실행 중인 컨테이너 확인          |
| `docker ps -a` | 종료된 컨테이너를 포함한 전체 목록 확인 |

`docker ps`는 현재 실행 중인 컨테이너만 보여주지만, `docker ps -a`는 종료된 컨테이너까지 확인할 수 있다.

## 5-5. Docker 이미지 목록 확인

```bash
docker images
```

Docker 이미지는 컨테이너를 생성하기 위한 템플릿이다.

이미지에는 프로그램 실행에 필요한 파일과 설정이 포함되어 있다.

예상 출력 형식:

```text
REPOSITORY   TAG       IMAGE ID       CREATED       SIZE
nginx        alpine    XXXXXXXX       ...           ...
hello-world  latest    XXXXXXXX       ...           ...
```

이미지 ID와 생성 시간, 크기는 실제 설치된 이미지에 따라 달라진다.

---

# 6. Dockerfile을 이용한 웹 서버 구축

## 6-1. Dockerfile 작성

Dockerfile은 Docker 이미지를 생성하기 위한 설정 파일이다.

본 프로젝트에서는 Nginx Alpine 이미지를 기반으로 웹 서버를 구성하였다.

### Dockerfile

```dockerfile
FROM nginx:alpine

LABEL org.opencontainers.image.title="my-development-workstation"

ENV APP_ENV=development

COPY site/ /usr/share/nginx/html/
```

### 명령어 설명

| 명령어     | 기능                  |
| ------- | ------------------- |
| `FROM`  | 기본 이미지 지정           |
| `LABEL` | 이미지 메타데이터 추가        |
| `ENV`   | 환경 변수 설정            |
| `COPY`  | 호스트의 파일을 이미지 내부로 복사 |

`nginx:alpine`은 Alpine Linux 기반의 가벼운 Nginx 이미지이다.

`COPY` 명령어를 통해 호스트의 `site/` 디렉터리에 있는 웹 페이지 파일을 컨테이너 내부의 Nginx 기본 웹 문서 디렉터리인 `/usr/share/nginx/html/`에 복사한다.

## 6-2. 웹 페이지 작성

`site/index.html` 파일을 생성하고 다음 내용을 작성한다.

```html
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Development Workstation</title>
</head>
<body>
    <h1>My Development Workstation</h1>
    <p>Docker와 Nginx를 이용한 웹 서버 구축 성공!</p>
    <p>나만의 개발자 작업실 프로젝트입니다.</p>
</body>
</html>
```

HTML 파일은 웹 서버가 브라우저에 제공할 실제 웹 페이지이다.

## 6-3. Docker 이미지 빌드

작성한 Dockerfile을 이용하여 웹 서버 이미지를 생성한다.

```bash
cd ~/dev-workstation/my-web
docker build -t my-web:1.0 .
```

### 명령어 설명

* `docker build` : Docker 이미지 생성
* `-t` : 이미지 이름과 태그 지정
* `my-web:1.0` : 생성할 이미지 이름과 버전
* `.` : 현재 디렉터리의 Dockerfile을 기준으로 빌드

### 빌드 결과 확인

```bash
docker images
```

정상적으로 빌드되면 `my-web`이라는 이름과 `1.0`이라는 태그를 가진 이미지가 생성된다.

예상 출력 형식:

```text
REPOSITORY   TAG       IMAGE ID       CREATED       SIZE
my-web       1.0       XXXXXXXX       ...           ...
```

## 6-4. 컨테이너 실행 및 포트 포워딩

생성한 Docker 이미지를 이용하여 Nginx 웹 서버 컨테이너를 실행한다.

```bash
docker run -d --name my-web-server -p 8080:80 my-web:1.0
```

### 옵션 설명

| 옵션           | 기능                           |
| ------------ | ---------------------------- |
| `-d`         | 백그라운드에서 컨테이너 실행              |
| `--name`     | 컨테이너 이름 지정                   |
| `-p 8080:80` | 호스트 8080번 포트와 컨테이너 80번 포트 연결 |

### 포트 포워딩의 필요성

Docker 컨테이너는 기본적으로 호스트와 분리된 네트워크 네임스페이스를 사용한다.

네트워크 네임스페이스는 컨테이너마다 네트워크 인터페이스와 포트 공간을 분리하여 독립적인 네트워크 환경을 제공한다.

따라서 호스트에서 컨테이너 내부의 웹 서버에 접속하려면 포트 포워딩이 필요하다.

`-p 8080:80`은 호스트의 8080번 포트로 들어온 요청을 컨테이너의 80번 포트로 전달한다.

### 실행 상태 확인

```bash
docker ps
```

정상적으로 실행되면 `my-web-server`라는 이름의 컨테이너가 목록에 표시된다.

## 6-5. 웹 서버 접속 확인

웹 브라우저에서 다음 주소로 접속한다.

```text
http://localhost:8080
```

터미널에서도 다음 명령어를 사용하여 확인할 수 있다.

```bash
curl http://localhost:8080
```

정상적으로 접속되면 HTML 문서의 내용이 출력된다.

예상 출력 내용:

```html
<h1>My Development Workstation</h1>
<p>Docker와 Nginx를 이용한 웹 서버 구축 성공!</p>
<p>나만의 개발자 작업실 프로젝트입니다.</p>
```

---

# 7. Docker Bind Mount 실습

## 7-1. Bind Mount 개념

Bind Mount는 호스트 컴퓨터의 특정 디렉터리를 컨테이너 내부의 디렉터리와 연결하는 기능이다.

호스트에서 파일을 수정하면 컨테이너 내부에서도 변경된 내용을 확인할 수 있다.

웹 페이지를 수정할 때마다 이미지를 다시 빌드하지 않아도 되므로 개발 과정에서 유용하다.

## 7-2. Bind Mount 실행

```bash
docker run -d \
  --name my-web-bind \
  -p 8081:80 \
  -v "$HOME/dev-workstation/my-web/site:/usr/share/nginx/html" \
  nginx:alpine
```

### 옵션 설명

| 설정                                  | 기능                           |
| ----------------------------------- | ---------------------------- |
| `-v`                                | 호스트 디렉터리와 컨테이너 디렉터리 연결       |
| `$HOME/dev-workstation/my-web/site` | 호스트의 웹 페이지 디렉터리              |
| `/usr/share/nginx/html`             | 컨테이너 내부의 웹 문서 디렉터리           |
| `-p 8081:80`                        | 호스트 8081번 포트와 컨테이너 80번 포트 연결 |

호스트의 절대 경로를 사용하면 실행 위치가 달라져도 동일한 디렉터리를 참조할 수 있어 재현성이 높아진다.

## 7-3. Bind Mount 동작 확인

컨테이너 실행 상태 확인:

```bash
docker ps
```

브라우저 접속:

```text
http://localhost:8081
```

호스트의 `site/index.html` 파일을 수정한 후 브라우저를 새로고침하면 변경 사항이 반영되는지 확인할 수 있다.

### Bind Mount의 특징

* 호스트 파일과 컨테이너 파일이 연결된다.
* 호스트에서 수정한 내용이 컨테이너에 반영된다.
* 개발 중 소스 코드를 수정할 때 유용하다.
* 호스트 경로가 존재해야 한다.
* 호스트 파일 시스템에 직접 의존한다.

---

# 8. Docker Volume 실습

## 8-1. Volume 개념

Volume은 Docker가 관리하는 데이터 저장 공간이다.

컨테이너 내부에 데이터를 직접 저장하면 컨테이너가 삭제될 때 데이터도 사라질 수 있다.

Volume을 사용하면 컨테이너와 데이터를 분리하여 관리할 수 있다.

따라서 컨테이너를 삭제하거나 새로 생성하더라도 Volume에 저장된 데이터는 유지할 수 있다.

## 8-2. Volume 생성

```bash
docker volume create mydata
```

생성된 Volume 목록 확인:

```bash
docker volume ls
```

특정 Volume의 상세 정보 확인:

```bash
docker volume inspect mydata
```

## 8-3. Volume을 이용한 컨테이너 실행

```bash
docker run -d \
  --name my-volume-test \
  -v mydata:/usr/share/nginx/html \
  nginx:alpine
```

### 옵션 설명

* `mydata` : Docker에서 관리하는 Volume 이름
* `/usr/share/nginx/html` : 컨테이너 내부의 저장 경로
* `-v` : Volume을 컨테이너에 연결하는 옵션

## 8-4. 컨테이너 삭제 후 데이터 유지 확인

Volume의 데이터 영속성을 확인하기 위해 테스트 파일을 생성한다.

```bash
docker exec my-volume-test sh -c "echo 'Volume Persistence Test' > /usr/share/nginx/html/test.txt"
```

파일이 정상적으로 생성되었는지 확인한다.

```bash
docker exec my-volume-test cat /usr/share/nginx/html/test.txt
```

예상 출력:

```text
Volume Persistence Test
```

기존 컨테이너 삭제:

```bash
docker rm -f my-volume-test
```

동일한 Volume을 새로운 컨테이너에 연결한다.

```bash
docker run -d \
  --name my-volume-test2 \
  -v mydata:/usr/share/nginx/html \
  nginx:alpine
```

기존 파일이 유지되는지 확인한다.

```bash
docker exec my-volume-test2 cat /usr/share/nginx/html/test.txt
```

예상 출력:

```text
Volume Persistence Test
```

동일한 내용이 출력되면 컨테이너를 삭제한 후에도 Volume에 저장된 데이터가 유지된 것이다.

이것은 컨테이너와 데이터 저장 공간이 분리되어 있기 때문에 가능한 동작이다.

실습 후 테스트 컨테이너를 정리할 수 있다.

```bash
docker rm -f my-volume-test2
```

데이터 보존을 확인하기 위해 Volume은 삭제하지 않는다.

---

# 9. Volume 백업 및 복구

Volume은 컨테이너와 별도로 데이터를 보관하지만, 데이터 손실에 대비하여 백업이 필요하다.

## 9-1. Volume 백업

백업 디렉터리를 생성한다.

```bash
mkdir -p ~/docker-backup
```

Volume 데이터를 압축 파일로 백업한다.

```bash
docker run --rm \
  -v mydata:/data \
  -v "$HOME/docker-backup:/backup" \
  alpine \
  tar czf /backup/mydata-backup.tar.gz -C /data .
```

### 명령어 설명

| 설정                           | 기능                     |
| ---------------------------- | ---------------------- |
| `--rm`                       | 작업 종료 후 임시 컨테이너 자동 삭제  |
| `-v mydata:/data`            | 백업할 Volume 연결          |
| `-v ~/docker-backup:/backup` | 호스트의 백업 디렉터리 연결        |
| `tar czf`                    | 데이터를 gzip 형식으로 압축하여 백업 |

백업 파일 확인:

```bash
ls -lh ~/docker-backup
```

## 9-2. Volume 복구

복구할 새로운 Volume을 생성한다.

```bash
docker volume create mydata-restore
```

백업 파일을 새로운 Volume에 복원한다.

```bash
docker run --rm \
  -v mydata-restore:/data \
  -v "$HOME/docker-backup:/backup" \
  alpine \
  tar xzf /backup/mydata-backup.tar.gz -C /data
```

복구된 데이터 확인:

```bash
docker run --rm \
  -v mydata-restore:/data \
  alpine \
  ls -l /data
```

백업은 데이터를 별도의 압축 파일로 보관하고, 복구는 해당 압축 파일의 내용을 새로운 Volume에 다시 저장하는 과정이다.

이러한 방법을 이용하면 컨테이너나 Volume에 문제가 발생하더라도 백업 파일을 통해 데이터를 복원할 수 있다.

---

# 10. 포트 충돌 진단 및 해결

## 10-1. 포트 충돌이란?

Docker 컨테이너를 실행할 때 이미 다른 프로그램이 사용 중인 포트를 지정하면 컨테이너 실행에 실패할 수 있다.

예를 들어 호스트의 8080번 포트를 다른 프로그램이 사용하고 있다면 Docker에서 동일한 포트를 사용할 수 없다.

## 10-2. 포트 사용 상태 확인

Linux에서 `lsof` 명령어를 이용하여 특정 포트를 사용하는 프로세스를 확인한다.

```bash
sudo lsof -i :8080
```

`lsof`가 설치되어 있지 않다면 다음 명령어로 설치할 수 있다.

```bash
sudo apt update
sudo apt install lsof
```

다른 확인 방법:

```bash
sudo ss -ltnp | grep :8080
```

### 명령어 설명

| 명령어             | 기능                      |
| --------------- | ----------------------- |
| `lsof -i :8080` | 8080 포트를 사용하는 프로세스 확인   |
| `ss -ltnp`      | TCP 포트의 대기 상태 및 프로세스 확인 |
| `grep :8080`    | 8080 포트 관련 결과 검색        |

## 10-3. Docker 컨테이너의 포트 확인

```bash
docker ps
```

실행 중인 컨테이너의 PORTS 항목을 확인하면 어떤 호스트 포트가 연결되어 있는지 알 수 있다.

필요한 경우 컨테이너를 중지한다.

```bash
docker stop my-web-server
```

더 이상 필요하지 않은 컨테이너라면 삭제한다.

```bash
docker rm my-web-server
```

## 10-4. 다른 포트 사용

기존 포트를 사용할 수 없는 경우 다른 포트로 실행할 수 있다.

```bash
docker run -d --name my-web-server -p 8082:80 my-web:1.0
```

이 경우 호스트의 8082번 포트가 컨테이너의 80번 포트로 연결된다.

브라우저 접속 주소:

```text
http://localhost:8082
```

포트를 사용하는 프로세스를 확인하지 않고 무작정 종료하면 다른 프로그램의 정상적인 작동에 영향을 줄 수 있으므로 먼저 사용 상태를 확인해야 한다.

---

# 11. Git과 GitHub를 이용한 버전 관리

## 11-1. Git 저장소 초기화

Git은 소스 코드의 변경 사항을 기록하고 관리하는 버전 관리 시스템이다.

프로젝트를 Git 저장소로 관리하기 위해 다음 명령어를 사용한다.

```bash
git init
```

Git 사용자 정보를 설정한다.

```bash
git config --global user.name "GitHub 사용자 이름"
git config --global user.email "GitHub 가입 이메일"
```

현재 저장소 상태 확인:

```bash
git status
```

## 11-2. 파일 추가 및 커밋

프로젝트 파일을 Git의 관리 대상으로 추가한다.

```bash
git add .
```

변경 사항을 커밋한다.

```bash
git commit -m "Initial project setup"
```

| 명령어          | 기능                  |
| ------------ | ------------------- |
| `git init`   | Git 저장소 초기화         |
| `git status` | 파일 변경 상태 확인         |
| `git add .`  | 변경된 파일을 스테이징 영역에 추가 |
| `git commit` | 변경 사항을 저장소에 기록      |

## 11-3. GitHub 원격 저장소 연결

GitHub에서 `my-development-workstation`이라는 이름의 원격 저장소를 생성하였다.

저장소 주소:

```text
https://github.com/konosiuda/my-development-workstation
```

원격 저장소 연결:

```bash
git remote add origin https://github.com/konosiuda/my-development-workstation.git
```

연결 상태 확인:

```bash
git remote -v
```

이미 origin이 등록되어 있는 경우 다음 명령어로 주소를 수정한다.

```bash
git remote set-url origin https://github.com/konosiuda/my-development-workstation.git
```

## 11-4. GitHub에 프로젝트 업로드

기본 브랜치를 main으로 설정한다.

```bash
git branch -M main
```

GitHub 원격 저장소에 프로젝트를 업로드한다.

```bash
git push -u origin main
```

정상적으로 업로드되면 GitHub 저장소에서 README, Dockerfile, HTML 파일 등을 확인할 수 있다.

### 원격 저장소 주소

```text
https://github.com/konosiuda/my-development-workstation
```

GitHub 저장소를 Public으로 설정하면 다른 사람도 별도의 권한 요청 없이 프로젝트 파일을 확인할 수 있다.

---

# 12. Git 및 Docker 트러블슈팅

실습 과정에서 발생할 수 있는 오류와 해결 방법을 정리하였다.

## 12-1. remote origin already exists

### 발생 오류

```text
error: remote origin already exists.
```

### 원인

이미 `origin`이라는 이름으로 원격 저장소가 등록되어 있는 상태에서 다시 추가하려고 했기 때문에 발생한다.

### 해결 방법

```bash
git remote -v
```

기존 원격 저장소 주소를 확인한 후 다음 명령어로 수정한다.

```bash
git remote set-url origin https://github.com/konosiuda/my-development-workstation.git
```

## 12-2. src refspec main does not match any

### 발생 오류

```text
error: src refspec main does not match any
```

### 원인

커밋이 생성되지 않았거나 main 브랜치가 존재하지 않는 상태에서 push를 시도했기 때문에 발생한다.

### 해결 방법

```bash
git add .
git commit -m "Initial commit"
git branch -M main
git push -u origin main
```

## 12-3. Author identity unknown

### 발생 오류

```text
Author identity unknown
```

### 원인

Git에 사용자 이름과 이메일 정보가 설정되지 않은 상태이다.

### 해결 방법

```bash
git config --global user.name "GitHub 사용자 이름"
git config --global user.email "GitHub 가입 이메일"
```

## 12-4. Repository not found

### 발생 오류

```text
remote: Repository not found.
fatal: repository not found
```

### 원인

원격 저장소 주소가 잘못되었거나 해당 저장소에 접근할 권한이 없는 경우 발생한다.

### 해결 방법

GitHub 저장소 주소를 확인한 후 다음 명령어를 사용한다.

```bash
git remote set-url origin https://github.com/konosiuda/my-development-workstation.git
```

## 12-5. GitHub 인증 오류

### 발생 상황

GitHub에 push할 때 인증이 실패하는 경우가 있다.

### 원인

GitHub는 HTTPS 방식으로 Git 작업을 수행할 때 일반 계정 비밀번호 대신 Personal Access Token(PAT) 등의 인증 방식을 사용한다.

### 해결 방법

GitHub에서 발급한 토큰을 인증에 사용한다.

토큰은 비밀번호와 동일하게 취급해야 하며 README나 공개 저장소에 기록하지 않는다.

## 12-6. fetch first 오류

### 발생 오류

```text
! [rejected] main -> main (fetch first)
```

### 원인

원격 저장소에 로컬 저장소에 없는 커밋이 존재하기 때문에 발생한다.

### 해결 방법

원격 저장소의 변경 사항을 먼저 가져온 후 병합한다.

```bash
git pull --no-rebase origin main --allow-unrelated-histories
```

병합이 완료되면 다시 업로드한다.

```bash
git push -u origin main
```

## 12-7. Docker 포트 충돌

### 발생 상황

Docker 컨테이너 실행 시 포트를 이미 사용 중이라는 오류가 발생할 수 있다.

### 원인

호스트 컴퓨터의 동일한 포트를 다른 프로그램이나 컨테이너가 사용하고 있기 때문이다.

### 해결 방법

```bash
sudo lsof -i :8080
```

또는

```bash
sudo ss -ltnp | grep :8080
```

사용 중인 프로그램을 확인한 후 다른 포트를 지정한다.

```bash
docker run -d --name my-web-server -p 8082:80 my-web:1.0
```

---

# 13. Docker 이미지와 컨테이너의 차이

Docker 이미지와 컨테이너는 서로 다른 개념이다.

| 구분 | 이미지(Image)      | 컨테이너(Container) |
| -- | --------------- | --------------- |
| 개념 | 컨테이너 생성을 위한 템플릿 | 이미지로 생성한 실행 환경  |
| 상태 | 기본적으로 정적인 파일    | 실행 및 중지 가능      |
| 역할 | 프로그램과 실행 환경 제공  | 실제 프로그램 실행      |
| 예시 | `my-web:1.0`    | `my-web-server` |

### 동작 과정

1. Dockerfile 작성
2. Dockerfile을 이용한 이미지 빌드
3. 이미지를 이용한 컨테이너 생성
4. 컨테이너에서 웹 서버 실행
5. 컨테이너 내부의 변경 사항은 이미지 자체에 자동으로 저장되지 않음

컨테이너 내부에서 파일을 수정하더라도 원본 이미지는 변경되지 않는다.

컨테이너를 삭제하면 컨테이너 내부에만 저장한 변경 사항은 사라질 수 있다.

따라서 지속적으로 보관해야 하는 데이터는 Bind Mount 또는 Volume을 사용하는 것이 좋다.

---

# 14. Bind Mount와 Volume의 차이

| 구분    | Bind Mount        | Volume             |
| ----- | ----------------- | ------------------ |
| 저장 위치 | 호스트에서 지정한 경로      | Docker가 관리하는 저장 공간 |
| 관리 주체 | 사용자               | Docker             |
| 사용 목적 | 호스트와 컨테이너 간 파일 공유 | 데이터 영속성 확보         |
| 경로 지정 | 호스트 경로 필요         | Volume 이름 사용       |
| 활용 예시 | 웹 개발 파일 수정        | 데이터베이스 및 지속 데이터 저장 |

Bind Mount는 개발 중 소스 코드를 수정하고 즉시 반영해야 하는 상황에 적합하다.

Volume은 컨테이너를 삭제하거나 다시 생성하더라도 데이터를 유지해야 하는 상황에 적합하다.

---

# 15. 프로젝트 실행 방법

프로젝트를 처음부터 실행하려면 다음 순서대로 진행한다.

### 1단계. 프로젝트 저장소 다운로드

```bash
git clone https://github.com/konosiuda/my-development-workstation.git
```

### 2단계. 웹 프로젝트 디렉터리 이동

```bash
cd my-development-workstation/my-web
```

### 3단계. Docker 이미지 빌드

```bash
docker build -t my-web:1.0 .
```

### 4단계. 컨테이너 실행

```bash
docker run -d --name my-web-server -p 8080:80 my-web:1.0
```

### 5단계. 실행 상태 확인

```bash
docker ps
```

### 6단계. 웹 브라우저 접속

```text
http://localhost:8080
```

정상적으로 실행되면 프로젝트에서 작성한 HTML 웹 페이지가 표시된다.

---

# 16. 프로젝트를 통해 배운 점

이번 프로젝트를 통해 Linux 명령어를 이용한 기본적인 파일 및 디렉터리 관리 방법과 파일 권한 설정 방법을 학습하였다.

Docker를 이용하여 이미지를 생성하고 컨테이너를 실행하면서 이미지와 컨테이너의 차이를 이해할 수 있었다.

또한 Nginx 웹 서버를 직접 구축하고 포트 포워딩을 설정하여 브라우저에서 웹 페이지에 접속하는 과정을 경험하였다.

Bind Mount와 Volume을 통해 컨테이너와 호스트의 데이터를 연결하고, 컨테이너가 삭제되더라도 데이터를 유지할 수 있는 방법을 학습하였다.

Volume 백업과 복구 과정을 통해 데이터 영속성뿐만 아니라 데이터 손실에 대비하는 방법도 이해할 수 있었다.

마지막으로 Git과 GitHub를 이용하여 프로젝트를 버전 관리하고 원격 저장소에 업로드하는 방법을 익혔다.

이번 프로젝트는 단순히 명령어를 입력하는 것에서 끝나는 것이 아니라 개발 환경을 직접 구성하고 발생한 문제를 해결하는 경험을 할 수 있었다는 점에서 의미가 있었다.

---

# 17. GitHub 저장소

**프로젝트 저장소**

https://github.com/konosiuda/my-development-workstation

**프로젝트 실행 주소**

http://localhost:8080

※ localhost 주소는 프로젝트를 실행하는 본인의 컴퓨터에서만 접속할 수 있다.

---

# 18. 결론

본 프로젝트를 통해 Linux CLI, Docker, Nginx, Git 및 GitHub의 기본적인 사용 방법을 학습하고 실제 개발 환경을 구성하였다.

특히 Docker 이미지 빌드와 컨테이너 실행, 포트 포워딩, Bind Mount, Volume을 이용한 데이터 관리 과정을 통해 컨테이너 기반 개발 환경의 기본 원리를 이해하였다.

또한 GitHub를 이용한 원격 저장소 관리와 문제 해결 과정을 통해 실제 개발 환경에서 필요한 기초적인 협업 및 버전 관리 능력을 익힐 수 있었다.

앞으로도 이번 프로젝트에서 학습한 내용을 바탕으로 다양한 개발 도구와 기술을 활용하여 개발 환경을 확장해 나가고자 한다.


