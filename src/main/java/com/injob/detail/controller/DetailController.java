package com.injob.detail.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import com.injob.detail.domain.DetailVo;
import com.injob.detail.domain.PostCompVo;
import com.injob.detail.mapper.DetailMapper;

@Controller
public class DetailController {

	@Autowired
	DetailMapper detailMapper;

	@GetMapping("/Detail/Detail")
	public ModelAndView getDetail( PostCompVo postCompVo) {

		PostCompVo detailList = detailMapper.getDetailList2(postCompVo);

		ModelAndView mv = new ModelAndView();
		mv.addObject("posting", detailList);
		mv.setViewName("/detail/detail");

		return mv;
	}

	
}
