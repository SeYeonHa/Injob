package com.injob.community.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.injob.bookmark.service.GetbookmarkService;
import com.injob.community.domain.User_boardVo;
import com.injob.community.mapper.User_boardMapper;
import com.injob.cookie.service.GetcookieService;
import com.injob.login.domain.CompanyVo;
import com.injob.login.domain.UserVo;
import com.injob.login.mapper.LoginMapper;
import com.injob.mypage.domain.AiRecommend;
import com.injob.mypage.mapper.MypageMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/Community")
public class User_boardController {
    
    @Autowired
    private User_boardMapper user_boardMapper;
    @Autowired
	private LoginMapper loginMapper;
    @Autowired
	private MypageMapper mypageMapper;
	//------------------------------------
	@Autowired
	private GetbookmarkService getbookmarkService;
	
	@Autowired
	private GetcookieService getcookieService;
	
	
	//-------------------------------------
    
    @RequestMapping("/List")
    public ModelAndView list(User_boardVo user_boardVo, HttpSession session, HttpServletRequest request){
       
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

        
        List<User_boardVo> user_boardList = user_boardMapper.getUser_boardList();


        
        ModelAndView mv = new ModelAndView();
        mv.addObject("user_boardList", user_boardList);
        mv.addObject("user_id", userId);
        mv.addObject("user", userVo);
        
        mv.setViewName("community/list");
        
        return mv;
    }
    @RequestMapping("/ComList")
    public ModelAndView ComList(User_boardVo user_boardVo, HttpSession session, HttpServletRequest request){
       
    	//--------------------------------------------------------------------------
    			
		    	Long comId = (Long) session.getAttribute("companyId");
				CompanyVo companyVo = loginMapper.idComLogin(comId);
    	//ㅇㄴㄹㅇㄴㄹ
    			Long userId = (long) 1;
    			
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

        
        List<User_boardVo> user_boardList = user_boardMapper.getUser_boardList();


        
        ModelAndView mv = new ModelAndView();
        mv.addObject("user_boardList", user_boardList);
        mv.addObject("user_id", userId);
        mv.addObject("user", userVo);
        mv.addObject("company",companyVo);
        mv.setViewName("community/list");
        
        return mv;
    }

    @RequestMapping("/WriteForm")
    public ModelAndView writeForm(HttpSession session, HttpServletRequest request) {
        
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
        
       
        ModelAndView mv = new ModelAndView();
        mv.addObject("user_id", userId);
        mv.addObject("user", userVo);
        mv.setViewName("community/write");
        return mv;
    }

    @RequestMapping("/Write")
    public ModelAndView write(User_boardVo user_boardVo, HttpSession session, HttpServletRequest request) {

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
    	
    	User_boardVo borBoardVo = user_boardVo;
    	borBoardVo.setUser_id(userId);
    	
    	System.out.println(user_boardVo);
    	System.out.println(user_boardVo);
    	System.out.println("------------");

        user_boardMapper.insertUser_board(borBoardVo);
        
        ModelAndView mv = new ModelAndView();
        mv.setViewName("redirect:/Community/List");
        mv.addObject("user_id", userId);
        mv.addObject("user", userVo);
        return mv;
    }

    @RequestMapping("/UpdateForm")
    public ModelAndView updateForm(User_boardVo user_boardVo, HttpSession session, HttpServletRequest request) {
        User_boardVo vo = user_boardMapper.getUser_board(user_boardVo); // 사용자 ID로 게시글을 조회합니다.
        
        ModelAndView mv = new ModelAndView();
        if (vo != null) {
            mv.addObject("vo", vo);
            mv.setViewName("community/update");
        } else {
            // 해당하는 게시글이 없는 경우에 대한 예외 처리
            // 예를 들어, 에러 페이지로 리다이렉트하거나 메시지를 보여줄 수 있습니다.
            mv.setViewName("redirect:error");
        }
        return mv;
    }

    @RequestMapping("/Update")
    public String update(User_boardVo user_boardVo) {
        user_boardMapper.updateUser_board(user_boardVo); // 게시글 수정
        
        // 수정된 게시글의 ID와 사용자 ID를 파라미터로 넘겨줌
        return "redirect:/Community/List?user_id=" + user_boardVo.getUser_id() + "&board_id=" + user_boardVo.getBoard_id();
    }

    @RequestMapping("/delete")
    public ModelAndView delete(User_boardVo user_boardVo, HttpSession session, HttpServletRequest request) {
        // 게시물 삭제
        user_boardMapper.deleteUser_board(user_boardVo);
        
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

        
        // 리다이렉트 URL 구성 (사용자 ID와 페이지 번호는 동적으로 설정)
        String redirectUrl = "redirect:/Community/List?user_id=" + userId + "&nowpage=1";
      
        // ModelAndView 객체 생성 후 뷰의 이름 설정하여 리다이렉트
        ModelAndView mv = new ModelAndView();
        mv.setViewName(redirectUrl);
        mv.addObject("user_id", userId);
        mv.addObject("user", userVo);
        return mv;
    }


    @RequestMapping("/View")
    public ModelAndView view(User_boardVo user_boardVo, HttpSession session, HttpServletRequest request) {
        // 조회수 증가
        user_boardMapper.incHit(user_boardVo);
        
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
        
        // 단일 게시물 조회
        User_boardVo vo = user_boardMapper.getUser_board(user_boardVo);
        ModelAndView mv = new ModelAndView();
        System.out.println("-----------");
        System.out.println("-----------");
        System.out.println("-----------");
        System.out.println(vo);
        System.out.println(vo);
        
        mv.addObject("vo", vo);
        mv.addObject("user_id", userId);
        mv.addObject("user", userVo);
        
        mv.setViewName("community/view");
        return mv;
    }

}
