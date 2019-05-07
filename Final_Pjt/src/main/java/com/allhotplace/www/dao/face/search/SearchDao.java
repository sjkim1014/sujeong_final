package com.allhotplace.www.dao.face.search;

import java.util.List;

public interface SearchDao {

	public List getContentType();

	public List getAreaList();

	public List getBigCategory(String selectedType);

	public List getMunicipality(String areaSelect);


}
