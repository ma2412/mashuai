package com.xiaoshu.dao;

import com.xiaoshu.base.dao.BaseMapper;
import com.xiaoshu.entity.stuTb;
import com.xiaoshu.entity.stuTbExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface stuTbMapper extends BaseMapper<stuTb> {
    long countByExample(stuTbExample example);

    int deleteByExample(stuTbExample example);

    List<stuTb> selectByExample(stuTbExample example);

    int updateByExampleSelective(@Param("record") stuTb record, @Param("example") stuTbExample example);

    int updateByExample(@Param("record") stuTb record, @Param("example") stuTbExample example);

	List<stuTb> findAll(stuTb stutb);

	List<stuTb> getEcharts();
}