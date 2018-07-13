## Docker容器
#### mysql 主从数据库
##### 目录结构
```
- master # 主数据库
 - conf
  - my.cnf 主数据库配置文件
 - data
 - init
  - init.sql 初始化SQL语句
 - logs
- cluster # 从数据库
 - conf
  - my.cnf 从数据库配置文件
 - data
 - init
  - init.sql 初始化SQL语句
 - logs
 - docker-compose.yml docker容器脚本
```
#### Nginx + Tomcat
##### 目录结构
```
- nginx # Nginx
 - conf.d    #Nginx配置文件
  - tomcat.conf #Tomcat代理配置文件
 - log  #日志
- docker-compose.yml docker容器脚本
```
#### 启动容器
**在容器目录下执行下面命令**
```
docker-compose up -d
```

#### docker-compose.yml 文件规范
##### 基本格式要求
```
1，YAML大小写敏感；
2，使用缩进代表层级关系；
3，缩进只能使用空格，不能使用TAB，不要求空格个数，只需要相同层级左对齐（一般2个或4个空格）
```
##### 对象
```
#冒号后面要加一个空格

key: value
```
##### 数组
```
#使用一个短横线加一个空格代表一个数组项

hobby:
    - Java
    - LOL
```
#### Docker Compose 配置文件详解
```
version: '2'
services:
  web:
    image: tomcat:8.5
    ports:
      - 8080
    networks:
      - web-host
  redis:
    image: redis
    links:
      - web
    networks:
      - web-host
  lb:
    image: dockercloud/haproxy
    ports:
      - 80:80
    links:
      - web
    networks:
      - web-host
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
networks:
  web-host:
    driver: bridge
```
**1、image**
```
image 则是指定服务的镜像名称或镜像 ID

image: tomcat:8.5

tomcat冒号后面代表版本、不加冒号表示最新版本
```
**2、build**
```
image和build不要同时使用
build 会构建容器 需要有Dockerfile

build: ./tomcat
```
**3、container_name**
```
container_name 指定容器名称

container_name: web
```
**4、depends_on**
```
depends_on 指定容器启动的顺序

depends_on:
  - db
  - redis
```
**5、dns**
```
dns 指定容器DNS

dns: 8.8.8.8
```
**6、links**
```
links 连接到其它服务中的容器

links:
  - tomcat:tomcat_host
```
**7、ports**
```
ports 端口 主机端口:容器端口

ports:
  - "80:80"
```
**8、volumes**
```
volumes 文件挂载

volumes:
  - conf:/etc/nginx/conf.d
```
**9、networks**
```
networks 加入指定网络

networks:
  - web-host
```
**10、restart**
 ```
restart 容器重启策略
 
restart: no
restart: always
restart: on-failure
```
**11、environment**
```
environment 添加环境变量

environment:
  - RACK_ENV=development
  - SHOW=true
  - SESSION_SECRET
```


