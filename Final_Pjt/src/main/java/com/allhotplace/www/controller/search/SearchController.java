package com.allhotplace.www.controller.search;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.allhotplace.www.service.face.search.SearchService;

@Controller
public class SearchController {
	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);
	
	public static final String APP_KEY = "8q31GAJwwNMz571K7eTL7BPpMIsivagfYAbl3xJeUqGhpmGE1V5Md5czX9eJ1aXXsHLMLRiB8XNtcyGLDst5xA%3D%3D";

	@Autowired SearchService searchService;


	@RequestMapping(value="/searchPlace", method=RequestMethod.GET)
	public String searchPlaceView(Model model) {
		
		logger.info("Filter Page View");
		
		// 관광타입 DB 조회하여 전달
		List contentType = new ArrayList();
		contentType = searchService.getContentType();
		
		model.addAttribute("contentType", contentType);
		
		// 지역 DB 조회하여 전달
		List areaList = new ArrayList();
		areaList = searchService.getAreaList();
		
		model.addAttribute("areaList", areaList);
		
		return "search/searchPlace";
	}
	
	
	// 관광타입에 맞는 대분류 조회
	@RequestMapping(value="/searchCategory", method=RequestMethod.POST)
	@ResponseBody
	public void searchCategory(Model model, String selectedType) {
		logger.info("GET CATEGORY");
		List category = searchService.getBigCategory(selectedType);
		model.addAttribute("category", category);
	}

	// 지역에 맞는 시군구 조회
	@RequestMapping(value="/searchArea", method=RequestMethod.POST)
	@ResponseBody
	public void searchArea(Model model, String areaSelect) {
		logger.info("GET Municipality");
		List Municipality = searchService.getMunicipality(areaSelect);
		model.addAttribute("Municipality", Municipality);
		
		System.out.println(Municipality);
	}
	
	
	@RequestMapping(value="/searchPlace", method=RequestMethod.POST)
	public String searchPlace(Model model) {
		
		logger.info("FORM SUBMIT OK");

		String result = "";
		BufferedReader br = null;
		
		try {
			String urlstr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey="
					+ APP_KEY
					+ "&_type=json&contentTypeId=12&areaCode=1&sigunguCode=1&cat1=A02&cat2=A0203&cat3=A02030400&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=12&pageNo=1";
			URL url = new URL(urlstr);
			HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
			urlconnection.setRequestMethod("GET");
			br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(), "UTF-8"));
			
			String line;
			while ((line = br.readLine()) != null) {
				result = result + line;
			}
			
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObj = (JSONObject)jsonParser.parse(result);
			JSONObject jsonResonse = (JSONObject)jsonObj.get("response");
			JSONObject jsonHeader = (JSONObject)jsonResonse.get("header");
			JSONObject jsonBody = (JSONObject)jsonResonse.get("body");
			JSONObject jsonItems = (JSONObject)jsonBody.get("items");
			JSONArray jsonItemArray = (JSONArray)jsonItems.get("item");
			
			String resultCode = (String) jsonHeader.get("resultCode");
			
			// API 수신상태 정상(0000) 인 경우에 데이터 가져오기 
			
			if ("0000".equals(resultCode)) {
				for(int i=0; i<jsonItemArray.size(); i++) {
					JSONObject rowData = (JSONObject)jsonItemArray.get(i);
					System.out.println("json line 2 : " + rowData);
				}
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		model.addAttribute("result", result);
		System.out.println(result);
		return "search/searchPlace";
	}
	
}
