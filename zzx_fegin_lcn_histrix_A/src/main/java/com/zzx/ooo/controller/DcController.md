package com.zzx.ooo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.zzx.ooo.zzxa.service.DemoService;
@RestController
public class DcController {
	@Value("${server.port}")
	private int port;
    @Autowired
    private DemoService demoService;

    @GetMapping("/dctest")
    public String dctest() {
    	String services = demoService.dctest();
        System.out.println(services);
        return services;
    }
    @GetMapping("/paramtest")
    public String paramtest(@RequestParam("param") String param ) {
        String services =   demoService.paramtest(param);
        System.out.println(services);
        return services;
    }
    @GetMapping("/lcntest")
    public String lcntest(@RequestParam("exfalg") String exfalg) {
        String services =   demoService.lcntest(exfalg);
        System.out.println(services);
        return services;
    }
}