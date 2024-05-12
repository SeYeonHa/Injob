package com.injob.detail.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.injob.detail.domain.DetailVo;
import com.injob.detail.domain.PostCompVo;
import com.injob.detail.mapper.DetailMapper;

@Controller
public class DetailController {

	@Autowired
	DetailMapper detailMapper;

	@GetMapping("/Detail/Detail")
	public ModelAndView getDetail(DetailVo detailVo, PostCompVo postCompVo) {

		List<PostCompVo> detailList = detailMapper.getDetailList();

		// List<PostCompVo> postCompList = detailMapper.getPostCompList(postCompVo);
		for (PostCompVo detailVo2 : detailList) {

			System.out.println(detailVo2.getPo_content());
			System.out.println(detailVo2.getPo_content());
			System.out.println(detailVo2.getPo_content());
		}

		ModelAndView mv = new ModelAndView();
		mv.addObject("detailList", detailList);
		mv.setViewName("/detail/detail");

		// mv.addObject("detailList", detailList);
		return mv;
	}
}
