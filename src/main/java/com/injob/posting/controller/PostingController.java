package com.injob.posting.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.injob.posting.domain.PostingVo;
import com.injob.posting.mapper.PostingMapper;

@Controller
@RequestMapping("/Posting")
public class PostingController {
	
	@Autowired
	PostingMapper postingMapper;
	
	// http://localhost:9090
	@RequestMapping("/PMain")
	public  ModelAndView   pmain(PostingVo postingVo) {
		List<PostingVo> postingList = postingMapper.getPostingList(postingVo);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("postingList",postingList);
		mv.setViewName("posting/pmain");
		
		return mv;
	}
	
}
