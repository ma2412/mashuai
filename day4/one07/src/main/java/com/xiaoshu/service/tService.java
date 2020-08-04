package com.xiaoshu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.github.pagehelper.util.StringUtil;
import com.xiaoshu.dao.UserMapper;
import com.xiaoshu.dao.pCompanyMapper;
import com.xiaoshu.dao.pPersonMapper;
import com.xiaoshu.entity.pCompany;
import com.xiaoshu.entity.pPerson;
import com.xiaoshu.entity.pPersonExample;
import com.xiaoshu.entity.pPersonExample.Criteria;

@Service
public class tService {

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

	// 新增
	public void addUser(User t) throws Exception {
		userMapper.insert(t);
	};

	// 修改
	public void updateUser(User t) throws Exception {
		userMapper.updateByPrimaryKeySelective(t);
	};

	// 删除
	public void deleteUser(Integer id) throws Exception {
		userMapper.deleteByPrimaryKey(id);
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
	}*/
	
	@Autowired
	private pPersonMapper pMapper;
	
	@Autowired
	private pCompanyMapper cMapper;
	
	public PageInfo<pPerson> findAll(pPerson person, Integer pageNum, Integer pageSize, String ordername,
			String order) {
		PageHelper.startPage(pageNum, pageSize);
		List<pPerson> userList = pMapper.findAll(person);
		PageInfo<pPerson> pageInfo = new PageInfo<pPerson>(userList);
		return pageInfo;
	}


	public List<pCompany> findc() {
		// TODO Auto-generated method stub
		return cMapper.selectAll();
	}


	public pPerson existUserWithUserName(String getpName) {
		pPersonExample example = new pPersonExample();
		Criteria criteria = example.createCriteria();
		criteria.andPNameEqualTo(getpName);
		List<pPerson> userList = pMapper.selectByExample(example);
		return userList.isEmpty()?null:userList.get(0);
	}

	// 修改
	public void updateUser(pPerson person) {
		// TODO Auto-generated method stub
		pMapper.updateByPrimaryKeySelective(person);
	}

	// 新增
	public void addUser(pPerson person) {
		// TODO Auto-generated method stub
		pMapper.insert(person);
	}

	// 删除
	public void deleteUser(int parseInt) {
		// TODO Auto-generated method stub
		pMapper.deleteByPrimaryKey(parseInt);
	}
	

}
