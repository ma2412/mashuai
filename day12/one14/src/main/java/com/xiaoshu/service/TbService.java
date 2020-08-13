package com.xiaoshu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xiaoshu.dao.tbMajorDayMapper;
import com.xiaoshu.dao.tbStuDayMapper;
import com.xiaoshu.entity.tbMajorDay;
import com.xiaoshu.entity.tbStuDay;
import com.xiaoshu.entity.tbStuDayExample;
import com.xiaoshu.entity.tbStuDayExample.Criteria;

@Service
public class TbService {
	
	@Autowired
	private tbMajorDayMapper mMapper;
	
	
	@Autowired
	private tbStuDayMapper sMapper;
	
	
	public List<tbMajorDay> findm() {
		// TODO Auto-generated method stub
		return mMapper.selectAll();
	}


	public PageInfo<tbStuDay> findAll(tbStuDay tbstuday, Integer pageNum, Integer pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		List<tbStuDay> userList = sMapper.findAll(tbstuday);
		PageInfo<tbStuDay> pageInfo = new PageInfo<tbStuDay>(userList);
		return pageInfo;
	}

	// 通过用户名判断是否存在，（新增时不能重名）
	public tbStuDay existUserWithUserName(String sdname) {
		tbStuDayExample example = new tbStuDayExample();
		Criteria criteria = example.createCriteria();
		criteria.andSdnameEqualTo(sdname);
		List<tbStuDay> userList = sMapper.selectByExample(example);
		return userList.isEmpty()?null:userList.get(0);
	}

	// 新增
		public void addUser(tbStuDay t) throws Exception {
			sMapper.insert(t);
		};

		// 修改
		public void updateUser(tbStuDay t) throws Exception {
			sMapper.updateByPrimaryKeySelective(t);
		};

		// 删除
		public void deleteUser(Integer id) throws Exception {
			sMapper.deleteByPrimaryKey(id);
		}


		public List<tbStuDay> findLog(tbStuDay tbstuday) {
			// TODO Auto-generated method stub
			return sMapper.findAll(tbstuday);
		}


		public List<tbStuDay> getEcharts() {
			// TODO Auto-generated method stub
			return sMapper.getEcharts();
		}
		private RedisTemplate redistemplate;
		
		public void addaddtemp(tbMajorDay tbmajorday) {
			// TODO Auto-generated method stub
			mMapper.insert(tbmajorday);
			redistemplate.boundHashOps("mlist").put("mlist", tbmajorday.toString());
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

}
