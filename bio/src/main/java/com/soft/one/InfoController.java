package com.soft.one;

import java.io.FileWriter;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.soft.service.InfoService;

@Controller
public class InfoController {
	
	@Autowired
	private InfoService infoService;
	
	@RequestMapping(value="/realgrid")
	public String info(Model model, HttpServletRequest request) throws IOException {
		return "realgrid/main";
	}
	
	@RequestMapping(value="/test")
	public String test() {
		return "realgrid/test";
	}
	
	@RequestMapping(value="/getInfo",  produces="application/json")
	@ResponseBody
	public List<Map<String, Object>> getInfo(){
		
		List<Map<String, Object>> infoList = infoService.selectInfoList();
		
		JSONArray jsonArr = new JSONArray();
		
		for(int i=0; i<infoList.size(); i++) {
			JSONObject jsonObj = new JSONObject();
			Map<String, Object> map = infoList.get(i);
			Set<Map.Entry<String, Object>> entries = map.entrySet();
			for(Map.Entry<String, Object> entry : entries) {
				jsonObj.put(entry.getKey(), entry.getValue());
			}
			jsonArr.add(jsonObj);
		}
		
		return jsonArr;
	}
	
	@RequestMapping(value="/info")
	public String info() {
		return "realgrid/info";
	}
	
	@RequestMapping(value="/{state}Info", method=RequestMethod.POST, produces="application/json")
	@ResponseBody
	public int deleteData(@RequestBody List<Map<String, Object>> jsonList, @PathVariable String state){
		int result = 0;
		
		System.out.println("jsonList : " + jsonList);
		
		if(state.equals("created")) {
			result = infoService.insertData(jsonList);
		}else if(state.equals("updated")) {
			//result가 -1로만 리턴되는 이슈
			result = infoService.updateData(jsonList);
		}else if(state.equals("deleted")) {
			//result가 -1로만 리턴되는 이슈
			result = infoService.deleteData(jsonList);
		}
		
		System.out.println("RESULT : " + result);
		
		return result;
	}
}
