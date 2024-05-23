package com.injob.posting.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.injob.posting.domain.PSearchVo;
import com.injob.posting.mapper.PSearchMapper;

@RestController
public class SearchApiController {
	@Autowired
	private PSearchMapper psearchMapper;
	
	@PostMapping("/Posting/Search")
	public ResponseEntity<Map<String, Object>> PSearch(@RequestBody  PSearchVo request) throws JsonProcessingException{
	
		if ("전체".equals(request.getDepartment())) {
	        request.setDepartment(null);
	    }
	    if ("전체".equals(request.getLocal())) {
	        request.setLocal(null);
	    }
	    if ("경력무관".equals(request.getCareer())) {
	        request.setCareer(null);
	    }
	    if ("학력무관".equals(request.getGrade())) {
	        request.setGrade(null);
	    }
		
		List<PSearchVo> psearchVo = psearchMapper.getSearchList(request);
		int count = psearchMapper.getSearchCount(request);
		
		ObjectMapper objectMapper = new ObjectMapper();
		String SearchString = objectMapper.writeValueAsString(request);
		
		Map<String, Object> responseData = new HashMap<>();
		//responseData.put("SearchString", SearchString);
		responseData.put("jobListings", psearchVo);
		responseData.put("totalCount", count);
		
		return ResponseEntity.ok(responseData);
		
		
}
}