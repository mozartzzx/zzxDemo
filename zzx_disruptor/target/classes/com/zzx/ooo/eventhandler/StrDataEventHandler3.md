package com.zzx.ooo.eventhandler;
import com.lmax.disruptor.EventHandler;
import com.lmax.disruptor.WorkHandler;
import com.zzx.ooo.event.StrDataEvent;
/**
 * 消费者可以实现EventHandler,WorkHandler两种接口，可以单独实现一种也可以两种都实现
 * 
 * 那么这两种实现方式有什么区别？
 *
 * 	EventHandler 对与独立消费的消费者，实现EventHandler
 *  WorkHandler 对于不重复消费的消费者，实现WorkHandler
 *  当然这么说听得懂才怪!!!
 * 	    /c1---\
 * 	 p1         c3
 *	    \c2---/
 *  比如上面的p1生产的消息，要进过c1,c2然后给c3；
 *  
 *  情况一：c1和c2都要消费消息  那么c1,c2就实现EventHandler
 *  情况二：c1和c2其中有一个消费就可以了，另一个不能再重复消费了 那么c1,c2就实现WorkHandler
 *  当然不仅仅是实现接口就可以了，还要配合disruptor的设置
 *  
 *  这就涉及到 Disruptor类的handleEventsWith，handleEventsWithWorkerPool方法的联系及区别
 *  disruptor.handleEventsWith(EventHandler ... handlers)
 *  	返回的EventHandlerGroup，Group中的每个消费者都会对p1进行消费，也就是上面的情况一
 *  disruptor.handlerEventsWithWorkerPool
 *  	EventHandlerGroup，Group的消费者对于同一条消息p1不重复消费,也就是上面的情况二
 *  
 *  所以同时实现EventHandler和WorkHandler，就看怎么调用了;
 *  
 * @author zxzheng
 */
public class StrDataEventHandler3 implements EventHandler<StrDataEvent>,WorkHandler<StrDataEvent>{

	/**
	 * WorkHandler
	 */
	@Override
	public void onEvent(StrDataEvent event) throws Exception {
		System.out.println("WorkHandler c3:"+event.getZzxData().getC3());
	}
	/**
	 * EventHandler
	 */
	@Override
	public void onEvent(StrDataEvent event, long sequence, boolean endOfBatch) throws Exception {
		System.out.println("WorkHandler c3:"+event.getZzxData().getC3());
		String  x = null;
		x.toString();
	}
	
}