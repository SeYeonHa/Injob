package com.injob.comMypage.controller;

import java.time.format.DateTimeFormatter;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.injob.comMypage.domain.PostVo;
import com.injob.comMypage.mapper.ComMypageMapper;

import com.injob.login.domain.CompanyVo;
import com.injob.login.domain.UserVo;

import com.injob.login.mapper.LoginMapper;
import com.injob.mypage.domain.ResumeVo;
import com.injob.mypage.mapper.MypageMapper;
import com.injob.paging.Pagination;
import com.injob.paging.PagingMapper;
import com.injob.paging.PagingResponse;
import com.injob.paging.SearchVo;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/ComMypage")
public class ComMypageController {

	@Autowired
	private ComMypageMapper comMypageMapper;
	@Autowired
	private LoginMapper loginMapper;
	@Autowired
	private MypageMapper mypageMapper;
	@Autowired
	private PagingMapper pagingMapper;

	@RequestMapping("/Post")
	public ModelAndView getPost(PostVo postVo, HttpSession session) {

		Long com_id = (Long) session.getAttribute("companyId");
		CompanyVo companyVo = loginMapper.idComLogin(com_id);
			 
		// 모델에 사용자 정보를 추가하여 홈 페이지로 전달
		
		ModelAndView mv = new ModelAndView();

		List<PostVo> Postlist = comMypageMapper.selectPostList(com_id);
		//mv.addObject("user",userVo);
		//mv.addObject("user_id", user_id);
		mv.addObject("Postlist", Postlist);
		mv.addObject("com_id", com_id);
		mv.addObject("company", companyVo);
		mv.setViewName("comMypage/post");

		return mv;
	}

	@RequestMapping("/PostView")
	public ModelAndView getPostView(PostVo postVo, HttpSession session) {
		
		Long com_id = (Long) session.getAttribute("companyId");
		CompanyVo companyVo = loginMapper.idComLogin(com_id);
		
		ModelAndView mv = new ModelAndView();
		
		List<PostVo> list = comMypageMapper.selectPostList2(postVo);

		mv.addObject("list", list);
		mv.addObject("com_id", com_id);
		mv.addObject("company", companyVo);
		mv.setViewName("comMypage/postView");
		return mv;
	}

	@RequestMapping("/PostWrite")
	public ModelAndView getPostWrite(PostVo postVo, HttpSession session) {
		
		Long com_id = (Long) session.getAttribute("companyId");
		CompanyVo companyVo = loginMapper.idComLogin(com_id);
		
		ModelAndView mv = new ModelAndView();
		
		PostVo pv = comMypageMapper.selectCompany(com_id);


		//mv.addObject("user",userVo);
		mv.addObject("pv", pv);
		mv.addObject("com_id", com_id);
		mv.addObject("company", companyVo);
		mv.setViewName("comMypage/postWrite");
		return mv;
	}

	@RequestMapping("/PostSubmit")
	public ModelAndView getPostSubmit(PostVo postVo, HttpSession session) {
		
		Long com_id = (Long) session.getAttribute("companyId");
		CompanyVo companyVo = loginMapper.idComLogin(com_id);
		
		ModelAndView mv = new ModelAndView();
		//com_id = postVo.getUser_id();

		comMypageMapper.insertPost(postVo);
		mv.addObject("com_id", com_id);
		mv.addObject("company", companyVo);
		//mv.addObject("user",userVo);
		//mv.addObject("user_id", user_id);
		mv.setViewName("redirect:Post");

		return mv;

	}

	@RequestMapping("/PostUpdate")
	public ModelAndView getPostUpdate(PostVo postVo, HttpSession session) {

		Long com_id = (Long) session.getAttribute("companyId");
		CompanyVo companyVo = loginMapper.idComLogin(com_id);
		
		ModelAndView mv = new ModelAndView();

		List<PostVo> list = comMypageMapper.selectPostList2(postVo);

		//mv.addObject("user",userVo);
		mv.addObject("list", list);
		mv.addObject("com_id", com_id);
		mv.addObject("company", companyVo);
		//mv.addObject("user_id", user_id);
		mv.setViewName("comMypage/postUpdate");
		return mv;

	}

	@RequestMapping("/PostUpdateSubmit")
	public ModelAndView getPostUpdateSubmit(PostVo postVo, HttpSession session) {
		
		Long com_id = (Long) session.getAttribute("companyId");
		CompanyVo companyVo = loginMapper.idComLogin(com_id);
		
		ModelAndView mv = new ModelAndView();

		comMypageMapper.updatePost(postVo);
		mv.addObject("com_id", com_id);
		mv.addObject("company", companyVo);
		//mv.addObject("user",userVo);
		//mv.addObject("user_id", user_id);
		mv.setViewName("redirect:Post");
		return mv;

	}

	@RequestMapping("/PostDelete")
	public ModelAndView getPostDelete(PostVo postVo, HttpSession session) {
		
		Long com_id = (Long) session.getAttribute("companyId");
		CompanyVo companyVo = loginMapper.idComLogin(com_id);
		
		ModelAndView mv = new ModelAndView();

		comMypageMapper.deletePost(postVo);
		mv.addObject("com_id", com_id);
		mv.addObject("company", companyVo);
		//mv.addObject("user",userVo);
		//mv.addObject("user_id", user_id);
		mv.setViewName("redirect:Post");
		return mv;

	}


	@RequestMapping("/ApplyHistory")

	public ModelAndView getApplyHistory(int nowpage, PostVo postVo ,HttpSession session) {
		
		Long com_id = (Long) session.getAttribute("companyId");
		CompanyVo companyVo = loginMapper.idComLogin(com_id);
		
		List<PostVo> Historylist = comMypageMapper.selectHistory(com_id);
		
		// 페이징
				int count = pagingMapper.countApplyHistory2( com_id );
				PagingResponse<PostVo> response = null;
				if( count<1 ) {
					response = new PagingResponse<>(Collections.emptyList(), null);
				}
				
				// 페이징을 위한 초기설정값
				SearchVo searchVo = new SearchVo();
				searchVo.setPage(nowpage);
				searchVo.setPageSize(10); // 기본10개 -> 20개
				
				//Pagination 객체를 생성해서 페이지 정보 계산 후 SearchDto 타입의 객체인 params에 계산된 페이지 정보 저장
				Pagination pagination = new Pagination(count, searchVo);
				searchVo.setPagination(pagination);
				String ap_id     = postVo.getAp_id();
				String user_name = postVo.getUser_name();
				String re_title  = postVo.getRe_title();
				String po_title  = postVo.getPo_title();
				int    offset    = pagination.getLimitStart();
				int    pageSize  = searchVo.getRecordSize();
				String result    = postVo.getResult();
				// 계산된 페이지 정보의 일부 (limitStart, recordSize)를 기준으로 리스트 데이터 조회 후 응답 데이터 변환
				List<PostVo> list = pagingMapper.getApplyHistoryPagingList2(ap_id, user_name, re_title, po_title, offset, pageSize, result, com_id);
				response = new PagingResponse<>(list, pagination);
	
		ModelAndView mv = new ModelAndView();

		

		for (PostVo dayReset : Historylist) {
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM.dd (E)");
			String formattedDate = dayReset.getPo_end_date().formatted(formatter);
		    dayReset.setStringDay(formattedDate);
		}
		
		mv.addObject("response",response);
		mv.addObject("nowpage", nowpage);
		mv.addObject("searchVo", searchVo);
		
		mv.addObject("com_id", com_id);
		mv.addObject("company", companyVo);
		
		mv.addObject("Historylist", Historylist);
		mv.setViewName("comMypage/applyHistory");
		return mv;
	}

	@RequestMapping("/ComResumeView")
	public ModelAndView getComResumeView(PostVo postVo, ResumeVo resumeVo, HttpSession session) {
		
		Long com_id = (Long) session.getAttribute("companyId");
		CompanyVo companyVo = loginMapper.idComLogin(com_id);
		
		ModelAndView mv = new ModelAndView();
		PostVo result = comMypageMapper.selectResult(postVo);

		List<ResumeVo> list = mypageMapper.selectResumeList4(resumeVo);

		// mv.addObject("user",userVo);
		// mv.addObject("user_id", user_id);
		mv.addObject("list", list);
		mv.addObject("com_id", com_id);
		mv.addObject("company", companyVo);
		mv.addObject("result",result.getResult());
		mv.setViewName("comMypage/comResumeView");
		return mv;
	}
	
}
