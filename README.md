# 🖥️ 나만의 개발자 작업실 구축 프로젝트

## 1. 프로젝트 소개

### 1-1. 프로젝트명

나만의 개발자 작업실 만들기 (My Development Workstation)

### 1-2. 프로젝트 목적

이번 프로젝트는 개발자가 사용하는 기본적인 개발 환경을 직접 구축하고 관리하는 것을 목표로 한다.

Linux 명령어를 활용하여 파일과 디렉터리를 관리하고, 파일 권한을 설정하는 방법을 익혔다. 또한 Docker를 이용하여 컨테이너를 실행하고, Dockerfile을 작성하여 나만의 웹 서버 이미지를 제작하였다.

이후 포트 매핑, Bind Mount, Volume 기능을 실습하여 컨테이너와 호스트 간의 데이터 관리 방법을 학습하였다.

마지막으로 Git과 GitHub를 활용하여 프로젝트를 버전 관리하고 원격 저장소에 업로드하였다.

### 1-3. 사용 기술 및 도구

| 구분         | 사용 기술                |
| ---------- | -------------------- |
| 운영체제 및 터미널 | Linux CLI            |
| 파일 관리      | mkdir, cd, touch, ls |
| 파일 권한 관리   | chmod, ls -l         |
| 컨테이너 기술    | Docker               |
| 웹 서버       | Nginx                |
| 이미지 제작     | Dockerfile           |
| 버전 관리      | Git                  |
| 원격 저장소     | GitHub               |
| 개발 도구      | Visual Studio Code   |

---

## 2. Linux CLI 실습

### 2-1. 작업 디렉터리 생성

Linux 명령어를 사용하여 개발 작업을 진행할 디렉터리를 생성하였다.

**사용 명령어**

```bash
mkdir -p ~/dev-workstation
cd ~/dev-workstation
mkdir my-web
cd my-web
```

**명령어 설명**

* `mkdir`: 새로운 디렉터리를 생성한다.
* `-p`: 상위 디렉터리가 없을 경우 함께 생성한다.
* `cd`: 지정한 디렉터리로 이동한다.
* `~`: 현재 사용자의 홈 디렉터리를 의미한다.

### 2-2. 파일 및 디렉터리 관리

파일과 디렉터리를 생성하고 현재 작업 위치와 파일 목록을 확인하였다.

**사용 명령어**

```bash
pwd
ls
ls -l
mkdir test
touch test.txt
```

**명령어 설명**

* `pwd`: 현재 작업 중인 디렉터리 경로를 출력한다.
* `ls`: 현재 디렉터리의 파일 목록을 출력한다.
* `ls -l`: 파일의 권한, 소유자, 크기 등을 자세히 출력한다.
* `mkdir`: 디렉터리를 생성한다.
* `touch`: 새로운 파일을 생성한다.

### 2-3. 파일 권한 관리

Linux에서는 파일과 디렉터리마다 읽기, 쓰기, 실행 권한을 설정할 수 있다.

**권한의 종류**

| 권한 | 의미          | 숫자 |
| -- | ----------- | -- |
| r  | 읽기(Read)    | 4  |
| w  | 쓰기(Write)   | 2  |
| x  | 실행(Execute) | 1  |

**권한 변경 명령어**

```bash
chmod 644 test.txt
chmod 755 test
ls -l
```

**권한 설명**

* `644`: 소유자는 읽기와 쓰기가 가능하고, 그룹과 다른 사용자는 읽기만 가능하다.
* `755`: 소유자는 읽기, 쓰기, 실행이 가능하고, 그룹과 다른 사용자는 읽기와 실행이 가능하다.

Linux의 파일 권한은 보안을 유지하고 사용자별 접근을 제어하는 데 사용된다.

---

## 3. Docker 설치 및 기본 실습

### 3-1. Docker 실행 확인

Docker가 정상적으로 설치되고 실행되는지 확인하였다.

**사용 명령어**

```bash
docker --version
docker info
```

**명령어 설명**

* `docker --version`: 설치된 Docker 버전을 확인한다.
* `docker info`: Docker의 전체적인 시스템 정보를 확인한다.

### 3-2. Hello World 컨테이너 실행

Docker가 정상적으로 작동하는지 확인하기 위해 Hello World 이미지를 실행하였다.

**사용 명령어**

```bash
docker run hello-world
```

**실습 내용**

Docker는 이미지를 기반으로 컨테이너를 생성하고 실행한다.

Hello World 컨테이너를 실행하여 Docker 엔진이 정상적으로 작동하는지 확인하였다.

정상적으로 실행되면 Docker의 작동을 안내하는 메시지가 출력된다.

### 3-3. Ubuntu 컨테이너 실행

Ubuntu 이미지를 이용하여 컨테이너를 실행하였다.

**사용 명령어**

```bash
docker run -it ubuntu bash
```

**명령어 설명**

* `docker run`: 새로운 컨테이너를 생성하고 실행한다.
* `-i`: 표준 입력을 활성화한다.
* `-t`: 터미널 환경을 제공한다.
* `ubuntu`: 사용할 이미지 이름이다.
* `bash`: 컨테이너 내부에서 실행할 명령어이다.

컨테이너 내부에서 다음 명령어를 실행할 수 있다.

```bash
pwd
ls
cat /etc/os-release
exit
```

`exit` 명령어를 입력하면 컨테이너 내부의 터미널에서 나갈 수 있다.

### 3-4. 컨테이너 상태 및 로그 확인

**사용 명령어**

```bash
docker ps
docker ps -a
docker logs 컨테이너이름
docker stats
```

**명령어 설명**

* `docker ps`: 현재 실행 중인 컨테이너를 확인한다.
* `docker ps -a`: 종료된 컨테이너를 포함하여 전체 목록을 확인한다.
* `docker logs`: 특정 컨테이너의 로그를 확인한다.
* `docker stats`: 컨테이너의 CPU 및 메모리 사용량 등을 확인한다.

---

## 4. Dockerfile을 이용한 나만의 웹 서버 구축

### 4-1. 웹 서버 제작 목적

Docker의 Dockerfile 기능을 활용하여 Nginx 기반의 웹 서버 이미지를 직접 제작하였다.

Dockerfile을 작성하면 필요한 설정을 코드로 저장할 수 있으며, 동일한 환경의 이미지를 반복해서 생성할 수 있다.

### 4-2. 프로젝트 디렉터리 구조

```text
my-web/
│
├── Dockerfile
│
├── site/
│   └── index.html
│
└── README.md
```

### 4-3. HTML 파일 작성

`site/index.html` 파일을 생성하고 웹 브라우저에 표시할 내용을 작성하였다.

```html
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>My Development Workstation</title>
</head>
<body>
    <h1>My Development Workstation</h1>
    <p>Docker와 Nginx를 이용한 나만의 웹 서버입니다.</p>
</body>
</html>
```

### 4-4. Dockerfile 작성

프로젝트 최상위 디렉터리에 Dockerfile을 작성하였다.

```dockerfile
FROM nginx:alpine

LABEL org.opencontainers.image.title="my-development-workstation"

ENV APP_ENV=development

COPY site/ /usr/share/nginx/html/
```

**Dockerfile 명령어 설명**

| 명령어   | 기능                     |
| ----- | ---------------------- |
| FROM  | 기반이 되는 이미지를 지정한다.      |
| LABEL | 이미지에 설명이나 정보를 추가한다.    |
| ENV   | 환경 변수를 설정한다.           |
| COPY  | 호스트의 파일을 이미지 내부로 복사한다. |

* `nginx:alpine`: 가벼운 Alpine Linux 기반의 Nginx 이미지이다.
* `/usr/share/nginx/html/`: Nginx의 기본 웹 페이지 파일이 위치하는 디렉터리이다.
* `COPY`: 작성한 HTML 파일을 컨테이너에서 서비스할 수 있도록 복사한다.

### 4-5. Docker 이미지 생성

작성한 Dockerfile을 이용하여 Docker 이미지를 생성하였다.

```bash
docker build -t my-web:1.0 .
```

**명령어 설명**

* `docker build`: Docker 이미지를 생성한다.
* `-t`: 이미지의 이름과 태그를 지정한다.
* `my-web:1.0`: 이미지 이름은 my-web, 버전은 1.0이다.
* `.`: 현재 디렉터리의 Dockerfile을 기준으로 빌드한다.

### 4-6. 웹 서버 컨테이너 실행

생성한 이미지를 이용하여 Nginx 웹 서버 컨테이너를 실행하였다.

```bash
docker run -d --name my-web-server -p 8080:80 my-web:1.0
```

**명령어 설명**

* `-d`: 컨테이너를 백그라운드에서 실행한다.
* `--name`: 컨테이너의 이름을 지정한다.
* `-p 8080:80`: 호스트의 8080 포트와 컨테이너의 80 포트를 연결한다.
* `my-web:1.0`: 실행할 Docker 이미지이다.

### 4-7. 웹 서버 접속 확인

웹 브라우저 주소창에 다음 주소를 입력하여 접속한다.

```text
http://localhost:8080
```

접속하면 Dockerfile을 통해 복사한 HTML 페이지가 표시된다.

이를 통해 Docker 컨테이너에서 Nginx 웹 서버가 정상적으로 실행되는지 확인할 수 있다.

---

## 5. Docker 데이터 관리 실습

### 5-1. Bind Mount 실습

Bind Mount는 호스트 컴퓨터의 특정 디렉터리와 컨테이너 내부 디렉터리를 직접 연결하는 기능이다.

호스트에서 파일을 수정하면 컨테이너 내부에서도 변경 사항을 확인할 수 있다.

**실습 명령어 예시**

```bash
docker run -d --name my-web-bind -p 8081:80 -v ~/dev-workstation/my-web/site:/usr/share/nginx/html nginx:alpine
```

**명령어 설명**

* `-v`: 호스트 디렉터리와 컨테이너 디렉터리를 연결한다.
* `~/dev-workstation/my-web/site`: 호스트의 HTML 파일이 저장된 경로이다.
* `/usr/share/nginx/html`: 컨테이너 내부의 웹 페이지 디렉터리이다.

**실습 결과 확인 방법**

호스트 컴퓨터에서 `index.html` 내용을 수정한 후 브라우저에서 다음 주소를 새로고침하여 변경 사항을 확인한다.

```text
http://localhost:8081
```

### 5-2. Docker Volume 실습

Volume은 Docker가 관리하는 저장 공간으로, 컨테이너가 삭제되더라도 데이터를 유지할 수 있도록 도와준다.

**Volume 생성**

```bash
docker volume create mydata
```

**Volume 목록 확인**

```bash
docker volume ls
```

**Volume을 연결한 컨테이너 실행 예시**

```bash
docker run -d --name my-volume-test -v mydata:/usr/share/nginx/html nginx:alpine
```

**Volume 설명**

* `docker volume create`: 새로운 Volume을 생성한다.
* `docker volume ls`: 생성된 Volume 목록을 확인한다.
* `-v mydata:/usr/share/nginx/html`: mydata라는 Volume을 컨테이너 내부 디렉터리와 연결한다.

Volume은 컨테이너의 생명주기와 데이터를 분리하여 관리할 수 있다는 장점이 있다.

### 5-3. Bind Mount와 Volume의 차이

| 구분    | Bind Mount      | Volume        |
| ----- | --------------- | ------------- |
| 저장 위치 | 호스트에서 직접 지정     | Docker가 관리    |
| 주요 목적 | 호스트와 컨테이너 파일 공유 | 컨테이너 데이터 보존   |
| 파일 접근 | 호스트에서 직접 접근 가능  | Docker를 통해 관리 |
| 활용 예시 | 개발 중 HTML 파일 수정 | 데이터 영속성 유지    |

---

## 6. Git 및 GitHub를 이용한 버전 관리

### 6-1. Git이란?

Git은 소스 코드와 파일의 변경 이력을 관리하는 분산 버전 관리 시스템이다.

프로젝트의 수정 내역을 기록하고 이전 상태를 확인할 수 있으며 여러 개발자가 협업할 때도 활용할 수 있다.

### 6-2. Git 저장소 확인 및 초기 설정

프로젝트 디렉터리에서 Git 저장소를 확인하고 사용자 정보를 설정하였다.

```bash
git status
git config --global user.name "사용자 이름"
git config --global user.email "사용자 이메일"
```

**명령어 설명**

* `git status`: 현재 Git 저장소의 변경 상태를 확인한다.
* `git config --global user.name`: Git 커밋에 사용할 사용자 이름을 설정한다.
* `git config --global user.email`: Git 커밋에 사용할 이메일을 설정한다.

### 6-3. 파일 추가 및 커밋

```bash
git add .
git commit -m "Add custom Docker web server"
```

**명령어 설명**

* `git add .`: 현재 디렉터리의 변경된 파일을 스테이징 영역에 추가한다.
* `git commit`: 변경 사항을 Git 저장소에 기록한다.
* `-m`: 커밋 메시지를 작성한다.

### 6-4. GitHub 원격 저장소 연결

GitHub에 생성한 원격 저장소를 로컬 프로젝트와 연결하였다.

```bash
git remote add origin https://github.com/konosiuda/my-development-workstation.git
```

**원격 저장소 확인**

```bash
git remote -v
```

원격 저장소의 주소가 올바르게 연결되었는지 확인할 수 있다.

### 6-5. 브랜치 이름 설정 및 업로드

```bash
git branch -M main
git push -u origin main
```

**명령어 설명**

* `git branch -M main`: 현재 브랜치 이름을 main으로 변경한다.
* `git push`: 로컬 저장소의 커밋을 원격 저장소에 업로드한다.
* `-u`: 로컬 브랜치와 원격 브랜치의 추적 관계를 설정한다.

### 6-6. README 수정 사항 업로드

README 파일을 작성하거나 수정한 경우 다음 명령어를 사용한다.

```bash
git add README.md
git commit -m "Add README"
git push
```

---

## 7. 실습 중 발생한 문제 및 해결 과정

실습 과정에서 발생한 오류를 직접 확인하고 원인을 분석하여 해결하였다.

### 문제 1. Git 원격 저장소 추가 오류

**발생 오류**

```text
error: remote origin already exists.
```

**발생 원인**

이미 origin이라는 이름으로 원격 저장소가 등록되어 있는데 다시 추가하려고 하여 발생한 오류이다.

**해결 방법**

기존 원격 저장소 주소를 확인하였다.

```bash
git remote -v
```

기존 주소가 올바르지 않은 경우 다음 명령어로 수정할 수 있다.

```bash
git remote set-url origin https://github.com/konosiuda/my-development-workstation.git
```

**해결 결과**

기존 원격 저장소를 새로 추가하는 대신 주소를 수정하여 올바른 GitHub 저장소와 연결하였다.

### 문제 2. Git 사용자 정보 오류

**발생 오류**

```text
Author identity unknown
fatal: unable to auto-detect email address
```

**발생 원인**

Git 커밋을 생성할 때 필요한 사용자 이름과 이메일 정보가 설정되어 있지 않아 발생하였다.

**해결 방법**

다음 명령어를 이용하여 사용자 정보를 설정하였다.

```bash
git config --global user.name "사용자 이름"
git config --global user.email "사용자 이메일"
```

이후 커밋 명령어를 다시 실행하였다.

```bash
git commit -m "Add custom Docker web server"
```

**해결 결과**

Git 사용자 정보를 설정한 후 정상적으로 커밋을 진행하였다.

### 문제 3. GitHub 저장소를 찾을 수 없는 오류

**발생 오류**

```text
remote: Repository not found.
fatal: repository not found
```

**발생 원인**

GitHub 원격 저장소 주소가 올바르지 않거나 저장소에 접근할 수 없는 경우 발생한다.

**해결 방법**

GitHub 사용자 이름과 저장소 이름을 확인하고 원격 저장소 주소를 수정하였다.

```bash
git remote set-url origin https://github.com/konosiuda/my-development-workstation.git
```

**해결 결과**

올바른 저장소 주소로 수정한 후 GitHub 인증 및 원격 저장소 접근에 성공하였다.

### 문제 4. 원격 저장소와 로컬 저장소의 이력 충돌

**발생 오류**

```text
! [rejected] main -> main (fetch first)
error: failed to push some refs
```

**발생 원인**

GitHub 원격 저장소에 로컬 저장소에는 없는 커밋이 존재하여 바로 Push할 수 없는 상태였다.

**해결 방법**

원격 저장소의 변경 사항을 가져오면서 서로 다른 이력을 병합하도록 명령어를 실행하였다.

```bash
git pull --no-rebase origin main --allow-unrelated-histories
```

이후 Nano 편집기가 실행되어 병합 커밋 메시지를 확인하였다.

* `Ctrl + O`: 파일 저장
* `Enter`: 파일 이름 확인
* `Ctrl + X`: 편집기 종료

마지막으로 다시 업로드하였다.

```bash
git push -u origin main
```

**해결 결과**

로컬 저장소와 원격 저장소의 이력을 병합한 후 GitHub 업로드에 성공하였다.

---

## 8. 최종 프로젝트 결과

이번 프로젝트를 통해 Linux, Docker, Git, GitHub의 기본적인 사용 방법을 실습하였다.

### 주요 학습 내용

1. Linux CLI를 이용한 파일 및 디렉터리 관리 방법을 익혔다.
2. chmod 명령어를 이용하여 파일과 디렉터리의 권한을 변경하는 방법을 배웠다.
3. Docker 이미지를 기반으로 컨테이너를 생성하고 실행하는 방법을 익혔다.
4. Dockerfile을 작성하여 Nginx 기반의 웹 서버 이미지를 제작하였다.
5. 포트 매핑을 이용하여 컨테이너의 웹 서버에 접근하는 방법을 배웠다.
6. Bind Mount와 Volume의 차이점 및 데이터 관리 방법을 학습하였다.
7. Git과 GitHub를 이용하여 프로젝트를 버전 관리하고 원격 저장소에 업로드하였다.
8. 실습 중 발생한 오류의 원인을 확인하고 해결하는 과정을 경험하였다.


