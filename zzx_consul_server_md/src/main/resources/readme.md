#consul的服务端不用我们写，从官网上下一个对应的就可以
# 开发环境为了方便想只启动一个，那么就
#  ./consul agent -dev -node machine -client 0.0.0.0 -ui
#要加-client 0.0.0.0 -ui，不然浏览器只能本地访问127.0.0.1:8500，不同通过ip:8500访问了;