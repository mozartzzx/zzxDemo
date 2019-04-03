package com.zzx.ooo.zzxa.service.impl;

import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zzx.ooo.dao.TestLcnDao;
import com.zzx.ooo.entity.Zzx;
import com.zzx.ooo.fegin.client.FeginLcnBClient;
import com.zzx.ooo.fegin.client.FeginLcnCClient;
import com.zzx.ooo.zzxa.service.DemoService;
@Service
public class DemoServiceImpl implements DemoService{
	@Autowired
	private  FeginLcnBClient feginLcnBClient;
	@Autowired
	private  FeginLcnCClient feginLcnCClient;
	@Resource
	private TestLcnDao testLcnDao;
	@Override
	public String dctest() {
		
		return feginLcnBClient.dc();
	}

	@Override
	public String paramtest(String param) {
		feginLcnCClient.testparam(param);
		return feginLcnCClient.testparam(param);
	}
	
	@Override
	public String lcntest(String exfalg) {
		Zzx bendi = new Zzx();
		bendi.setId(UUID.randomUUID().toString());
		bendi.setCname("zzxqqq");
		bendi.setVersion(0);
		testLcnDao.insert(bendi);
		String bResp= feginLcnBClient.lcnrpc("我插了", exfalg);
		String cResp = feginLcnCClient.lcnrpc("我y也插了", exfalg);
		
		if("A".equals(exfalg)){
			throw new IllegalStateException("by exFlag: "+exfalg);
		}
		return bResp + " > " + cResp + " > " + "ok-client";
	}

}
