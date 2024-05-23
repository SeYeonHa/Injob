package com.injob.posting.controller;

import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.injob.login.domain.CompanyVo;
import com.injob.login.domain.UserVo;
import com.injob.login.mapper.LoginMapper;
import com.injob.posting.domain.JoinVo;
import com.injob.posting.domain.PostingVo;
import com.injob.posting.mapper.PostingMapper;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/Posting")
public class PostingController {
   
   @Autowired
   private PostingMapper postingMapper;
   @Autowired
   private LoginMapper loginMapper;
   
   // http://localhost:9090
   @RequestMapping("/PMain")
   public  ModelAndView   pmain(HttpSession session) {
      
      Long user_id = (Long) session.getAttribute("userId");     
      
      Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
   
       UserDetails userDetails = (UserDetails) authentication.getPrincipal();
      String username = userDetails.getUsername();
         
         // UserService를 사용하여 사용자 정보를 가져옴
      UserVo userVo = loginMapper.login(username);
       user_id = userVo.getUser_id();
       System.out.println("1111111111111111111111111111111111");
       System.out.println(user_id);
      List<JoinVo> postingList = postingMapper.getPostingList(user_id);
      int count = postingMapper.getCount();
      /*
      for(JoinVo dayReset : postingList) {
      System.out.println(dayReset.getPo_end_date());
      
      DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM.dd (E)");
      String formattedDate = dayReset.getPo_end_date().format(formatter);
      dayReset.setStringDay(formattedDate);
      System.out.println(dayReset.getStringDay());
      }*/
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy.MM.dd (E)");
           for (JoinVo dayReset : postingList) {
               System.out.println(dayReset.getPo_end_date());

               String formattedDate = dayReset.getPo_end_date().format(formatter);
               dayReset.setStringDay(formattedDate);
               System.out.println(dayReset.getStringDay());
           }
         
      ModelAndView mv = new ModelAndView();
      mv.addObject("user",userVo);
      mv.addObject("user_id", user_id);
      mv.addObject("postingList",postingList);
      mv.addObject("count",count);
      mv.setViewName("posting/pmain");
      return mv;
   }
   
   @RequestMapping("/PMainCompany")
   public  ModelAndView   pmainCompany(HttpSession session) {
      
      Long com_id = (Long) session.getAttribute("companyId");     
      
      CompanyVo companyVo = loginMapper.idComLogin(com_id);
      
      Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
   
       UserDetails userDetails = (UserDetails) authentication.getPrincipal();
      String username = userDetails.getUsername();
         
         // UserService를 사용하여 사용자 정보를 가져옴
      Long user_id = 1L;
     
       System.out.println("1111111111111111111111111111111111");
       System.out.println(com_id);
      List<JoinVo> postingList = postingMapper.getPostingList(user_id);
      int count = postingMapper.getCount();
      UserVo userVo = loginMapper.idLogin(user_id);
      /*
      for(JoinVo dayReset : postingList) {
      System.out.println(dayReset.getPo_end_date());
      
      DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM.dd (E)");
      String formattedDate = dayReset.getPo_end_date().format(formatter);
      dayReset.setStringDay(formattedDate);
      System.out.println(dayReset.getStringDay());
      }*/
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy.MM.dd (E)");
           for (JoinVo dayReset : postingList) {
               System.out.println(dayReset.getPo_end_date());

               String formattedDate = dayReset.getPo_end_date().format(formatter);
               dayReset.setStringDay(formattedDate);
               System.out.println(dayReset.getStringDay());
           }
         
      ModelAndView mv = new ModelAndView();
      mv.addObject("company",companyVo);
      mv.addObject("user",userVo);
      mv.addObject("user_id", user_id);
      mv.addObject("postingList",postingList);
      mv.addObject("count",count);
      mv.setViewName("posting/pmain");
      return mv;
   }
   
}