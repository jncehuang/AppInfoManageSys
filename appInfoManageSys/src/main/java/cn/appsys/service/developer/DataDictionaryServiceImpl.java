package cn.appsys.service.developer;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.appsys.dao.datadictionary.DataDictionaryMapper;
import cn.appsys.pojo.DataDictionary;

@Service
public class DataDictionaryServiceImpl implements DataDictionaryService {
	
	@Resource
	private DataDictionaryMapper mapper;
	
	@Override
	public List<DataDictionary> getDataDictionaryList(String typeCode)
			throws Exception {
		// TODO Auto-generated method stub
		return mapper.getDataDictionaryList(typeCode);
	}

	@Override
	public int getDataListCount(String typeCode) throws Exception {
		return mapper.getDataListCount(typeCode);
	}

	@Override
	public List<DataDictionary> getDataList(String typeCode, Integer currentPageNo, Integer pageSize) {
		return mapper.getDataList(typeCode,currentPageNo,pageSize);
	}

	@Override
	public DataDictionary getDataListForView(int id) throws Exception {
		return mapper.getDataListForView(id);
	}

	@Override
	public Boolean CheckDataTypeName(String typeName) throws Exception {
		Boolean flag = false;
		if(mapper.CheckDataTypeName(typeName) >= 1){
			flag = true;
		}
		return flag;
	}

	@Override
	public Boolean CheckDataTypeCode(String typeCode) throws Exception {
		Boolean flag = false;
		if(mapper.CheckDataTypeCode(typeCode) >= 1){
			flag = true;
		}
		return flag;
	}

    @Override
    public Boolean addDataDictionary(DataDictionary dataDictionary) {
        Boolean flag = false;
        if(mapper.addDataDictionary(dataDictionary) >= 1){
            flag = true;
        }
        return flag;
    }

	@Override
	public DataDictionary datadictionaryForByTypeCodeByTypeName(String typeName) throws Exception {
		return mapper.datadictionaryForByTypeCodeByTypeName(typeName);
	}

	@Override
	public Boolean loadValuesId(int valueId,String typeName) {
		Boolean flag = false;
		if(mapper.loadValuesId(valueId,typeName) >= 1){
			flag = true;
		}
		return flag;
	}

	@Override
	public DataDictionary datadictionaryForByTypeCodeById(int id) throws Exception {
		return mapper.datadictionaryForByTypeCodeById(id);
	}

	@Override
	public Boolean datadictionaryUpdate(DataDictionary dataDictionary) throws Exception {
		Boolean flag = false;
		System.out.println("aaaaaaaa" + dataDictionary.getTypeName());
		if(mapper.datadictionaryUpdate(dataDictionary) >= 1){
			flag = true;
		}
		return flag;
	}

	@Override
	public List<DataDictionary> getDataDictionaryListForAll(String typeCode) {
		return mapper.getDataDictionaryListForAll(typeCode);
	}

}
