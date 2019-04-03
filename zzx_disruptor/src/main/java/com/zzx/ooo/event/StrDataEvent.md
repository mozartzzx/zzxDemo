package com.zzx.ooo.event;

import com.zzx.ooo.data.entity.ZzxData;

/**
 * 
 * 什么是事件?
 * 事件就是用在生产者和消费之间传递数据用的
 * 
 * 生产者和消费者处理的数据单元
 * 该类由用户自己定义
 * 
 * 由用户自己定义的，那么框架怎么知道这个事件或者说怎么使用呢？
 * 就需要框架提供的实例化Eevnt的工厂了
 * @author zxzheng
 */
public class StrDataEvent {
	public ZzxData zzxData;

	public ZzxData getZzxData() {
		return zzxData;
	}

	public void setZzxData(ZzxData zzxData) {
		this.zzxData = zzxData;
	}
	
}
