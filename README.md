# docker-chromium-with-flash

### 内置flash的浏览器

### [docker hub地址](https://hub.docker.com/r/1lkei/chromium-with-flash)
### [github地址](https://github.com/1lkei/docker-chromium-with-flash)

## 运行
```
docker run -d \
    --name=chromium-with-flash \
    --restart=unless-stopped \
    -p 3000:3000 \
    -p 3001:3001 \
    -v /config:/config \
    -e PUID=1000 \
    -e PGID=1000 \
    -e TZ=Asia/Shanghai \
    -e CUSTOM_PORT=3000 \
    -e CUSTOM_HTTPS_PORT=3001 \
    -e CUSTOM_USER=user \
    -e PASSWORD=pw \
    -e START_DOCKER=false \
    -e LC_ALL=zh_CN.UTF-8 \
    -e CHROME_CLI="--no-sandbox" \ # 可选，附加运行参数，一般不用删除即可
    --shm-size="1gb" \
    1lkei/chromium-with-flash:latest
```
http端口(默认值)  
`-e CUSTOM_PORT=3000`  
https端口(默认值)  
`-e CUSTOM_HTTPS_PORT=3001`

登陆账号  
`-e CUSTOM_USER=user`  
登陆密码  
`-e PASSWORD=pw`  
**请及时修改账号密码！**

若遇到无法启动gui等兼容问题，可尝试添加以下选项（添加后建议添加运行参数`--no-sandbox`，沙盒有点问题，会报错）  
`--security-opt seccomp=unconfined`

添加以下环境变量启用cn等语言支持  
`-e DOCKER_MODS=linuxserver/mods:universal-package-install`  
`-e INSTALL_PACKAGES=fonts-noto-cjk`

添加以下环境变量启用硬件加速  
`--device /dev/dri:/dev/dri`  
`-e DRINODE=/dev/dri/renderD128`

禁用docker in docker  
`-e START_DOCKER=false`

更多选项请前往<https://github.com/linuxserver/docker-baseimage-kasmvnc?tab=readme-ov-file#options>了解