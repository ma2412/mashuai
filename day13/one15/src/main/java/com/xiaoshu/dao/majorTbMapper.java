package com.xiaoshu.dao;

import com.xiaoshu.base.dao.BaseMapper;
import com.xiaoshu.entity.majorTb;
import com.xiaoshu.entity.majorTbExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface majorTbMapper extends BaseMapper<majorTb> {
    long countByExample(majorTbExample example);

    int deleteByExample(majorTbExample example);

    List<majorTb> selectByExample(majorTbExample example);

    int updateByExampleSelective(@Param("record") majorTb record, @Param("example") majorTbExample example);

    int updateByExample(@Param("record") majorTb record, @Param("example") majorTbExample example);
    
    
    @Select("select * from major_tb where m_name = #{mname}")
	majorTb findByid(String mname);

}