/**
 * @author zxzheng
 *
 */
package com.zzx.ooo.eventfactory;

import com.lmax.disruptor.EventFactory;
import com.zzx.ooo.event.StrDataEvent;
/**
 * 需要让disruptor为我们创建事件，我们需要声明了一个EventFactory来实例化Event对象
 * @author zxzheng
 */
public class StrDataEventFactory implements EventFactory<StrDataEvent>{

	@Override
	public StrDataEvent newInstance() {
		return new StrDataEvent();
	}
	
}