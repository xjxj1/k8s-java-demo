FROM registry.cn-hangzhou.aliyuncs.com/ci-base/openjdk-arthas:v1

# 定义容器中的挂载目录为/tmp
VOLUME /tmp

# 导入启动脚本
COPY ./docker-entrypoint.sh /test/entrypoint.sh

# 赋予执行权限
RUN ["chmod", "+x", "/test/entrypoint.sh"]

# 导入jar包
COPY ./target/docker_test-1.0-SNAPSHOT.jar /test/docker_test.jar

# 定义工作目录
WORKDIR /test

# Add Tini
#ENV TINI_VERSION v0.18.0
#ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
#RUN chmod +x /tini
# 安装tini
RUN apk add --no-cache tini

#ENTRYPOINT ["/tini", "--"]
ENTRYPOINT ["/sbin/tini", "--", "/test/entrypoint.sh"]
