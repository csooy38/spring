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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.annotation.JsonValue;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.soft.service.InfoService;

@Controller
public class InfoController {
	
	@Autowired
	private InfoService infoService;
	
	@RequestMapping(value="/realgrid")
	public String info(Model model, HttpServletRequest request) throws IOException {
//		List<HashMap<String, Object>> infoList = infoService.selectInfoList();
//		
//		model.addAttribute("infoList", infoList);
//		
//		JSONArray jsonArr = new JSONArray();
//		
//		for(int i=0; i<infoList.size(); i++) {
//			JSONObject jsonObj = new JSONObject();
//			HashMap<String, Object> map = infoList.get(i);
//			Set<Map.Entry<String, Object>> entries = map.entrySet();
//			for(Map.Entry<String, Object> entry : entries) {
//				jsonObj.put(entry.getKey(), entry.getValue());
//			}
//			jsonArr.add(jsonObj);
//		}
//		
//		model.addAttribute("info", jsonArr);
//		request.setAttribute("infoJson", jsonArr);
//		ObjectMapper mapper = new ObjectMapper();
//		String jsonText = mapper.writeValueAsString(infoList);
//		model.addAttribute("infoText", jsonText);
//		
//		System.out.println("infoList : " + infoList);
//		System.out.println("jsonArr : " + jsonArr);
		
		return "realgrid/main";
	}
	
	@RequestMapping(value="/test")
	public String test() {
		return "realgrid/test";
	}
	
	@RequestMapping(value="/test2")
	public String test2() {
		return "realgrid/test2";
	}
	
	@RequestMapping(value="/getInfo",  produces="application/json")
	@ResponseBody
	public List<Map<String, Object>> getInfo(){
		
		System.out.println("getInfo 진입1");
		
		List<Map<String, Object>> infoList = infoService.selectInfoList();
		
		System.out.println("infoList : " + infoList);
		
		System.out.println("getInfo 진입2");		
		
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
	
	@RequestMapping(value="/updateInfo", method=RequestMethod.POST ,  produces="application/json")
	@ResponseBody
	public List<Map<String, Object>> updateInfo(@RequestBody List<Map<String, Object>> jsonList){
		
		System.out.println("updateInfo 진입1");
			
		System.out.println("jsonList >>>>>>>>>>>" + jsonList);
		
		int result = infoService.updateInfo(jsonList);
		
		List<Map<String, Object>> infoList = infoService.selectInfoList();
		
		System.out.println("infoList : " + infoList);
		
		System.out.println("getInfo 진입2");		
		
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
	
	@RequestMapping(value="/deleteInfo", method=RequestMethod.POST ,  produces="application/json")
	@ResponseBody
	public List<Map<String, Object>> deleteInfo(@RequestBody List<Map<String, Object>> jsonList){
		
		System.out.println("deleteInfo 진입1");
			
		System.out.println("jsonList >>>>>>>>>>>" + jsonList);
		
		int result = infoService.deleteInfo(jsonList);
		
		List<Map<String, Object>> infoList = infoService.selectInfoList();
		
		System.out.println("infoList : " + infoList);
		
		System.out.println("getInfo 진입2");		
		
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
	
}
