package com.xiaoshu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xiaoshu.dao.jiyunBankMapper;
import com.xiaoshu.dao.jiyunPersonMapper;
import com.xiaoshu.entity.jiyunBank;
import com.xiaoshu.entity.jiyunPerson;
import com.xiaoshu.entity.jiyunPersonExample;
import com.xiaoshu.entity.jiyunPersonExample.Criteria;

@Service
public class JiyunService {
	
	@Autowired
	private jiyunBankMapper jiyunbankMapper;
	@Autowired
	private jiyunPersonMapper jiyunpersonMapper;

	public PageInfo<jiyunPerson> findAll(jiyunPerson person, Integer pageNum, Integer pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		List<jiyunPerson> userList = jiyunpersonMapper.findAll(person);
		PageInfo<jiyunPerson> pageInfo = new PageInfo<jiyunPerson>(userList);
		return pageInfo;
	}

	public List<jiyunBank> findb() {
		// TODO Auto-generated method stub
		return jiyunbankMapper.selectAll();
	}

	public jiyunPerson existUserWithUserName(String getpName) {
		jiyunPersonExample example = new jiyunPersonExample();
		Criteria criteria = example.createCriteria();
		criteria.andPNameEqualTo(getpName);
		List<jiyunPerson> userList = jiyunpersonMapper.selectByExample(example);
		return userList.isEmpty()?null:userList.get(0);
	}
	
		// 新增
		public void addUser(jiyunPerson t) throws Exception {
			jiyunpersonMapper.insert(t);
		};

		// 修改
		public void updateUser(jiyunPerson t) throws Exception {
			jiyunpersonMapper.updateByPrimaryKeySelective(t);
		};

		// 删除
		public void deleteUser(Integer id) throws Exception {
			jiyunpersonMapper.deleteByPrimaryKey(id);
		}

		public void addtemp(jiyunBank bank) {
			// TODO Auto-generated method stub
			jiyunbankMapper.insert(bank);
		}

		public List<jiyunPerson> getEcharts() {
			// TODO Auto-generated method stub
			return jiyunpersonMapper.getEcharts();
		}

		public List<jiyunPerson> findLog(jiyunPerson person) {
			// TODO Auto-generated method stub
			return jiyunpersonMapper.findAll(person);
		};

	/*@Autowired
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


}
