package com.zzx.ooo.producer;

import com.lmax.disruptor.EventTranslatorOneArg;
import com.lmax.disruptor.RingBuffer;
import com.zzx.ooo.data.entity.ZzxData;
import com.zzx.ooo.event.StrDataEvent;

/**
 *生产者       Disruptor没有定义特定接口或类型 生产者通过RingBuffer发布事件
 * 发布事件
 * 
 * 那他通过什么发布呢？
 * 通过环行队列
 *   RingBuffer --Disruptor重要的组件：用于存储和更新Disruptor中流通的数据；
 * 它是一个环状的Buffer,上面的槽(slot)可以保存一个个Event
 * 
 * 具体怎么用 看main.java
 * @author zxzheng
 */
public class StrDataProducer{
	private RingBuffer<StrDataEvent> ringBuffer;
	public StrDataProducer(RingBuffer<StrDataEvent> ringBuffer){
		this.ringBuffer = ringBuffer;
	}
	/**
	 * 简化操作，并确保 publish 总是得到调用
	 * 
	 * 还有一种是3.0之后的版本 推荐用这个
	 * 事件翻译器
	 * 好处是翻译器代码可以放到一个单独的类中，以便于更容易进行单元测试
	 * 就是把
	 * EventTranslatorOneArg<TargetEventModel,SourceEventModel>
	 * SourceEventModel中的数据弄到 TargetEventModel里面去
	 */
	private EventTranslatorOneArg<StrDataEvent, ZzxData> eventTranslatorOneArg = new EventTranslatorOneArg<StrDataEvent, ZzxData>(){

		@Override
		public void translateTo(StrDataEvent event, long sequence, ZzxData zzxData) {
			event.setZzxData(zzxData);			
		}

		
	};
	public void pushDat(ZzxData zzxData){
		ringBuffer.publishEvent(eventTranslatorOneArg, zzxData);
	}
	
}