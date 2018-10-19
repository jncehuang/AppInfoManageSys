package cn.appsys.dao.devuser;

import cn.appsys.pojo.BackendUser;
import org.apache.ibatis.annotations.Param;
import cn.appsys.pojo.DevUser;

import java.util.List;

public interface DevUserMapper {
	public DevUser getLoginUser(@Param("devCode") String devCode) throws Exception;
	public List<DevUser> getDevUserList(@Param(value ="devName")String devName,@Param(value = "from") Integer currentPageNo,
										@Param(value = "pageSize") Integer pageSize);
	int getDevUserCount(@Param(value ="devName")String devName) throws Exception;
	DevUser getLoginUserForView(@Param("id") int id)throws Exception;
	int delDevUser(@Param(value = "id") Integer delId) throws Exception;
	List<BackendUser> getBackEnd() throws Exception;
	int modifyBackendUser(DevUser devUser) throws Exception;
	int addDevUser(DevUser devUser) throws Exception;
}
