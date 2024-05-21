package com.injob.mypage.controller;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.injob.login.domain.UserVo;
import com.injob.login.mapper.LoginMapper;
import com.injob.mypage.domain.ResumeVo;
import com.injob.mypage.mapper.MypageMapper;
import com.injob.paging.PagingMapper;
import com.injob.paging.Pagination;
import com.injob.paging.PagingResponse;
import com.injob.paging.SearchVo;

@Controller
@RequestMapping("/Mypage")
public class MypageController {

	@Autowired
	private PagingMapper pagingMapper;
	@Autowired
	private MypageMapper mypageMapper;
	@Autowired
	private LoginMapper loginMapper;

	@RequestMapping("/Resume")
	public ModelAndView getReseume(@RequestParam(value = "nowpage", required = false) Integer nowpage, ResumeVo resumeVo) {
	    if (nowpage == null) {
	        nowpage = 1; // 기본 페이지 번호 설정
	    }

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		System.out.println("여기냐");
		Long user_id =7l;
	
			UserDetails userDetails = (UserDetails) authentication.getPrincipal();
			String username = userDetails.getUsername();
			// UserService를 사용하여 사용자 정보를 가져옴
			UserVo userVo = loginMapper.login(username);
			 user_id = userVo.getUser_id();
			 
		List<ResumeVo> Resumelist = mypageMapper.selectResumeList(user_id);
			 
		// 페이징
		int count = pagingMapper.count( user_id );
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
		Long   re_id    = resumeVo.getRe_id();
		String re_title = resumeVo.getRe_title();
		String license  = resumeVo.getLicense();
		int    offset   = pagination.getLimitStart();
		int    pageSize = searchVo.getRecordSize();
		
		// 계산된 페이지 정보의 일부 (limitStart, recordSize)를 기준으로 리스트 데이터 조회 후 응답 데이터 변환
		List<ResumeVo> list = pagingMapper.getResumePagingList(re_id, re_title, license, offset, pageSize, user_id);
		
		
		response = new PagingResponse<>(list, pagination);
			 
		// 모델에 사용자 정보를 추가하여 홈 페이지로 전달
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("response",response);
		mv.addObject("nowpage", nowpage);
		
		mv.addObject("searchVo", searchVo);
		mv.addObject("user",userVo);
		mv.addObject("user_id", user_id);
		mv.addObject("Resumelist", Resumelist);
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
	public ModelAndView getResumeUpdate(@RequestParam(value = "nowpage", required = false) Integer nowpage, ResumeVo resumeVo) {
	    if (nowpage == null) {
	        nowpage = 1; // 기본 페이지 번호 설정
	    }
		
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
	public String submitResumeUpdate(@RequestParam(value = "nowpage", required = false) Integer nowpage, ResumeVo resumeVo) {
		System.out.println(nowpage +"-----------------------------------");
	    if (nowpage == null) {
	        nowpage = 1; // 기본 페이지 번호 설정
	    }
		
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
	    return "redirect:/Mypage/Resume";

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
	public ModelAndView getApply(int nowpage, ResumeVo resumeVo) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Long user_id =7l;
	
			UserDetails userDetails = (UserDetails) authentication.getPrincipal();
			String username = userDetails.getUsername();
			
			// UserService를 사용하여 사용자 정보를 가져옴
			UserVo userVo = loginMapper.login(username);
			 user_id = userVo.getUser_id();
			 
			 List<ResumeVo> Resumelist = mypageMapper.selectResumeList(user_id);
			 
			// 페이징
				int count = pagingMapper.count( user_id );
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
				Long   re_id    = resumeVo.getRe_id();
				String re_title = resumeVo.getRe_title();
				String license  = resumeVo.getLicense();
				int    offset   = pagination.getLimitStart();
				int    pageSize = searchVo.getRecordSize();
				
				// 계산된 페이지 정보의 일부 (limitStart, recordSize)를 기준으로 리스트 데이터 조회 후 응답 데이터 변환
				List<ResumeVo> list = pagingMapper.getResumePagingList(re_id, re_title, license, offset, pageSize, user_id);
				response = new PagingResponse<>(list, pagination);

		ModelAndView mv = new ModelAndView();
		

		mv.addObject("response",response);
		mv.addObject("nowpage", nowpage);
		mv.addObject("searchVo", searchVo);
		
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
	public ModelAndView getApplyHistory(int nowpage, ResumeVo resumeVo) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Long user_id =7l;
	
			UserDetails userDetails = (UserDetails) authentication.getPrincipal();
			String username = userDetails.getUsername();
			
			// UserService를 사용하여 사용자 정보를 가져옴
			UserVo userVo = loginMapper.login(username);
			 user_id = userVo.getUser_id();
			 
			 List<ResumeVo> Historylist = mypageMapper.selectHistory(resumeVo);
			 
			// 페이징
				int count = pagingMapper.countApplyHistory( resumeVo );
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
				String com_name  = resumeVo.getCom_name();
				String po_title  = resumeVo.getRe_title();
				Long   re_id     = resumeVo.getRe_id();
				int    offset    = pagination.getLimitStart();
				int    pageSize  = searchVo.getRecordSize();
				String result    = resumeVo.getResult();
				
				// 계산된 페이지 정보의 일부 (limitStart, recordSize)를 기준으로 리스트 데이터 조회 후 응답 데이터 변환
				List<ResumeVo> list = pagingMapper.getApplyHistoryPagingList(com_name, po_title, re_id, offset, pageSize, result, user_id);
				response = new PagingResponse<>(list, pagination);

		ModelAndView mv = new ModelAndView();

		mv.addObject("response",response);
		mv.addObject("nowpage", nowpage);
		mv.addObject("searchVo", searchVo);
		
		mv.addObject("user",userVo);
		mv.addObject("user_id", user_id);
		mv.addObject("Historylist", Historylist);
		mv.setViewName("mypage/applyHistory");
		return mv;
	}

}
