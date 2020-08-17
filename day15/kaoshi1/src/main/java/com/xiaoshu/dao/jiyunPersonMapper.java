package com.xiaoshu.dao;

import com.xiaoshu.base.dao.BaseMapper;
import com.xiaoshu.entity.jiyunPerson;
import com.xiaoshu.entity.jiyunPersonExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface jiyunPersonMapper extends BaseMapper<jiyunPerson> {
    long countByExample(jiyunPersonExample example);

    int deleteByExample(jiyunPersonExample example);

    List<jiyunPerson> selectByExample(jiyunPersonExample example);

    int updateByExampleSelective(@Param("record") jiyunPerson record, @Param("example") jiyunPersonExample example);

    int updateByExample(@Param("record") jiyunPerson record, @Param("example") jiyunPersonExample example);

	List<jiyunPerson> findAll(jiyunPerson person);

	List<jiyunPerson> getEcharts();
}