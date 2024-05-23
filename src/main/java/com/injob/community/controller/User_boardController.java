package com.injob.community.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.injob.community.domain.User_boardVo;
import com.injob.community.mapper.User_boardMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/community")
public class User_boardController {
    
    @Autowired
    private User_boardMapper user_boardMapper;
    
    @RequestMapping("/List")
    public ModelAndView list(User_boardVo user_boardVo, HttpServletRequest request){
        HttpSession session = request.getSession();
        Long userId = (Long) session.getAttribute("user_id");
        System.out.println("111111");
        List<User_boardVo> user_boardList = user_boardMapper.getUser_boardList(user_boardVo);
        System.out.println("2222222222");
        
        ModelAndView mv = new ModelAndView();
        mv.addObject("user_boardList", user_boardList);
        mv.addObject("user_id", userId);
        mv.setViewName("community/list");
        
        return mv;
    }

    @RequestMapping("/WriteForm")
    public ModelAndView writeForm(HttpServletRequest request) {
        HttpSession session = request.getSession();
        Long userId = (Long) session.getAttribute("user_id");
        
        ModelAndView mv = new ModelAndView();
        mv.addObject("user_id", userId);
        mv.setViewName("community/write");
        return mv;
    }

    @RequestMapping("/Write")
    public ModelAndView write(User_boardVo user_boardVo, HttpSession session) {
    	Long user_id = (Long) session.getAttribute("userId");
    	System.out.println("fsfs" + user_id);
    	
    	User_boardVo borBoardVo = user_boardVo;
    	borBoardVo.setUser_id(user_id);
    	
    	System.out.println(user_boardVo);
    	System.out.println(user_boardVo);
    	System.out.println("------------");
        user_boardMapper.insertUser_board(borBoardVo);
        
        ModelAndView mv = new ModelAndView();
        mv.setViewName("redirect:/community/List");
        mv.addObject("user_id", user_id);
        return mv;
    }

    @RequestMapping("/UpdateForm")
    public ModelAndView updateForm(User_boardVo user_boardVo) {
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
        return "redirect:/community/List?user_id=" + user_boardVo.getUser_id() + "&board_id=" + user_boardVo.getBoard_id();
    }

    @RequestMapping("/delete")
    public ModelAndView delete(User_boardVo user_boardVo, HttpServletRequest request) {
        // 게시물 삭제
        user_boardMapper.deleteUser_board(user_boardVo);
        
        HttpSession session = request.getSession();
        Long userId = (Long) session.getAttribute("userId");
        
        // 리다이렉트 URL 구성 (사용자 ID와 페이지 번호는 동적으로 설정)
        String redirectUrl = "redirect:/community/List?user_id=" + userId + "&nowpage=1";
      
        // ModelAndView 객체 생성 후 뷰의 이름 설정하여 리다이렉트
        ModelAndView mv = new ModelAndView();
        mv.setViewName(redirectUrl);
        return mv;
    }


    @RequestMapping("/View")
    public ModelAndView view(User_boardVo user_boardVo) {
        // 조회수 증가
        user_boardMapper.incHit(user_boardVo);
        
        // 단일 게시물 조회
        User_boardVo vo = user_boardMapper.getUser_board(user_boardVo);
        ModelAndView mv = new ModelAndView();
        System.out.println("-----------");
        System.out.println("-----------");
        System.out.println("-----------");
        System.out.println(vo);
        System.out.println(vo);
        
        mv.addObject("vo", vo);
        
        mv.setViewName("community/view");
        return mv;
    }
}
