package com.injob.mypage.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.logging.LogManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.injob.bookmark.service.GetbookmarkService;

import com.injob.cookie.service.GetcookieService;
import com.injob.login.domain.UserVo;
import com.injob.login.mapper.LoginMapper;
import com.injob.mypage.domain.AiRecommend;
import com.injob.mypage.domain.ResumeVo;
import com.injob.mypage.mapper.MypageMapper;
import com.injob.paging.PagingMapper;
import com.injob.paging.Pagination;
import com.injob.paging.PagingResponse;
import com.injob.paging.SearchVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/Mypage")
public class MypageController {

	@Autowired
	private PagingMapper pagingMapper;
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
		
		UserVo userVo = loginMapper.idLogin(userId);
		List<AiRecommend> aiList = mypageMapper.getAiList(userId);
		
		//사이드 북마크 추천 
	    List<AiRecommend> bookList = getbookmarkService.getBookmark(userId);
	    	    
	    
	  //사이드 쿠키
	     List<Long> recentlyViewedPosting = new ArrayList<>();
		 
		 recentlyViewedPosting = getcookieService.getRecentCookie(request);
		  List<AiRecommend> recentCookies = null; // 변수를 여기서 미리 선언해둠
		 if(recentlyViewedPosting == null) {
			 System.out.println("쿠키가없어요~");
			 System.out.println("쿠키가없어요22~");
		 }else {
			  recentCookies = mypageMapper.getPostingCookie(recentlyViewedPosting);
		}
          //--------------------------------------------------------------------------

			 
		List<ResumeVo> Resumelist = mypageMapper.selectResumeList(userId);
			 
		// 페이징
		int count = pagingMapper.count( userId );
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
		List<ResumeVo> list = pagingMapper.getResumePagingList(re_id, re_title, license, offset, pageSize, userId);
		response = new PagingResponse<>(list, pagination);
			 
		// 모델에 사용자 정보를 추가하여 홈 페이지로 전달
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("response",response);
		mv.addObject("nowpage", nowpage);
		mv.addObject("searchVo", searchVo);

		mv.addObject("user_id", userId);
		mv.addObject("user", userVo);
		mv.addObject("Resumelist", Resumelist);
		//--------------------------------------------
		mv.addObject("recentCookies", recentCookies);
		mv.addObject("bookList", bookList);
		//---------------------------------------
		
		mv.setViewName("mypage/resume");

		return mv;
	}

	@RequestMapping("/ResumeView")
	public ModelAndView getResumeView(ResumeVo resumeVo, HttpSession session, HttpServletRequest request) {

		//--------------------------------------------------------------------------
				//ㅇㄴㄹㅇㄴㄹ
				Long userId = (Long) session.getAttribute("userId");
				UserVo userVo = loginMapper.idLogin(userId);
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
		
		ModelAndView mv = new ModelAndView();

		List<ResumeVo> list   = mypageMapper.selectResumeList2(resumeVo);
		List<ResumeVo> school = mypageMapper.selectSchool(resumeVo);
		List<ResumeVo> skill  = mypageMapper.selectSkill(resumeVo);

		System.out.println(skill);
		
		mv.addObject("list", list);
		mv.addObject("school", school);
		mv.addObject("skill", skill);
		mv.addObject("user_id", userId);
		mv.addObject("user", userVo);
		mv.setViewName("mypage/resumeView");
		return mv;
	}

	@RequestMapping("/ResumeWrite")
	public ModelAndView getResumeWrite(ResumeVo resumeVo, HttpSession session, HttpServletRequest request) {

		//--------------------------------------------------------------------------
				//ㅇㄴㄹㅇㄴㄹ
				Long userId = (Long) session.getAttribute("userId");
				UserVo userVo = loginMapper.idLogin(userId);
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

		ModelAndView mv = new ModelAndView();

		ResumeVo rv = mypageMapper.selectResumeList3(userId);

		mv.addObject("rv", rv);
		mv.addObject("user_id", userId);
		mv.addObject("user", userVo);
		mv.setViewName("mypage/resumeWrite");
		return mv;
	}

	@RequestMapping("/ResumeSubmit")
	public ModelAndView getResumeSubmit(ResumeVo resumeVo, HttpSession session, HttpServletRequest request) {

		//--------------------------------------------------------------------------
				//ㅇㄴㄹㅇㄴㄹ
				Long userId = (Long) session.getAttribute("userId");
				UserVo userVo = loginMapper.idLogin(userId);
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
			
		ModelAndView mv = new ModelAndView();

		mypageMapper.insertResume(resumeVo);
		Long selectLast = mypageMapper.selectMaxRe(resumeVo);
		
		String[] splitSchoolName = resumeVo.getSchool_name().split(",");
		String[] splitSchoolType = resumeVo.getSchool_type().split(",");
		
		
		
		for(int i=0; i<splitSchoolName.length;i++) {
			resumeVo.setSchool_name(splitSchoolName[i]);
			resumeVo.setSchool_type(splitSchoolType[i]);
			resumeVo.setRe_id(selectLast);
			mypageMapper.insertSchool(resumeVo);
		}
		
		
		String[] splitStack = resumeVo.getStack_name().split(",");
		
		
		for(String skill : splitStack) {
			resumeVo.setStack_name(skill);
			resumeVo.setRe_id(selectLast);
		    
			mypageMapper.insertSkill(resumeVo);
		}
		
		
		int nowpage =1;
		mv.addObject("user_id", userId);
		mv.addObject("user", userVo);
		mv.addObject("nowpage",nowpage);
		mv.setViewName("redirect:Resume");

		return mv;

	}

	@RequestMapping("/ResumeUpdate")
	public ModelAndView getResumeUpdate( HttpSession session, HttpServletRequest request, ResumeVo resumeVo) {

		//--------------------------------------------------------------------------
				//ㅇㄴㄹㅇㄴㄹ
				Long userId = (Long) session.getAttribute("userId");
				UserVo userVo = loginMapper.idLogin(userId);
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

		ModelAndView mv = new ModelAndView();

		List<ResumeVo> list = mypageMapper.selectResumeList2(resumeVo);

		List<ResumeVo> school = mypageMapper.selectSchool(resumeVo);
		List<ResumeVo> skill  = mypageMapper.selectSkill(resumeVo);

		mv.addObject("list", list);
		mv.addObject("school", school);
		mv.addObject("skill", skill);
		mv.addObject("user_id", userId);
		mv.addObject("user", userVo);
		mv.setViewName("mypage/resumeUpdate");
		return mv;

	}

	@RequestMapping("/ResumeUpdateSubmit")
	public String submitResumeUpdate(int nowpage,
			HttpSession session, HttpServletRequest request, ResumeVo resumeVo) {
	
		//--------------------------------------------------------------------------
				//ㅇㄴㄹㅇㄴㄹ
				Long userId = (Long) session.getAttribute("userId");
				UserVo userVo = loginMapper.idLogin(userId);
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

		ModelAndView mv = new ModelAndView();

		Long re_id = resumeVo.getRe_id();
		mypageMapper.updateResume(resumeVo);
		
		/*

		// SCHOOL
		String[] splitSchoolName = resumeVo.getSchool_name().split(",");
		String[] splitSchoolType = resumeVo.getSchool_type().split(",");

		if (resumeVo.getSchool_id() == null) {
			
			
		    for (int i = 0; i < splitSchoolName.length; i++) {
		        resumeVo.setSchool_name(splitSchoolName[i]);
		        resumeVo.setSchool_type(splitSchoolType[i]);
		        // 새로운 school_id를 생성하여 설정합니다.
		        Long newSchoolId = mypageMapper.getNewSchoolId(re_id);
		        resumeVo.setSchool_id(newSchoolId);
		        mypageMapper.insertSchool(resumeVo);
		    }
		} else {
		    for (int i = 0; i < splitSchoolName.length; i++) {
		        resumeVo.setSchool_name(splitSchoolName[i]);
		        resumeVo.setSchool_type(splitSchoolType[i]);
		        mypageMapper.updateSchool(resumeVo);
		    }
		}

		// SKILL (RESUME_STACK)
		String[] splitStack = resumeVo.getStack_name().split(",");

		if (resumeVo.getRe_stack_id() == null) {
		    for (String skill : splitStack) {
		        resumeVo.setStack_name(skill);
		        // 새로운 re_stack_id를 생성하여 설정합니다.
		        Long newReStackId = mypageMapper.getNewReStackId(re_id);
		        resumeVo.setRe_stack_id(newReStackId);
		        mypageMapper.insertSkill(resumeVo);
		    }
		} else {
		    for (String skill : splitStack) {
		        resumeVo.setStack_name(skill);
		        mypageMapper.updateSkill(resumeVo);
		    }
		}s
		*/
		
		
		mv.addObject("user_id", userId);
		mv.addObject("user", userVo);
	    return "redirect:/Mypage/Resume?nowpage=1";

	}

	@RequestMapping("/ResumeDelete")
	public ModelAndView getResumeDelete(ResumeVo resumeVo, HttpSession session, HttpServletRequest request) {
		

		//--------------------------------------------------------------------------
				//ㅇㄴㄹㅇㄴㄹ
				Long userId = (Long) session.getAttribute("userId");
				UserVo userVo = loginMapper.idLogin(userId);
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

		ModelAndView mv = new ModelAndView();

		mypageMapper.deleteSchool(resumeVo);
		
		mypageMapper.deleteSkill(resumeVo);
		mypageMapper.deleteApply(resumeVo);
		
		
		mypageMapper.deleteResume(resumeVo);
		mv.addObject("user_id", userId);
		mv.addObject("user", userVo);
		mv.setViewName("redirect:Resume?nowpage=1");
		return mv;

	}

	@RequestMapping("/Apply")
	public ModelAndView getApply(int nowpage, ResumeVo resumeVo, HttpSession session, HttpServletRequest request) {
		
		//--------------------------------------------------------------------------
				//ㅇㄴㄹㅇㄴㄹ
				Long userId = (Long) session.getAttribute("userId");
				UserVo userVo = loginMapper.idLogin(userId);
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
			 
			 List<ResumeVo> Resumelist = mypageMapper.selectResumeList(userId);
			 
			// 페이징
				int count = pagingMapper.count( userId );
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
				List<ResumeVo> list = pagingMapper.getResumePagingList(re_id, re_title, license, offset, pageSize, userId);
				response = new PagingResponse<>(list, pagination);

		ModelAndView mv = new ModelAndView();
		

		mv.addObject("response",response);
		mv.addObject("nowpage", nowpage);
		mv.addObject("searchVo", searchVo);
		
		mv.addObject("user_id", userId);
		mv.addObject("user", userVo);
		mv.addObject("Resumelist", Resumelist);
		mv.setViewName("mypage/apply");

		return mv;
	}

	@RequestMapping("/ApplyResume")
	public ModelAndView getApplyResume(ResumeVo resumeVo, HttpSession session, HttpServletRequest request) {
		
		//--------------------------------------------------------------------------
				//ㅇㄴㄹㅇㄴㄹ
				Long userId = (Long) session.getAttribute("userId");
				UserVo userVo = loginMapper.idLogin(userId);
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

		ModelAndView mv = new ModelAndView();

		mypageMapper.insertApply(resumeVo);
		
		mv.addObject("user_id", userId);
		mv.addObject("user", userVo);
		mv.setViewName("redirect:ApplyHistory?nowpage=1");

		return mv;
	}

	@RequestMapping("/ApplyHistory")
	public ModelAndView getApplyHistory(int nowpage, ResumeVo resumeVo, HttpSession session, HttpServletRequest request) {
		
		//--------------------------------------------------------------------------
				//ㅇㄴㄹㅇㄴㄹ
				Long userId = (Long) session.getAttribute("userId");
				UserVo userVo = loginMapper.idLogin(userId);
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
			 
			 List<ResumeVo> Historylist = mypageMapper.selectHistory(userId);
			 
			// 페이징
				int count = pagingMapper.countApplyHistory( userId );
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
				List<ResumeVo> list = pagingMapper.getApplyHistoryPagingList(com_name, po_title, re_id, offset, pageSize, result, userId);
				response = new PagingResponse<>(list, pagination);

		ModelAndView mv = new ModelAndView();

		mv.addObject("response",response);
		mv.addObject("nowpage", nowpage);
		mv.addObject("searchVo", searchVo);
		
		mv.addObject("user_id", userId);
		mv.addObject("user", userVo);
		mv.addObject("Historylist", Historylist);
		mv.setViewName("mypage/applyHistory");
		return mv;
	}

}
