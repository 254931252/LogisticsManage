package dao;

import java.util.List;

import entity.ProType;

public interface ProTypeDao {

	public List<ProType> getTypeList();
	
	public boolean addNewType(String ptName);

}
