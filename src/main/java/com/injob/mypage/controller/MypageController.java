package com.injob.mypage.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.injob.bookmark.service.GetbookmarkService;

import com.injob.cookie.service.GetcookieService;
import com.injob.login.domain.UserVo;
import com.injob.login.mapper.LoginMapper;
import com.injob.mypage.domain.AiRecommend;
import com.injob.mypage.domain.ResumeVo;
import com.injob.mypage.mapper.MypageMapper;
import com.injob.paging.MypagePagingMapper;
import com.injob.paging.Pagination;
import com.injob.paging.PagingResponse;
import com.injob.paging.SearchVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/Mypage")
public class MypageController {

	@Autowired
	private MypagePagingMapper mypagePagingMapper;
	@Autowired
	private MypageMapper mypageMapper;
	@Autowired
	private LoginMapper loginMapper;
	
	//------------------------------------
	@Autowired
	private GetbookmarkService getbookmarkService;
	
	@Autowired
	private GetcookieService getcookieService;
	
	
	//-------------------------------------

	@RequestMapping("/Resume")
	public ModelAndView getReseume(int nowpage, ResumeVo resumeVo, HttpSession session, HttpServletRequest request) {
		
		//--------------------------------------------------------------------------
		//ㅇㄴㄹㅇㄴㄹ
		Long userId = (Long) session.getAttribute("userId");
		//UserVo userVo = loginMapper.idLogin(userId);
		List<AiRecommend> aiList = mypageMapper.getAiList(userId);
		
		//사이드 북마크 추천 
	    List<AiRecommend> bookList = getbookmarkService.getBookmark(userId);
	    	    
	    
	  //사이드 쿠키
	     List<Long> recentlyViewedPosting = new ArrayList<>();
		 
		 recentlyViewedPosting = getcookieService.getRecentCookie(request);
		  List<AiRecommend> recentCookies = null; // 변수를 여기서 미리 선언해둠
		 if(recentlyViewedPosting == null) {
			 System.out.println("쿠키가없어요~");
			 System.out.println("쿠키가없어요~");
		 }else {
			  recentCookies = mypageMapper.getPostingCookie(recentlyViewedPosting);
		}
          //--------------------------------------------------------------------------
		 
		 
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		System.out.println("여기냐");
		Long user_id =7l;
	
			UserDetails userDetails = (UserDetails) authentication.getPrincipal();
			String username = userDetails.getUsername();
			System.out.println("여기냐냐아");
			// UserService를 사용하여 사용자 정보를 가져옴
			UserVo userVo = loginMapper.login(username);
			 user_id = userVo.getUser_id();
			 
		List<ResumeVo> Resumelist = mypageMapper.selectResumeList(resumeVo);
			 
		// 페이징
		int count = mypagePagingMapper.count( resumeVo );
		PagingResponse<ResumeVo> response = null;
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
		System.out.println("===================================");
		System.out.println(pagination.getTotalRecordCount());
		System.out.println(pagination.getStartPage());
		System.out.println(pagination.getLimitStart());
		System.out.println("===================================");
		Long   re_id    = resumeVo.getRe_id();
		String re_title = resumeVo.getRe_title();
		String license  = resumeVo.getLicense();
		int    offset   = pagination.getLimitStart();
		int    pageSize = searchVo.getRecordSize();
		
		// 계산된 페이지 정보의 일부 (limitStart, recordSize)를 기준으로 리스트 데이터 조회 후 응답 데이터 변환
		List<ResumeVo> list = mypagePagingMapper.getResumePagingList(re_id, re_title, license, offset, pageSize);
		response = new PagingResponse<>(list, pagination);
		System.out.println(list);
		System.out.println("===================================");
		System.out.println(response);
		System.out.println("===================================");
			 
		// 모델에 사용자 정보를 추가하여 홈 페이지로 전달
		
		ModelAndView mv = new ModelAndView();


		
		mv.addObject("response",response);
		mv.addObject("nowpage", nowpage);
		// mv.addObject()
		
		mv.addObject("searchVo", searchVo);
		System.out.println("여기냐냐아아아~~");
		mv.addObject("user",userVo);
		mv.addObject("user_id", user_id);
		mv.addObject("Resumelist", Resumelist);
		//--------------------------------------------
		mv.addObject("recentCookies", recentCookies);
		mv.addObject("bookList", bookList);
		//---------------------------------------
		
		mv.setViewName("mypage/resume");

		return mv;
	}

	@RequestMapping("/ResumeView")
	public ModelAndView getResumeView(ResumeVo resumeVo) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Long user_id =7l;
	
			UserDetails userDetails = (UserDetails) authentication.getPrincipal();
			String username = userDetails.getUsername();
			
			// UserService를 사용하여 사용자 정보를 가져옴
			UserVo userVo = loginMapper.login(username);
			 user_id = userVo.getUser_id();

		ModelAndView mv = new ModelAndView();

		List<ResumeVo> list = mypageMapper.selectResumeList2(resumeVo);

		mv.addObject("user",userVo);
		mv.addObject("list", list);
		mv.addObject("user_id", user_id);
		mv.setViewName("mypage/resumeView");
		return mv;
	}

	@RequestMapping("/ResumeWrite")
	public ModelAndView getResumeWrite(ResumeVo resumeVo) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Long user_id =7l;
	
			UserDetails userDetails = (UserDetails) authentication.getPrincipal();
			String username = userDetails.getUsername();
			
			// UserService를 사용하여 사용자 정보를 가져옴
			UserVo userVo = loginMapper.login(username);
			 user_id = userVo.getUser_id();

		ModelAndView mv = new ModelAndView();

		ResumeVo rv = mypageMapper.selectResumeList3(resumeVo);

		System.out.println(rv);

		mv.addObject("user",userVo);
		mv.addObject("rv", rv);
		mv.addObject("user_id", user_id);
		mv.setViewName("mypage/resumeWrite");
		return mv;
	}

	@RequestMapping("/ResumeSubmit")
	public ModelAndView getResumeSubmit(ResumeVo resumeVo) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Long user_id =7l;
	
			UserDetails userDetails = (UserDetails) authentication.getPrincipal();
			String username = userDetails.getUsername();
			
			// UserService를 사용하여 사용자 정보를 가져옴
			UserVo userVo = loginMapper.login(username);
			 user_id = userVo.getUser_id();

		ModelAndView mv = new ModelAndView();
		user_id = resumeVo.getUser_id();

		mypageMapper.insertResume(resumeVo);
		mv.addObject("user",userVo);
		mv.addObject("user_id", user_id);
		mv.setViewName("redirect:Resume");

		return mv;

	}

	@RequestMapping("/ResumeUpdate")
	public ModelAndView getResumeUpdate(ResumeVo resumeVo) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Long user_id =7l;
	
			UserDetails userDetails = (UserDetails) authentication.getPrincipal();
			String username = userDetails.getUsername();
			
			// UserService를 사용하여 사용자 정보를 가져옴
			UserVo userVo = loginMapper.login(username);
			 user_id = userVo.getUser_id();

		ModelAndView mv = new ModelAndView();

		List<ResumeVo> list = mypageMapper.selectResumeList2(resumeVo);

		mv.addObject("user",userVo);
		mv.addObject("list", list);
		mv.addObject("user_id", user_id);
		mv.setViewName("mypage/resumeUpdate");
		return mv;

	}

	@RequestMapping("/ResumeUpdateSubmit")
	public ModelAndView getResumeUpdateSubmit(ResumeVo resumeVo) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Long user_id =7l;
	
			UserDetails userDetails = (UserDetails) authentication.getPrincipal();
			String username = userDetails.getUsername();
			
			// UserService를 사용하여 사용자 정보를 가져옴
			UserVo userVo = loginMapper.login(username);
			 user_id = userVo.getUser_id();

		ModelAndView mv = new ModelAndView();

		mypageMapper.updateResume(resumeVo);
		mv.addObject("user",userVo);
		mv.addObject("user_id", user_id);
		mv.setViewName("redirect:Resume");
		return mv;

	}

	@RequestMapping("/ResumeDelete")
	public ModelAndView getResumeDelete(ResumeVo resumeVo) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Long user_id =7l;
	
			UserDetails userDetails = (UserDetails) authentication.getPrincipal();
			String username = userDetails.getUsername();
			
			// UserService를 사용하여 사용자 정보를 가져옴
			UserVo userVo = loginMapper.login(username);
			 user_id = userVo.getUser_id();

		ModelAndView mv = new ModelAndView();

		mypageMapper.deleteResume(resumeVo);
		mv.addObject("user",userVo);
		mv.addObject("user_id", user_id);
		mv.setViewName("redirect:Resume");
		return mv;

	}

	@RequestMapping("/Apply")
	public ModelAndView getApply(ResumeVo resumeVo) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Long user_id =7l;
	
			UserDetails userDetails = (UserDetails) authentication.getPrincipal();
			String username = userDetails.getUsername();
			
			// UserService를 사용하여 사용자 정보를 가져옴
			UserVo userVo = loginMapper.login(username);
			 user_id = userVo.getUser_id();

		ModelAndView mv = new ModelAndView();

		List<ResumeVo> Resumelist = mypageMapper.selectResumeList(resumeVo);
		mv.addObject("user",userVo);
		mv.addObject("user_id", user_id);
		mv.addObject("Resumelist", Resumelist);
		mv.setViewName("mypage/apply");

		return mv;
	}

	@RequestMapping("/ApplyResume")
	public ModelAndView getApplyResume(ResumeVo resumeVo) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Long user_id =7l;
	
			UserDetails userDetails = (UserDetails) authentication.getPrincipal();
			String username = userDetails.getUsername();
			
			// UserService를 사용하여 사용자 정보를 가져옴
			UserVo userVo = loginMapper.login(username);
			 user_id = userVo.getUser_id();

		ModelAndView mv = new ModelAndView();

		mypageMapper.insertApply(resumeVo);
		
		mv.addObject("user",userVo);
		mv.addObject("user_id", user_id);
		mv.setViewName("redirect:ApplyHistory");

		return mv;
	}

	@RequestMapping("/ApplyHistory")
	public ModelAndView getApplyHistory(ResumeVo resumeVo) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Long user_id =7l;
	
			UserDetails userDetails = (UserDetails) authentication.getPrincipal();
			String username = userDetails.getUsername();
			
			// UserService를 사용하여 사용자 정보를 가져옴
			UserVo userVo = loginMapper.login(username);
			 user_id = userVo.getUser_id();

		ModelAndView mv = new ModelAndView();

		List<ResumeVo> Historylist = mypageMapper.selectHistory(resumeVo);
		mv.addObject("user",userVo);
		mv.addObject("user_id", user_id);
		mv.addObject("Historylist", Historylist);
		mv.setViewName("mypage/applyHistory");
		return mv;
	}

}
