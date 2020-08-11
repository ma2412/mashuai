package com.xiaoshu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.github.pagehelper.util.StringUtil;
import com.xiaoshu.dao.GoodsMapper;
import com.xiaoshu.dao.GoodstypeMapper;
import com.xiaoshu.dao.UserMapper;
import com.xiaoshu.entity.Goods;
import com.xiaoshu.entity.GoodsExample;
import com.xiaoshu.entity.GoodsExample.Criteria;
import com.xiaoshu.entity.Goodstype;

@Service
public class GoodsService {

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
	private GoodsMapper goodsMapper;
	
	@Autowired
	private GoodstypeMapper goodstypeMapper;
	
	public List<Goodstype> findt() {
		// TODO Auto-generated method stub
		return goodstypeMapper.selectAll();
	}
	// 新增
		public void addUser(Goods t) throws Exception {
			goodsMapper.insert(t);
		};

		// 修改
		public void updateUser(Goods t) throws Exception {
			goodsMapper.updateByPrimaryKeySelective(t);
		};

		// 删除
		public void deleteUser(Integer id) throws Exception {
			goodsMapper.deleteByPrimaryKey(id);
		}
		public PageInfo<Goods> findAll(Goods goods, Integer pageNum, Integer pageSize, String ordername, String order) {
			PageHelper.startPage(pageNum, pageSize);
			List<Goods> userList = goodsMapper.findAll(goods);
			PageInfo<Goods> pageInfo = new PageInfo<Goods>(userList);
			return pageInfo;
		};
		
		
		// 通过用户名判断是否存在，（新增时不能重名）
		public Goods existUserWithUserName(String c) throws Exception {
			GoodsExample example = new GoodsExample();
			Criteria criteria = example.createCriteria();
			criteria.andCodeEqualTo(c);
			List<Goods> userList = goodsMapper.selectByExample(example);
			return userList.isEmpty()?null:userList.get(0);
		}
		
		private RedisTemplate redisTemplate;
		
		public void addtemp(Goodstype goodstype) {
			// TODO Auto-generated method stub
			goodstypeMapper.insert(goodstype);
			redisTemplate.boundHashOps("tlist").put("goodstypes", goodstype.toString());
		}
		public List<Goods> getEcharts() {
			// TODO Auto-generated method stub
			
			return goodsMapper.getEcharts();
		};

}
