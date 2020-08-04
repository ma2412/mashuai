package com.xiaoshu.dao;

import com.xiaoshu.base.dao.BaseMapper;
import com.xiaoshu.entity.pPerson;
import com.xiaoshu.entity.pPersonExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface pPersonMapper extends BaseMapper<pPerson> {
    long countByExample(pPersonExample example);

    int deleteByExample(pPersonExample example);

    List<pPerson> selectByExample(pPersonExample example);

    int updateByExampleSelective(@Param("record") pPerson record, @Param("example") pPersonExample example);

    int updateByExample(@Param("record") pPerson record, @Param("example") pPersonExample example);

	List<pPerson> findAll(pPerson person);
}