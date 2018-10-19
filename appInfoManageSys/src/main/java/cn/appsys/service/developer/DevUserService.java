package cn.appsys.service.developer;

import cn.appsys.pojo.BackendUser;
import cn.appsys.pojo.DevUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DevUserService {
	/**
	 * 用户登录
	 * @param devCode
	 * @param devPassword
	 * @return
	 */
	public DevUser login(String devCode, String devPassword) throws Exception;
	public List<DevUser> getDevUserList(String devName,int from,int pageSize) throws Exception;
	int getDevUserCount(String devName) throws Exception;
	DevUser getLoginUserForView(int id)throws Exception;
	Boolean delDevUser(Integer delId) throws Exception;
	List<BackendUser> getBackEnd() throws Exception;
	Boolean modifyBackendUser(DevUser devUser) throws Exception;
	Boolean addDevUser(DevUser devUser) throws Exception;
}
