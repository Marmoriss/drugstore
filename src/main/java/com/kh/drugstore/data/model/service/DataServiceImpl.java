package com.kh.drugstore.data.model.service;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.xml.XmlMapper;
import com.kh.drugstore.admin.model.dao.AdminDao;
import com.kh.drugstore.admin.model.exception.DataProcessingException;
import com.kh.drugstore.data.model.dto.Item;
import com.kh.drugstore.data.model.dto.Response;
import com.kh.drugstore.product.model.dto.ProductEntity;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class DataServiceImpl implements DataService {

	private static final String XML_OPEN_API_URL = "http://apis.data.go.kr/1471000/HtfsInfoService2/getHtfsItem";
	private static final String XML_OPEN_API_SERVICE_KEY = "guVozzj6L6NkisOO0rbzbNW452DgE9%2BlwN2QEWSeXtPyVmOY7ZVd9DHA6hVwbHyIV6jPP79NaXo%2BY36RkyNIsQ%3D%3D";
	
	@Autowired
	AdminDao adminDao;
	
	@Override
	public Response getXmlOpenApi() {
		Response response = null;
		ObjectMapper xmlMapper = new XmlMapper();
		try {
			response = xmlMapper.readValue(urlFormatter(), Response.class);
			
			List<Item> items = response.getBody().getItems();
			Map<String, Object> map = new HashMap<>();
			
			log.debug("items = {}", items);
			for(Item item : items) {
				log.debug("=================");
				log.debug("item = {}", item);
				map.put("pname", item.getPRDUCT());
				map.put("sttenmtNo", item.getSTTEMNT_NO());
				map.put("manu", item.getENTRPS());
				map.put("mainFnctn", item.getMAIN_FNCTN());
				map.put("intakeHint1", item.getINTAKE_HINT1());
				map.put("srvUse", item.getSRV_USE());
				map.put("distbPd", item.getDISTB_PD());
				map.put("baseStandard", item.getBASE_STANDARD());

				int result = adminDao.insertOpenApi(map);
				log.debug("product = {}", map);
			}
		} catch (IOException e) {
			throw new DataProcessingException(XML_OPEN_API_URL);
		}
		
		return response;
	}
		
	private URL urlFormatter() throws MalformedURLException {
		String url = XML_OPEN_API_URL + "?serviceKey=" + XML_OPEN_API_SERVICE_KEY
				+ "&numOfRows=20"
				+ "&pageNo=6";
				
		return new URL(url);
	}
	
	
}











