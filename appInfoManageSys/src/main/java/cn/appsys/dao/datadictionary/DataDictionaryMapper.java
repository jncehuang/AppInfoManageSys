package cn.appsys.dao.datadictionary;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import cn.appsys.pojo.DataDictionary;

public interface DataDictionaryMapper {
	public List<DataDictionary> getDataList(@Param(value ="typeName")String typeName,@Param(value = "from") Integer currentPageNo,
										@Param(value = "pageSize") Integer pageSize);
	public List<DataDictionary> getDataDictionaryList(@Param("typeCode") String typeCode)throws Exception;
	List<DataDictionary> getDataDictionaryListForAll(@Param("typeCode") String typeCode);
	int getDataListCount(@Param(value ="typeName")String typeName) throws Exception;
	DataDictionary getDataListForView(@Param("id") int id)throws Exception;
	int CheckDataTypeName(@Param("typeName") String typeName) throws Exception;
	int CheckDataTypeCode(@Param("typeCode") String typeCode) throws Exception;
	int addDataDictionary(DataDictionary dataDictionary);
	DataDictionary datadictionaryForByTypeCodeByTypeName(@Param("typeName") String typeName) throws Exception;
	int loadValuesId(@Param("valueId")int valueId,@Param("typeName") String typeName);
	DataDictionary datadictionaryForByTypeCodeById(@Param("id") int id) throws Exception;
	int datadictionaryUpdate(DataDictionary dataDictionary) throws Exception;
}
