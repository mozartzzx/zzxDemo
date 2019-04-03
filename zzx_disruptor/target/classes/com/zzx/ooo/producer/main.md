package com.zzx.ooo.producer;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadFactory;

import com.lmax.disruptor.EventFactory;
import com.lmax.disruptor.ExceptionHandler;
import com.lmax.disruptor.FatalExceptionHandler;
import com.lmax.disruptor.YieldingWaitStrategy;
import com.lmax.disruptor.dsl.Disruptor;
import com.lmax.disruptor.dsl.ProducerType;
import com.zzx.ooo.data.entity.ZzxData;
import com.zzx.ooo.event.StrDataEvent;
import com.zzx.ooo.eventfactory.StrDataEventFactory;
import com.zzx.ooo.eventhandler.StrDataEventHandler;
import com.zzx.ooo.eventhandler.StrDataEventHandler2;
import com.zzx.ooo.eventhandler.StrDataEventHandler3;

import io.netty.util.concurrent.DefaultThreadFactory;

/**
 * Sequencer 
		Sequencer 是 Disruptor 的真正核心。此接口有两个实现类 SingleProducerSequencer、MultiProducerSequencer ，
		它们定义在生产者和消费者之间快速、正确地传递数据的并发算法。
   Sequence Barrier
		用于保持对RingBuffer的 main published Sequence 和Consumer依赖的其它Consumer的 Sequence 的引用。 
		Sequence Barrier 还定义了决定 Consumer 是否还有可处理的事件的逻辑。
 */
public class main {
	public static void main(String[] args) {
		/**
		 * 1、指定事件工厂
		 */
		EventFactory<StrDataEvent>  eventFactory = new StrDataEventFactory();
		/**
		 * 2、Disruptor 通过 java.util.concurrent.ExecutorService 提供的线程来触发 Consumer 的事件处理
		 * 所以需要ExecutorService
		 * 
		 * 好吧后面其实也可以不需要自己创建ExecutorService，让Disruptor自己创建
		 */
		//ExecutorService executor = Executors.newCachedThreadPool();
		/**
		 * 3、RingBuffer的大小
		 *      必须是 2 的 N 次方；
		 */
		int ringBufferSize = 1024 * 1024;
		/**
		 * 4、实例化disruptor
		 * 额用线程池的太老了不推荐吗；尴尬
		 * ProducerType就是生产的模式。SINGLE就是单个生产者,MULTI就是多个生产者
		 */
		 //Disruptor<StrDataEvent> disruptor = new Disruptor<StrDataEvent>(eventFactory,
			//	 ringBufferSize, executor, ProducerType.SINGLE, new YieldingWaitStrategy());
		Disruptor<StrDataEvent> disruptor = new Disruptor<StrDataEvent>(eventFactory,
					 ringBufferSize, new DefaultThreadFactory("disruptor")
					, ProducerType.SINGLE, new YieldingWaitStrategy());
		/**
		 * 这里要说一下WaitStrategy，等待策略
		 * 
		 * 生产者和消费者都可能出现速度过快,追上对方的情况,这个时候就需要等待了.等待过程中也会有不同的策略
		 * 
		 * BlockingWaitStrategy: 默认策略
		 * 		这个策略的内部适用一个锁和条件变量来控制线程的执行和等待（Java基本的同步方法）
		         最慢的等待策略，但也是CPU使用率最低和最稳定的选项
		   SleepingWaitStrategy：性能和BlockingWaitStrategy差不多
		   		在多次循环尝试不成功后，选择让出CPU，等待下次调度，多次调度后仍不成功，尝试前睡眠一个纳秒级别的时间再尝试
				这种策略平衡了延迟和CPU资源占用，但延迟不均匀
		 * BusySpinWaitStrategy：线程一直自旋等待，可能比较耗cpu
		 * YieldingWaitStrategy: 性能最好
		 * 		在多次循环尝试不成功后，然后Thread.yield()选择让出CPU，等待下次调;
		 */
		/**
		 * 设置如何消费
		 */
		StrDataEventHandler c1=new StrDataEventHandler();
		StrDataEventHandler2 c2=new StrDataEventHandler2();
		StrDataEventHandler3 c3=new StrDataEventHandler3();
		disruptor.handleEventsWith(c1,c2);
		disruptor.after(c1,c2).handleEventsWith(c3);
		//或者
		//disruptor.handleEventsWith(c1,c2).then(c3);
		
		/**
		 * 设置异常处理
		 * 1.默认情况是处理异常就不继续往下运行了；
		 * 2.也可以自己设置处理异常
		 */
		//disruptor.setDefaultExceptionHandler(new FatalExceptionHandler());
		//disruptor.handleExceptionsFor(c3).with(new FatalExceptionHandler());
		/*disruptor.setDefaultExceptionHandler(new ExceptionHandler<StrDataEvent>() {

			@Override
			public void handleEventException(Throwable ex, long sequence, StrDataEvent event) {
				// TODO Auto-generated method stub
				ex.printStackTrace();
			}

			@Override
			public void handleOnStartException(Throwable ex) {
				// TODO Auto-generated method stub
				System.out.println("start" +ex.getMessage());
			}

			@Override
			public void handleOnShutdownException(Throwable ex) {
				// TODO Auto-generated method stub
				System.out.println("Shutdown" +ex.getMessage());
			}
		});*/
		/**
		 * 启动
		 */
		disruptor.start();
		
		
		StrDataProducer strDataProducer = new StrDataProducer(disruptor.getRingBuffer());
		ZzxData zzxData = new ZzxData();
		zzxData.setC1("我是C1");
		zzxData.setC2("我是C2");
		zzxData.setC3("");
		strDataProducer.pushDat(zzxData);
		
		try {
			Thread.sleep(6000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			/**
			 * 关闭disruptor，该方法会堵塞，直到所有的事件得到处理
			 * 好像是骗人的
			 */
			disruptor.shutdown();
		}
		
	}
}
