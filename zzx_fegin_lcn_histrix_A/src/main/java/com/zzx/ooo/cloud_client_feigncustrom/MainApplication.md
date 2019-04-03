package com.zzx.ooo.cloud_client_feigncustrom;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.netflix.feign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;

import tk.mybatis.spring.annotation.MapperScan;
/**
 * EurekaClient
 * @author zxzheng
 */
/**
 * @EnableDiscoveyClient中，import（EnableDiscoveryClientImportSelector.class)
 * 
 * AbstractDiscoveryLifecycle
 * 
 * AbstractAutoServiceRegistration
 * 
 * ServiceRegistry类型，这个接口是SpringCloud给我们提供用于服务注册的接口
 * 
 * 总结：使用@EnableDiscoveyClient注册服务是利用了LifeCycle机制，在容器启动时会执行ServiceRegistry的register()方法
 * @author zxzheng
 * spring cloud中discovery service有许多种实现（eureka、consul、zookeeper等等）
 * @EnableEurekaClient只适用于Eureka作为注册中心，@EnableDiscoveryClient 可以是其他注册中心
 * 
 * @EnableEurekaClient基于 netflix的DiscoveryClient
 */
@EnableEurekaClient
@SpringBootApplication
@ComponentScan(basePackages = {"com.**"})
@MapperScan(basePackages="com.zzx.**.dao")
/**
 * RestTemplate和Ribbon可以实现负载均衡
 * 但是它调用是基于url来调用的，而java是面向对象的语言，所以ribbon显得有点格格不入了
 * 
 * FeignClient已经默认使用了ribbon，也是借助 Ribbon 来实现的
 * 
 * Feign 的声明式调用，比 Ribbon 用起来更方便
 * Feign是一个声明式的REST客户端，它的目的就是让 REST 调用更加简单
 * 
 * 使用@EnableFeignClients注解企业FeignClients，并且指定FeignClients接口所在的包
 */
@EnableFeignClients(basePackages={"com.zzx.ooo.feign.**"})


public class MainApplication {

	public static void main(String[] args) {
		SpringApplication.run(MainApplication.class, args);
	}

}
