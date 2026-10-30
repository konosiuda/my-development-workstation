# 🖥️ 나만의 개발자 작업실 만들기

### Linux CLI · Docker · Nginx · Git & GitHub

---

## 1. 프로젝트 소개

본 프로젝트는 Linux CLI와 Docker를 활용하여 개발 환경을 구축하고, Nginx 웹 서버를 실행하며, Git과 GitHub를 이용하여 프로젝트를 관리하는 것을 목표로 한다.

Linux 명령어를 이용한 파일 및 디렉터리 관리, 파일 권한 설정, Docker 이미지 빌드, 컨테이너 실행, 포트 포워딩, Bind Mount, Volume, 데이터 백업 및 복구 등의 기능을 학습한다.

또한 Git을 이용한 버전 관리와 GitHub 원격 저장소 연결을 통해 프로젝트를 관리하는 기본적인 개발 과정을 경험한다.

### 프로젝트 목표

* Linux CLI를 이용한 파일 및 디렉터리 관리
* chmod를 이용한 파일 권한 설정과 확인
* Docker 설치 및 데몬 상태 확인
* Docker 이미지 생성 및 컨테이너 실행
* Nginx 웹 서버 구축 및 접속 확인
* 포트 포워딩과 네트워크 네임스페이스 이해
* Bind Mount를 이용한 호스트와 컨테이너 간 파일 공유
* Volume을 이용한 데이터 영속성 확인
* Volume 백업 및 복구
* 포트 충돌 진단과 해결 방법 이해
* Git과 GitHub를 이용한 버전 관리 및 원격 저장소 관리

---

## 2. 개발 환경

| 항목       | 내용                 |
| -------- | ------------------ |
| 운영체제     | Windows            |
| Linux 환경 | Ubuntu / WSL       |
| 개발 도구    | Visual Studio Code |
| 컨테이너 플랫폼 | Docker             |
| 웹 서버     | Nginx              |
| 기본 이미지   | nginx:alpine       |
| 버전 관리    | Git                |
| 원격 저장소   | GitHub             |
| 웹 문서     | HTML               |

---

## 3. 프로젝트 디렉터리 구조

```text
my-development-workstation/
│
├── README.md
│
└── my-web/
    ├── Dockerfile
    └── site/
        └── index.html
```

### 디렉터리 및 파일의 역할

| 경로                       | 역할                             |
| ------------------------ | ------------------------------ |
| `README.md`              | 프로젝트 소개, 실행 절차, 명령어 및 기술 개념 기록 |
| `my-web/`                | 웹 서버 구축에 필요한 파일 관리             |
| `my-web/Dockerfile`      | Docker 이미지 생성 설정               |
| `my-web/site/`           | 웹 서버에서 제공할 웹 문서 보관             |
| `my-web/site/index.html` | 브라우저에 표시할 HTML 웹 페이지           |

파일을 기능별로 구분하면 설정 파일과 웹 문서를 쉽게 관리할 수 있으며, 프로젝트 구조를 단순하게 유지할 수 있다.

### 디렉터리 구조 확인

프로젝트 최상위 디렉터리에서 다음 명령어를 사용할 수 있다.

```bash
pwd
find . -maxdepth 3 -type f
```

예상되는 파일 목록의 형식은 다음과 같다.

```text
./README.md
./my-web/Dockerfile
./my-web/site/index.html
```

실제 출력은 명령어를 실행한 위치와 프로젝트 파일 구성에 따라 달라진다.

---

# 4. Linux CLI 실습

## 4-1. 작업 디렉터리 생성 및 이동

Linux에서 작업 디렉터리를 생성하고 현재 위치를 확인한다.

```bash
mkdir -p ~/dev-workstation
cd ~/dev-workstation
pwd
```

### 명령어 설명

* `mkdir`: 디렉터리를 생성한다.
* `-p`: 필요한 상위 디렉터리를 함께 생성한다.
* `cd`: 지정한 디렉터리로 이동한다.
* `pwd`: 현재 작업 디렉터리의 절대 경로를 출력한다.
* `~`: 현재 사용자의 홈 디렉터리를 나타낸다.

### 결과 확인

`pwd`의 출력은 일반적으로 다음 형태이다.

```text
/home/사용자이름/dev-workstation
```

사용자 이름과 홈 디렉터리의 위치는 시스템에 따라 다를 수 있다.

정상적인 결과라면 출력된 경로가 생성한 작업 디렉터리를 가리켜야 한다.

## 4-2. 파일과 디렉터리 생성

```bash
mkdir test-folder
cd test-folder
touch test.txt
ls
ls -l
```

### 명령어 설명

| 명령어                 | 설명                  |
| ------------------- | ------------------- |
| `mkdir test-folder` | test-folder 디렉터리 생성 |
| `cd test-folder`    | 해당 디렉터리로 이동         |
| `touch test.txt`    | 빈 파일 생성             |
| `ls`                | 파일 목록 확인            |
| `ls -l`             | 파일의 상세 정보 확인        |

예상되는 `ls` 출력:

```text
test.txt
```

`ls -l`은 파일 권한, 하드 링크 수, 소유자, 그룹, 크기, 수정 시간, 이름을 보여준다.

## 4-3. 파일 권한 설정 - chmod

Linux의 파일 권한은 읽기(Read), 쓰기(Write), 실행(Execute)으로 구분한다.

| 기호 | 권한    | 숫자 |
| -- | ----- | -: |
| r  | 읽기    |  4 |
| w  | 쓰기    |  2 |
| x  | 실행    |  1 |
| -  | 권한 없음 |  0 |

### 권한 숫자 계산 방법

각 권한의 숫자를 더하여 한 자리의 권한 값으로 만든다.

* `rwx` = 4 + 2 + 1 = 7
* `rw-` = 4 + 2 + 0 = 6
* `r-x` = 4 + 0 + 1 = 5
* `r--` = 4 + 0 + 0 = 4

권한은 소유자, 그룹, 기타 사용자 순서로 지정한다.

따라서 `755`는 소유자에게 7, 그룹에 5, 기타 사용자에게 5를 부여한다.

### 주요 권한 비교

| 권한    | 소유자      | 그룹       | 기타 사용자   |
| ----- | -------- | -------- | -------- |
| `777` | 읽기·쓰기·실행 | 읽기·쓰기·실행 | 읽기·쓰기·실행 |
| `755` | 읽기·쓰기·실행 | 읽기·실행    | 읽기·실행    |
| `644` | 읽기·쓰기    | 읽기       | 읽기       |
| `600` | 읽기·쓰기    | 권한 없음    | 권한 없음    |

### 644 권한 적용

```bash
touch test.txt
chmod 644 test.txt
ls -l test.txt
```

정상적으로 적용되면 권한 부분은 다음과 같은 형태로 표시된다.

```text
-rw-r--r--
```

이 권한은 소유자에게 읽기와 쓰기를 허용하고, 그룹과 기타 사용자에게 읽기만 허용한다.

### 755 권한 적용

```bash
chmod 755 test.txt
ls -l test.txt
```

정상적으로 적용되면 권한 부분은 다음과 같은 형태로 표시된다.

```text
-rwxr-xr-x
```

소유자에게 읽기, 쓰기, 실행 권한을 부여하고 그룹과 기타 사용자에게 읽기 및 실행 권한을 부여한다.

### 검증 기준

* `chmod 644` 적용 후 권한 부분이 `-rw-r--r--`인지 확인한다.
* `chmod 755` 적용 후 권한 부분이 `-rwxr-xr-x`인지 확인한다.
* `ls -l` 출력의 파일 이름이 `test.txt`인지 확인한다.

파일 크기, 날짜, 소유자 이름은 환경에 따라 달라질 수 있다.

---

# 5. Docker 설치 및 기본 실습

## 5-1. Docker 버전 확인

```bash
docker --version
```

Docker가 설치되어 있다면 버전 정보가 출력된다.

예상 출력 형식:

```text
Docker version XX.XX.X, build XXXXXXX
```

버전 문자열은 설치된 Docker 버전에 따라 달라진다.

이 명령어는 Docker CLI의 설치 여부를 확인하지만, Docker 데몬이 정상적으로 실행 중인지까지 보장하지는 않는다.

## 5-2. Docker 데몬 확인

```bash
docker info
```

Docker 데몬이 정상적으로 응답하면 서버 정보, 컨테이너 수, 이미지 수, 저장 드라이버 등의 정보를 확인할 수 있다.

### 검증 기준

* Docker Client와 Server 관련 정보가 정상적으로 출력되는지 확인한다.
* 서버 정보를 불러오지 못하면 Docker Desktop 또는 Docker 데몬의 실행 상태를 확인한다.
* 권한 오류가 발생하면 현재 사용자에게 Docker 사용 권한이 있는지 확인한다.

## 5-3. Hello World 컨테이너 실행

```bash
docker run hello-world
```

이 명령어는 Docker의 기본 동작을 확인하기 위한 테스트이다.

로컬에 이미지가 없으면 Docker는 이미지를 내려받은 후 컨테이너를 생성하고 실행한다.

정상 실행 시 다음과 같은 성공 메시지가 출력된다.

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

| 명령어            | 확인 대상            |
| -------------- | ---------------- |
| `docker ps`    | 실행 중인 컨테이너       |
| `docker ps -a` | 실행 및 종료된 전체 컨테이너 |

`docker ps`는 실행 중인 컨테이너만 표시하므로 종료된 컨테이너를 확인하려면 `docker ps -a`를 사용한다.

## 5-5. 이미지 목록 확인

```bash
docker images
```

Docker 이미지의 저장소 이름, 태그, 이미지 ID, 생성 시점 및 크기를 확인할 수 있다.

### 검증 기준

* `hello-world` 실행 후 이미지 목록에서 해당 이미지가 표시되는지 확인한다.
* 웹 서버 이미지를 빌드한 후 `my-web` 이미지가 목록에 표시되는지 확인한다.
* `docker ps -a`에서 테스트 컨테이너의 실행 또는 종료 상태를 확인한다.

---

# 6. Dockerfile을 이용한 Nginx 웹 서버 구축

## 6-1. Dockerfile

```dockerfile
FROM nginx:alpine

LABEL org.opencontainers.image.title="my-development-workstation"

ENV APP_ENV=development

COPY site/ /usr/share/nginx/html/
```

### 명령어 설명

| 명령어     | 기능                 |
| ------- | ------------------ |
| `FROM`  | 기본 이미지 지정          |
| `LABEL` | 이미지에 메타데이터 추가      |
| `ENV`   | 환경 변수 설정           |
| `COPY`  | 호스트 파일을 이미지 내부로 복사 |

`nginx:alpine`은 Alpine Linux 기반의 Nginx 이미지이다.

`COPY` 명령어는 `site/` 디렉터리의 내용을 컨테이너 이미지 내부의 Nginx 웹 문서 경로로 복사한다.

Dockerfile을 실행하려면 빌드 컨텍스트에 `site/index.html` 파일이 존재해야 한다.

## 6-2. HTML 웹 페이지

파일 경로:

```text
my-web/site/index.html
```

내용:

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

## 6-3. Docker 이미지 빌드

```bash
cd ~/dev-workstation/my-web
docker build -t my-web:1.0 .
```

### 명령어 설명

* `docker build`: 이미지를 생성한다.
* `-t my-web:1.0`: 이미지 이름과 태그를 지정한다.
* `.`: 현재 디렉터리를 빌드 컨텍스트로 사용한다.

### 빌드 성공 확인

```bash
docker images
```

이미지 목록에 `my-web` 저장소와 `1.0` 태그가 표시되면 해당 이름의 이미지가 생성된 것이다.

빌드 로그에서는 Dockerfile 단계가 오류 없이 완료되었는지 확인한다.

빌드 로그는 Docker 버전에 따라 `Step`, `RUN`, `COPY`, `exporting to image` 등 서로 다른 형식으로 표시될 수 있다.

## 6-4. 컨테이너 실행

```bash
docker run -d --name my-web-server -p 8080:80 my-web:1.0
```

### 옵션 설명

| 옵션                     | 의미                            |
| ---------------------- | ----------------------------- |
| `-d`                   | 백그라운드 실행                      |
| `--name my-web-server` | 컨테이너 이름 지정                    |
| `-p 8080:80`           | 호스트 8080번 포트를 컨테이너 80번 포트에 연결 |
| `my-web:1.0`           | 실행할 이미지 지정                    |

실행 후 상태를 확인한다.

```bash
docker ps
```

정상 실행 시 `my-web-server`가 컨테이너 목록에 표시되며, PORTS 항목에서 호스트 포트와 컨테이너 포트의 연결을 확인할 수 있다.

## 6-5. 웹 서버 접속 확인

```bash
curl -i http://localhost:8080
```

정상적인 HTTP 응답이라면 응답 헤더에 다음과 같은 상태 코드가 표시된다.

```text
HTTP/1.1 200 OK
```

이후 HTML 응답 본문에 `My Development Workstation`이라는 제목과 작성한 문구가 포함되어 있는지 확인한다.

### 접속 흐름

1. 브라우저 또는 curl이 호스트의 8080번 포트로 요청한다.
2. Docker의 포트 매핑이 요청을 컨테이너의 80번 포트로 전달한다.
3. Nginx가 `index.html` 파일을 읽는다.
4. Nginx가 HTTP 응답으로 HTML 문서를 반환한다.
5. 브라우저가 HTML 문서를 표시한다.

이 과정은 포트 포워딩이 호스트와 컨테이너 사이의 네트워크 연결을 제공하는 원리를 보여준다.

---

# 7. Bind Mount 실습

## 7-1. 개념

Bind Mount는 호스트의 특정 경로를 컨테이너 내부의 경로와 연결하는 기능이다.

호스트의 파일을 수정하면 컨테이너 내부에서도 변경된 파일을 확인할 수 있다.

개발 중 웹 문서를 자주 수정할 때 유용하다.

## 7-2. 컨테이너 실행

```bash
docker run -d \
  --name my-web-bind \
  -p 8081:80 \
  -v "$HOME/dev-workstation/my-web/site:/usr/share/nginx/html" \
  nginx:alpine
```

### 설정 설명

* 호스트 경로: `$HOME/dev-workstation/my-web/site`
* 컨테이너 경로: `/usr/share/nginx/html`
* 호스트 포트: `8081`
* 컨테이너 포트: `80`

호스트에서 관리하는 HTML 파일을 컨테이너의 웹 문서 경로에 직접 연결한다.

## 7-3. 접속 및 변경 확인

컨테이너 상태 확인:

```bash
docker ps
```

브라우저 또는 curl 접속:

```bash
curl -i http://localhost:8081
```

호스트에서 `site/index.html` 파일을 수정한 뒤 다시 요청하면 수정된 내용이 반환되는지 확인할 수 있다.

### 절대 경로와 상대 경로

Bind Mount에서는 호스트 경로를 정확하게 지정해야 한다.

절대 경로를 사용하면 실행 위치가 달라져도 동일한 경로를 참조할 수 있다.

반면 상대 경로는 현재 작업 디렉터리에 따라 다른 위치를 가리킬 수 있으므로, 잘못된 경로를 연결하거나 예상하지 못한 파일을 마운트하는 문제가 발생할 수 있다.

따라서 재현성이 중요한 실습에서는 절대 경로를 사용하는 것이 좋다.

---

# 8. Docker Volume 실습

## 8-1. 개념

Volume은 Docker가 관리하는 데이터 저장 공간이다.

컨테이너를 삭제하면 컨테이너 내부에만 저장된 데이터는 사라질 수 있지만, 별도의 Volume에 저장된 데이터는 컨테이너와 독립적으로 유지할 수 있다.

## 8-2. Volume 생성

```bash
docker volume create mydata
docker volume ls
docker volume inspect mydata
```

각 명령어의 역할은 다음과 같다.

* `docker volume create`: Volume 생성
* `docker volume ls`: Volume 목록 확인
* `docker volume inspect`: 특정 Volume의 상세 정보 확인

## 8-3. Volume 연결

```bash
docker run -d \
  --name my-volume-test \
  -v mydata:/usr/share/nginx/html \
  nginx:alpine
```

이 명령어는 `mydata` Volume을 컨테이너 내부의 웹 문서 디렉터리에 연결한다.

## 8-4. 데이터 생성 및 확인

테스트 파일을 생성한다.

```bash
docker exec my-volume-test sh -c "echo 'Volume Persistence Test' > /usr/share/nginx/html/test.txt"
```

파일의 내용을 확인한다.

```bash
docker exec my-volume-test cat /usr/share/nginx/html/test.txt
```

정상적인 경우 다음 내용이 출력된다.

```text
Volume Persistence Test
```

## 8-5. 컨테이너 삭제 후 데이터 확인

기존 컨테이너를 삭제한다.

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

기존 파일을 확인한다.

```bash
docker exec my-volume-test2 cat /usr/share/nginx/html/test.txt
```

정상적인 경우 다음 내용이 다시 출력된다.

```text
Volume Persistence Test
```

이 결과를 통해 데이터가 컨테이너 자체가 아닌 Volume에 저장되었음을 확인할 수 있다.

실습이 끝난 후 테스트 컨테이너를 정리할 수 있다.

```bash
docker rm -f my-volume-test2
```

데이터 유지 여부를 확인하기 위해 Volume 자체는 삭제하지 않는다.

---

# 9. Volume 백업 및 복구

## 9-1. 백업의 필요성

Volume은 컨테이너와 분리되어 데이터를 보관하지만, 실수로 삭제하거나 데이터가 손상되는 상황에 대비하여 백업이 필요하다.

## 9-2. Volume 백업

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

백업 파일을 확인한다.

```bash
ls -lh ~/docker-backup
```

### 명령어 설명

* `--rm`: 작업 종료 후 임시 컨테이너 자동 삭제
* `-v mydata:/data`: 백업할 Volume 연결
* `-v "$HOME/docker-backup:/backup"`: 호스트의 백업 디렉터리 연결
* `tar czf`: 데이터를 gzip 형식으로 압축하여 백업

## 9-3. Volume 복구

복구용 Volume을 생성한다.

```bash
docker volume create mydata-restore
```

백업 파일을 복구용 Volume에 압축 해제한다.

```bash
docker run --rm \
  -v mydata-restore:/data \
  -v "$HOME/docker-backup:/backup" \
  alpine \
  tar xzf /backup/mydata-backup.tar.gz -C /data
```

복구 결과를 확인한다.

```bash
docker run --rm \
  -v mydata-restore:/data \
  alpine \
  ls -l /data
```

백업 파일이 정상적으로 존재하고 압축 해제가 완료되었다면 복구된 파일 목록을 확인할 수 있다.

---

# 10. 포트 충돌 진단 및 해결

## 10-1. 포트 충돌의 원인

호스트의 특정 포트를 다른 프로그램이나 컨테이너가 이미 사용하고 있다면 Docker 컨테이너 실행이 실패할 수 있다.

예를 들어 8080번 포트가 사용 중이라면 같은 호스트 포트를 새 컨테이너에 할당할 수 없다.

## 10-2. 포트 사용 상태 확인

```bash
sudo lsof -i :8080
```

또는 다음 명령어를 사용한다.

```bash
sudo ss -ltnp | grep :8080
```

`lsof`가 설치되어 있지 않은 경우:

```bash
sudo apt update
sudo apt install lsof
```

Docker 컨테이너의 포트 연결은 다음 명령어로 확인한다.

```bash
docker ps
```

## 10-3. 충돌 해결

사용 중인 포트가 Docker 컨테이너에 연결되어 있고 해당 컨테이너가 더 이상 필요하지 않다면 다음과 같이 처리할 수 있다.

```bash
docker stop my-web-server
```

컨테이너를 삭제해야 하는 경우:

```bash
docker rm my-web-server
```

컨테이너를 유지해야 한다면 다른 호스트 포트를 사용한다.

```bash
docker run -d --name my-web-server -p 8082:80 my-web:1.0
```

접속 주소:

```text
http://localhost:8082
```

### 주의 사항

프로세스를 종료하기 전에 해당 프로세스가 어떤 프로그램인지 확인해야 한다.

다른 프로그램이 사용하는 포트를 무작정 해제하면 해당 프로그램의 작동에 영향을 줄 수 있다.

---

# 11. Git과 GitHub를 이용한 버전 관리

## 11-1. Git 저장소 초기화

```bash
git init
git status
```

Git은 프로젝트 파일의 변경 사항을 기록하고 관리하는 버전 관리 시스템이다.

## 11-2. Git 사용자 정보 설정

```bash
git config --global user.name "GitHub 사용자 이름"
git config --global user.email "GitHub 가입 이메일"
```

Git 사용자 정보는 커밋 작성자를 표시하는 데 사용된다.

## 11-3. 파일 추가 및 커밋

```bash
git add .
git commit -m "Initial project setup"
```

* `git add .`: 변경 파일을 스테이징 영역에 추가한다.
* `git commit`: 스테이징 영역의 변경 사항을 커밋으로 기록한다.

## 11-4. 원격 저장소 연결

프로젝트 저장소:

`https://github.com/konosiuda/my-development-workstation`

원격 저장소 연결:

```bash
git remote add origin https://github.com/konosiuda/my-development-workstation.git
```

이미 `origin`이 등록되어 있다면 다음 명령어를 사용한다.

```bash
git remote set-url origin https://github.com/konosiuda/my-development-workstation.git
```

연결 상태 확인:

```bash
git remote -v
```

예상 출력 형식:

```text
origin  https://github.com/konosiuda/my-development-workstation.git (fetch)
origin  https://github.com/konosiuda/my-development-workstation.git (push)
```

## 11-5. GitHub에 업로드

```bash
git branch -M main
git push -u origin main
```

업로드 성공 여부는 터미널의 push 결과와 GitHub 저장소의 파일 목록을 통해 확인할 수 있다.

### 검증 기준

* `git remote -v`에서 올바른 원격 저장소 주소가 표시되는가?
* `git status`에서 커밋할 변경 사항이 남아 있는가?
* `git push`가 오류 없이 완료되는가?
* GitHub 저장소에서 README, Dockerfile, HTML 파일을 확인할 수 있는가?

GitHub 인증 과정에서 토큰이 필요할 수 있다. 토큰은 비밀번호와 동일하게 취급하며 README 또는 공개 저장소에 기록하지 않는다.

---

# 12. Git 및 Docker 트러블슈팅

## 12-1. remote origin already exists

### 오류

```text
error: remote origin already exists.
```

### 원인

`origin`이라는 원격 저장소가 이미 등록되어 있는 상태에서 다시 추가하려고 했다.

### 해결

```bash
git remote -v
git remote set-url origin https://github.com/konosiuda/my-development-workstation.git
```

## 12-2. src refspec main does not match any

### 오류

```text
error: src refspec main does not match any
```

### 원인

커밋이 없거나 main 브랜치가 생성되지 않은 상태에서 push를 시도했다.

### 해결

```bash
git add .
git commit -m "Initial commit"
git branch -M main
git push -u origin main
```

## 12-3. Author identity unknown

### 오류

```text
Author identity unknown
```

### 원인

Git 사용자 이름 또는 이메일이 설정되지 않았다.

### 해결

```bash
git config --global user.name "GitHub 사용자 이름"
git config --global user.email "GitHub 가입 이메일"
```

## 12-4. Repository not found

### 오류

```text
remote: Repository not found.
fatal: repository not found
```

### 원인

저장소 주소가 잘못되었거나 접근 권한이 없는 경우 발생한다.

### 해결

```bash
git remote set-url origin https://github.com/konosiuda/my-development-workstation.git
```

저장소가 실제로 존재하는지, 계정에 접근 권한이 있는지도 확인한다.

## 12-5. GitHub 인증 오류

### 원인

HTTPS를 통한 Git 작업에서 일반 계정 비밀번호를 사용하면 인증이 실패할 수 있다.

### 해결

GitHub에서 지원하는 인증 방식이나 Personal Access Token을 사용한다.

토큰은 공개 저장소나 README에 기록하지 않는다.

## 12-6. fetch first

### 오류

```text
! [rejected] main -> main (fetch first)
```

### 원인

원격 저장소에 로컬 저장소에 없는 커밋이 존재한다.

### 해결

```bash
git pull --no-rebase origin main --allow-unrelated-histories
git push -u origin main
```

병합 충돌이 발생하면 충돌 파일을 수정하고 커밋한 후 push해야 한다.

## 12-7. Docker 포트 충돌

### 원인

호스트 포트를 다른 프로세스가 사용하고 있다.

### 해결

```bash
sudo lsof -i :8080
sudo ss -ltnp | grep :8080
docker ps
```

사용 상태를 확인한 후 다른 포트로 실행한다.

```bash
docker run -d --name my-web-server -p 8082:80 my-web:1.0
```

---

# 13. Docker 이미지와 컨테이너의 차이

| 구분 | 이미지              | 컨테이너             |
| -- | ---------------- | ---------------- |
| 개념 | 실행 환경을 구성하는 템플릿  | 이미지로 생성한 실행 인스턴스 |
| 역할 | 프로그램과 실행 환경 제공   | 실제 프로그램 실행       |
| 상태 | 컨테이너 실행 전의 기반 파일 | 실행, 중지 및 삭제 가능   |
| 예시 | `my-web:1.0`     | `my-web-server`  |

### 실행 흐름

1. Dockerfile을 작성한다.
2. Dockerfile로 이미지를 빌드한다.
3. 이미지로 컨테이너를 생성한다.
4. 컨테이너에서 Nginx를 실행한다.
5. 컨테이너의 변경 사항은 이미지에 자동으로 반영되지 않는다.

### 차이를 확인하는 명령어

```bash
docker images
docker ps -a
```

`docker images`는 이미지를 확인하고, `docker ps -a`는 컨테이너를 확인한다.

컨테이너 내부에서 변경한 파일은 별도의 저장 작업을 하지 않는 한 원본 이미지에 자동으로 반영되지 않는다.

따라서 컨테이너를 삭제한 후에도 유지해야 하는 데이터는 Volume 또는 Bind Mount를 사용하는 것이 좋다.

---

# 14. 네트워크 네임스페이스와 포트 포워딩

Docker 컨테이너는 기본적으로 호스트와 분리된 네트워크 네임스페이스를 사용한다.

네트워크 네임스페이스는 컨테이너마다 네트워크 인터페이스와 포트 공간을 분리하여 독립적인 네트워크 환경을 제공한다.

### 포트 연결 예시

```bash
docker run -d --name my-web-server -p 8080:80 my-web:1.0
```

연결 흐름:

```text
브라우저 또는 curl
        |
        v
호스트 localhost:8080
        |
        v
Docker 포트 매핑
        |
        v
컨테이너 포트 80
        |
        v
Nginx 웹 서버
        |
        v
HTML 응답
```

접속 확인:

```bash
curl -i http://localhost:8080
```

HTTP 상태 코드 `200 OK`가 반환되고 HTML 내용이 표시되면 웹 서버가 요청에 정상적으로 응답한 것이다.

---

# 15. 프로젝트 재현 절차

다른 환경에서도 프로젝트를 실행할 수 있도록 재현 절차를 정리하였다.

## 1단계. 저장소 다운로드

```bash
git clone https://github.com/konosiuda/my-development-workstation.git
```

## 2단계. 웹 프로젝트 디렉터리 이동

```bash
cd my-development-workstation/my-web
```

## 3단계. 이미지 빌드

```bash
docker build -t my-web:1.0 .
```

## 4단계. 컨테이너 실행

```bash
docker run -d --name my-web-server -p 8080:80 my-web:1.0
```

## 5단계. 컨테이너 상태 확인

```bash
docker ps
```

## 6단계. 웹 서버 응답 확인

```bash
curl -i http://localhost:8080
```

정상적으로 실행되면 작성한 HTML 문서가 HTTP 응답으로 반환된다.

이미 같은 이름의 컨테이너가 존재한다면 실행 전에 기존 컨테이너를 확인해야 한다.

```bash
docker ps -a
```

더 이상 필요하지 않은 기존 컨테이너만 선택하여 정리한다.

---

# 16. 실행 결과를 텍스트로 검증하는 방법

스크린샷이 없는 경우 명령어의 실행 결과를 텍스트로 기록하면 검토자가 명령어와 예상 결과를 비교할 수 있다.

다음 명령어들은 실행 상태를 확인하는 데 사용할 수 있다.

```bash
pwd
ls -l test.txt
docker --version
docker info
docker run hello-world
docker ps -a
docker images
docker ps
curl -i http://localhost:8080
docker volume ls
git remote -v
git status
```

명령어의 출력은 환경에 따라 달라지므로 실제로 실행한 결과를 그대로 기록해야 한다.

예를 들어 웹 서버 접속 결과를 기록할 때는 다음 항목을 확인한다.

* HTTP 상태 코드
* 응답 헤더
* 반환된 HTML 내용
* 요청 대상 주소

GitHub 업로드 결과를 기록할 때는 다음 항목을 확인한다.

* 원격 저장소 주소
* 현재 브랜치
* push 성공 여부
* GitHub에 실제로 업로드된 파일

이러한 텍스트 기록은 실행 상태를 확인하는 데 도움이 되지만, 실행하지 않은 명령어의 예상 출력을 실제 실행 로그로 표시해서는 안 된다.

---

# 17. 프로젝트를 통해 배운 점

이번 프로젝트를 통해 Linux CLI를 이용한 파일 및 디렉터리 관리, 파일 권한 설정, Docker 이미지 빌드 및 컨테이너 실행 방법을 학습하였다.

Nginx 웹 서버를 직접 구축하고 포트 포워딩을 설정하면서 호스트와 컨테이너 사이의 네트워크 연결 과정을 이해하였다.

Bind Mount와 Volume을 비교하면서 호스트 파일 공유와 데이터 영속성의 차이를 학습하였다.

또한 Volume 백업 및 복구 절차를 통해 컨테이너와 데이터를 분리하여 관리하는 이유를 이해하였다.

Git과 GitHub를 활용하여 프로젝트 파일을 버전 관리하고 원격 저장소에 업로드하는 방법도 익혔다.

실습 과정에서 발생할 수 있는 원격 저장소 연결 오류, Git 인증 오류, 포트 충돌 등의 문제를 원인과 해결 방법에 따라 정리하였다.

---

# 18. GitHub 저장소

**프로젝트 저장소**

https://github.com/konosiuda/my-development-workstation

**로컬 웹 서버 주소**

http://localhost:8080

`localhost` 주소는 웹 서버를 실행하는 컴퓨터에서만 접속할 수 있으며, 다른 사람이 원격으로 접속할 수 있는 공개 웹 주소가 아니다.

---

# 19. 결론

본 프로젝트는 Linux CLI, Docker, Nginx, Git 및 GitHub를 활용하여 기본적인 개발 환경을 구축하는 과정을 다룬다.

Linux의 파일 관리와 권한 설정부터 Docker 이미지 생성, 컨테이너 실행, 네트워크 연결, 데이터 영속성 관리, GitHub 원격 저장소 관리까지 개발 환경 구성에 필요한 기본적인 개념과 절차를 정리하였다.

특히 이미지와 컨테이너의 차이, 포트 포워딩의 역할, Bind Mount와 Volume의 차이, 데이터 백업 및 복구의 필요성을 이해하는 데 중점을 두었다.

이번 프로젝트에서 학습한 내용을 바탕으로 향후 다양한 개발 도구와 기술을 활용하여 개발 환경을 확장할 수 있다.



