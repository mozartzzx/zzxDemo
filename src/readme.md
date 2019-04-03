#本案例只使用了LCN分布式事务框架的lcn模式，另外TXC和TCC没有演示
#先启动txlcn-tm和服务注册中心

#试验过程 在clientA中访问 clientB 和clientC  
	方法在 clientA的DcController的lcntest方法中
#clientA的访问地址 http://127.0.0.1:9077//lcntest?exfalg=A
#通过exfalg模拟哪个客户端异常，观察三个客户端的事务是否都回滚了
#如果分布式事务没成功，那么A报异常但是B和C的事务还是提交了


#事务配置在zzx_common的com.zzx.ooo.transcation包下

#springcloud使用Edgware版本兼容springboot1.5
#lcn使用5.0.1版本兼容springboot1.5
	上面两个配置在最外面的工程的pom.xml中可见
	
#服务中心可以使用eureka,也可以使用consul
注意启动类上的注解@EnableEurekaClient和@EnableDiscoveyClient的区别
@EnableEurekaClient只适用于Eureka作为注册中心，@EnableDiscoveryClient 可以是其他注册中心（比如consul）
配置区别在需要注册进去的服务工程中的application.properties或者application.xml中的区别
#spring.cloud.consul.host=http://127.0.0.1
#spring.cloud.consul.port=8500
#eureka.client.service-url.defaultZone=http://127.0.0.1:8001/eureka/

#使用的tx-manager是5.0.1版本的可以重lcn的官网springboot 1.5分支下载案例和tm
	demo https://github.com/codingapi/txlcn-demo/tree/1.5.boot
	tm https://github.com/codingapi/tx-lcn/releases/tag/5.0.1.RELEASE
	
