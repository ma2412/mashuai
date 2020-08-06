package com.xiaoshu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.github.pagehelper.util.StringUtil;
import com.xiaoshu.dao.ExpressCompanyMapper;
import com.xiaoshu.dao.ExpressPersonMapper;
import com.xiaoshu.dao.UserMapper;
import com.xiaoshu.entity.ExpressCompany;
import com.xiaoshu.entity.ExpressPerson;
import com.xiaoshu.entity.ExpressPersonExample;
import com.xiaoshu.entity.ExpressPersonExample.Criteria;

@Service
public class ExpressService {

/*	@Autowired
	UserMapper userMapper;

	// 查询所有
	public List<User> findUser(User t) throws Exception {
		return userMapper.select(t);
	};

	// 数量
	public int countUser(User t) throws Exception {
		return userMapper.selectCount(t);
	};

	// 通过ID查询
	public User findOneUser(Integer id) throws Exception {
		return userMapper.selectByPrimaryKey(id);
	};

	

	// 登录
	public User loginUser(User user) throws Exception {
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		criteria.andPasswordEqualTo(user.getPassword()).andUsernameEqualTo(user.getUsername());
		List<User> userList = userMapper.selectByExample(example);
		return userList.isEmpty()?null:userList.get(0);
	};

	// 通过用户名判断是否存在，（新增时不能重名）
	public User existUserWithUserName(String userName) throws Exception {
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		criteria.andUsernameEqualTo(userName);
		List<User> userList = userMapper.selectByExample(example);
		return userList.isEmpty()?null:userList.get(0);
	};

	// 通过角色判断是否存在
	public User existUserWithRoleId(Integer roleId) throws Exception {
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		criteria.andRoleidEqualTo(roleId);
		List<User> userList = userMapper.selectByExample(example);
		return userList.isEmpty()?null:userList.get(0);
	}

	public PageInfo<User> findUserPage(User user, int pageNum, int pageSize, String ordername, String order) {
		PageHelper.startPage(pageNum, pageSize);
		ordername = StringUtil.isNotEmpty(ordername)?ordername:"userid";
		order = StringUtil.isNotEmpty(order)?order:"desc";
		UserExample example = new UserExample();
		example.setOrderByClause(ordername+" "+order);
		Criteria criteria = example.createCriteria();
		if(StringUtil.isNotEmpty(user.getUsername())){
			criteria.andUsernameLike("%"+user.getUsername()+"%");
		}
		if(user.getUsertype() != null){
			criteria.andUsertypeEqualTo(user.getUsertype());
		}
		if(user.getRoleid() != null){
			criteria.andRoleidEqualTo(user.getRoleid());
		}
		List<User> userList = userMapper.selectUserAndRoleByExample(example);
		PageInfo<User> pageInfo = new PageInfo<User>(userList);
		return pageInfo;
	}
*/
	@Autowired
	private ExpressPersonMapper personMapper;
	
	@Autowired
	private ExpressCompanyMapper companyMapper;
	
	public PageInfo<ExpressPerson> findUserPage(ExpressPerson person, Integer pageNum, Integer pageSize, String ordername,
			String order) {
		PageHelper.startPage(pageNum, pageSize);
		List<ExpressPerson> userList = personMapper.findAll(person);
		PageInfo<ExpressPerson> pageInfo = new PageInfo<ExpressPerson>(userList);
		return pageInfo;
	}
	
	public List<ExpressCompany> findc() {
		// TODO Auto-generated method stub
		return companyMapper.selectAll();
	}
	// 删除
	public void deleteUser(int parseInt) {
		// TODO Auto-generated method stub
		personMapper.deleteByPrimaryKey(parseInt);
	}
	// 新增
	public void addUser(ExpressPerson person) {
		// TODO Auto-generated method stub
		personMapper.insert(person);
	}
	public ExpressPerson existUserWithUserName(String expressName) {
		ExpressPersonExample example = new ExpressPersonExample();
		Criteria criteria = example.createCriteria();
		criteria.andExpressNameEqualTo(expressName);
		List<ExpressPerson> userList = personMapper.selectByExample(example);
		return userList.isEmpty()?null:userList.get(0);
	}
	
	// 修改
	public void updateUser(ExpressPerson person) {
		// TODO Auto-generated method stub
		personMapper.updateByPrimaryKeySelective(person);
	}
	
}
