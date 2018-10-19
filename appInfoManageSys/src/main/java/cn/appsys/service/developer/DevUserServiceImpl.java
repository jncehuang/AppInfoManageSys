package cn.appsys.service.developer;

import javax.annotation.Resource;

import cn.appsys.pojo.BackendUser;
import org.springframework.stereotype.Service;

import cn.appsys.dao.devuser.DevUserMapper;
import cn.appsys.pojo.DevUser;

import java.util.List;

@Service
public class DevUserServiceImpl implements DevUserService {
	@Resource
	private DevUserMapper mapper;
	@Override
	public DevUser login(String devCode, String devPassword) throws Exception {
		// TODO Auto-generated method stub
		DevUser user = null;
		user = mapper.getLoginUser(devCode);
		//匹配密码
		if(null != user){
			if(!user.getDevPassword().equals(devPassword))
				user = null;
		}
		return user;
	}

	@Override
	public List<DevUser> getDevUserList(String devName,int from,int pageSize) throws Exception {
		return mapper.getDevUserList(devName,from,pageSize);
	}

	@Override
	public int getDevUserCount(String devName) throws Exception {
		return mapper.getDevUserCount(devName);
	}

	@Override
	public DevUser getLoginUserForView(int id) throws Exception {
		return mapper.getLoginUserForView(id);
	}

	@Override
	public Boolean delDevUser(Integer delId) throws Exception {
		Boolean flag = false;
		if(mapper.delDevUser(delId) > 0){
			flag = true;
		}
		return flag;
	}

	@Override
	public List<BackendUser> getBackEnd() throws Exception {
		return mapper.getBackEnd();
	}

	@Override
	public Boolean modifyBackendUser(DevUser devUser) throws Exception {
		Boolean flag = false;
		if(mapper.modifyBackendUser(devUser) > 0){
			flag = true;
		}
		return flag;
	}

	@Override
	public Boolean addDevUser(DevUser devUser) throws Exception {
		Boolean flag = false;
		if(mapper.addDevUser(devUser) > 0){
			flag = true;
		}
		return flag;
	}

}
