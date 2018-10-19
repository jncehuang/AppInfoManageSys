package cn.appsys.service.developer;

import java.util.List;

import cn.appsys.pojo.DataDictionary;
import org.apache.ibatis.annotations.Param;

public interface DataDictionaryService {
	
	/**
	 * 根据typeCode查询相应的数据字典列表
	 * @param typeCode
	 * @return
	 * @throws Exception
	 */
	public List<DataDictionary> getDataDictionaryList(String typeCode)throws Exception;
	int getDataListCount(String typeCode) throws Exception;
	public List<DataDictionary> getDataList(String typeCode,Integer currentPageNo,Integer pageSize);
	DataDictionary getDataListForView(int id)throws Exception;
	Boolean CheckDataTypeName(String typeName) throws Exception;
	Boolean CheckDataTypeCode(String typeCode) throws Exception;
	Boolean addDataDictionary(DataDictionary dataDictionary);
	DataDictionary datadictionaryForByTypeCodeByTypeName(String typeName) throws Exception;
	Boolean loadValuesId(int valueId,String typeName);
	DataDictionary datadictionaryForByTypeCodeById(int id) throws Exception;
	Boolean datadictionaryUpdate(DataDictionary dataDictionary) throws Exception;
	List<DataDictionary> getDataDictionaryListForAll(String typeCode);
}
