package com.xiaoshu.dao;

import com.xiaoshu.base.dao.BaseMapper;
import com.xiaoshu.entity.tbStuDay;
import com.xiaoshu.entity.tbStuDayExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface tbStuDayMapper extends BaseMapper<tbStuDay> {
    long countByExample(tbStuDayExample example);

    int deleteByExample(tbStuDayExample example);

    List<tbStuDay> selectByExample(tbStuDayExample example);

    int updateByExampleSelective(@Param("record") tbStuDay record, @Param("example") tbStuDayExample example);

    int updateByExample(@Param("record") tbStuDay record, @Param("example") tbStuDayExample example);

	List<tbStuDay> findAll(tbStuDay tbstuday);

	List<tbStuDay> getEcharts();

}