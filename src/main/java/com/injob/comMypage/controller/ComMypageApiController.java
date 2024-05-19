package com.injob.comMypage.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;


import com.injob.comMypage.domain.PostVo;
import com.injob.comMypage.mapper.ComMypageMapper;
import com.injob.login.domain.UserVo;
import com.injob.login.mapper.LoginMapper;

@RestController
public class ComMypageApiController {

	@Autowired
	private ComMypageMapper comMypageMapper;
	@Autowired
	private LoginMapper loginMapper;

	@PostMapping("/ComMypage/PassResult")
	public ResponseEntity<String> PassResult(@RequestBody PostVo postVo) {
		
		System.out.println(postVo);
		System.out.println(postVo); //BookmarkVo(user_id=null, po_id=1102, ub_boolean=null, ub_ubno=null)
		//user 정보 넘겨줘야지
		
		/*
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    String username = authentication.getName();

	    UserVo userVo = loginMapper.login(username);
	    Long userId = userVo.getUser_id();
	    System.out.println(userId); //찍어보고, 2
	    */
		Long com_id = (long) 1;
	    
	    postVo.setCom_id(com_id); 
	    
	    PostVo result = comMypageMapper.selectResult(postVo);
	    
	    if ("진행중".equals(result.getResult())) {
	        System.out.println(result.getAp_id() + "번 지원서 합격 처리완료");
	        comMypageMapper.updatePassResult(result);
	        return ResponseEntity.ok("합격 처리 완료");
	    } else {
	        System.out.println(2 + "완료 처리된 지원 이력서");
	        return ResponseEntity.ok("완료 처리된 지원 이력서");
	    }

	}
	
	@PostMapping("/ComMypage/FailResult")
	public ResponseEntity<String> FailResult(@RequestBody PostVo postVo) {
		
		System.out.println(postVo);
		System.out.println(postVo); //BookmarkVo(user_id=null, po_id=1102, ub_boolean=null, ub_ubno=null)
		//user 정보 넘겨줘야지
		
		/*
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    String username = authentication.getName();

	    UserVo userVo = loginMapper.login(username);
	    Long userId = userVo.getUser_id();
	    System.out.println(userId); //찍어보고, 2
		 */
		Long com_id = (long) 1;
		
		postVo.setCom_id(com_id); 
		
		PostVo result = comMypageMapper.selectResult(postVo);
		
		
		 if ("진행중".equals(result.getResult())) {
		        System.out.println(result.getAp_id() + "번 지원서 불합격 처리완료");
		        comMypageMapper.updateFailResult(result);
		        return ResponseEntity.ok("불합격 처리완료1111");
		    } else {
		        System.out.println(2 + "완료 처리된 지원 이력서");
		        return ResponseEntity.ok("완료 처리된 지원 이력서");
		    }
		
	}
	
	@GetMapping("/comMypage/overall/load")
	public ResponseEntity<List<PostVo>> LoadResult(){
		/*
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    String username = authentication.getName();
	    System.out.println(username);
	    UserVo userVo = loginMapper.login(username);
	    
	    
	    Long userId = userVo.getUser_id();
		*/
		Long com_id = (long) 1;
		
		List<PostVo> result = comMypageMapper.getResult(com_id);
		
		return new ResponseEntity<>(result, HttpStatus.OK);
	}

}
