package com.zzx.ooo.fegin.client;

import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * 指定服务名称
 * 映射服务调用
 * 
 * feign不支持下划线"_"
 * @FeignClient(value ="eurekaclient_rs")会报错Service id not legal hostname (eurekaclient_rs)
 * @author zxzheng
 */
@FeignClient(value = "FEGIN-LCN-B")
public interface FeginLcnBClient {
	//服务中方法的映射路径
		/**
		 * @RequestMapping 指定的是映射服务上的api
		 * 不带传递参数的
		 * @return
		 */
	    @RequestMapping("/dc")
	    String dc();
	    
	    /**
	     * 带传递参数的
	     * 使用@RequestParam来指定参数，括号里面要写上参数名
	     * @RequestParam(value="jsonstr")或者直接@RequestParam("jsonstr")
	     * 因为资源上的api是 public String  test(String jsonstr){
	     * }
	     * 为了能让spring自动帮你通过反射到传参，属性名要一样
	     * 
	     * 一般我们用json字符串来传递，所以够用了；
	     * 
	     * 如果想直接把实体类当做requestbody传递的话，就用helloparam(@RequestBody User user)
	     * @param jsonstr
	     * @return
	     */
	    @RequestMapping("/testparam")    
	    String testparam(@RequestParam("jsonstr") String jsonstr);
	    
	   /**
	    * 测试lcn事务是否有用。使用exFlag标志来测试异常
	    * @param jsonstr
	    * @param exFlag
	    * @return
	    */
	    @RequestMapping("/lcnrpc")    
	    String lcnrpc(@RequestParam("jsonstr") String jsonstr,@RequestParam("exfalg") String exFlag);
}
