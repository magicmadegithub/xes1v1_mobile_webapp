#!/usr/bin/env bash

# 构建Web
flutter build web
# 拷贝web内容到node目录
cp -r build/web/ node/server/xes1v1webapp/public_flutter_web/
# 启动
echo "启动后，请访问 http://localhost:3000"
# 启动服务
node node/server/xes1v1webapp/bin/www
