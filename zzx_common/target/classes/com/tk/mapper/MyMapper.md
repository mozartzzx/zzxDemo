package com.tk.mapper;

import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.MySqlMapper;


/**  
 * tk通用mapper
 * @author  zxzheng 
 */
public interface MyMapper<T> extends Mapper<T>, MySqlMapper<T> {
    //FIXME 特别注意，该接口不能被扫描到，否则会出错
	//FIXME 将main方法上的@MapperScan改成import tk.mybatis.spring.annotation.MapperScan;
	//FIXME yml文件中指定通用mapper
}