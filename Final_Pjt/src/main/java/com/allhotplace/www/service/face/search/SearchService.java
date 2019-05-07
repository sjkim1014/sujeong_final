package com.allhotplace.www.service.face.search;

import java.util.List;

public interface SearchService {
	
	public List getContentType();

	public List getAreaList();

	public List getBigCategory(String selectedType);

	public List getMunicipality(String areaSelect);

	
}
