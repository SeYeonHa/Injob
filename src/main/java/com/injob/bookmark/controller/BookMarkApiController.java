package com.injob.bookmark.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.injob.bookmark.domain.BookmarkVo;
import com.injob.bookmark.mapper.BookmarkMapper;
import com.injob.login.domain.UserVo;
import com.injob.login.mapper.LoginMapper;



@RestController
public class BookMarkApiController {
	
	@Autowired
	private LoginMapper loginMapper;
	
	@Autowired
	private BookmarkMapper bookmarkMapper;

	///Bookmarks/add
	@PostMapping("/Bookmarks/addBook")
	public ResponseEntity<String> AddBookMark(@RequestBody BookmarkVo bookmarkVo) {
		System.out.println(bookmarkVo);
		System.out.println(bookmarkVo); //BookmarkVo(user_id=null, po_id=1102, ub_boolean=null, ub_ubno=null)
		//user 정보 넘겨줘야지
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    String username = authentication.getName();
	    
	    System.out.println(username);
	  
	    
	    UserVo userVo = loginMapper.login(username);
	    Long userId = userVo.getUser_id();
	    System.out.println(userId); //찍어보고, 2
	    
	    bookmarkVo.setUser_id(userId); 
	    System.out.println(bookmarkVo); //BookmarkVo(user_id=2, po_id=1102, ub_boolean=null, ub_ubno=null)
	    
	    BookmarkVo book = bookmarkMapper.selectBookMark(bookmarkVo);
	    
	    if(book != null) {
	    	System.out.println(1 + "북마크가 존재안함");
	    	bookmarkMapper.updateBookMark(book); // 그냥 bookmarkVo로 받아도 됨 근데 where문을 하나로 하고싶었음
	    	
	    }else {
	    	System.out.println(2 + "북마크가 존재함"); // 만들어진 북마크 없다는 뜻임
	    	bookmarkMapper.addBookMark(bookmarkVo); //insert
	    }
	    
		
		return ResponseEntity.ok("insert");
	}
	
	@PostMapping("/Bookmarks/deleteBook")
	public ResponseEntity<String> DeleteBookMark(@RequestBody BookmarkVo bookmarkVo) {
		System.out.println("delete"+bookmarkVo); 
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    String username = authentication.getName();
	    System.out.println(username);
	    UserVo userVo = loginMapper.login(username);
	    
	    
	    Long userId = userVo.getUser_id();
	    System.out.println(userId); //찍어보고, 2
	    
	    bookmarkVo.setUser_id(userId); 
	    System.out.println(bookmarkVo);
	    
	    BookmarkVo book = bookmarkMapper.selectBookMark(bookmarkVo);
	    
	   if(book != null) {
		   bookmarkMapper.deleteBookMark(book);
		   return ResponseEntity.ok("delete");
		   
	   }else {
		   return    ResponseEntity.badRequest().body("해당 북마크가 존재하지 않습니다.");
	   }
	    
		
		
	}
	
	
}
