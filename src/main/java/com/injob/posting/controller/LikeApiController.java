package com.injob.posting.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.injob.posting.domain.LikeVo;
import com.injob.posting.mapper.LikeMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class LikeApiController {
   
   @Autowired
   private LikeMapper likeMapper;
   
   @PostMapping("/Likes/addLike")
   
   public ResponseEntity<String> AddLike(@RequestBody LikeVo likeVo) {
   
      
       LikeVo like = likeMapper.selectLike(likeVo);
       System.out.println("11111111111111111111111111111111");
       System.out.println(like);
       System.out.println(likeVo);
       
       if(like != null) {
          System.out.println(1 + "북마크가 존재함");
          likeMapper.updateLike(like); // 그냥 bookmarkVo로 받아도 됨 근데 where문을 하나로 하고싶었음
          return ResponseEntity.ok("북마크가 존재함 update");
          
       }else {
          System.out.println(2 + "북마크가 존재안함"); // 만들어진 북마크 없다는 뜻임
          likeMapper.addLike(likeVo); //insert
          System.out.println(likeVo);
          return ResponseEntity.ok("북마크가 존재안함 insert");
       }
   }
   
   @PostMapping("/Likes/updateLike")
   
   public ResponseEntity<String> UpdateLike(@RequestBody LikeVo likeVo) {
      
      LikeVo like = likeMapper.selectLike(likeVo);
      
      System.out.println(likeVo);
      
      if(like != null) {
         System.out.println(1 + "북마크가 존재함");
         likeMapper.updateLike(like); // 그냥 bookmarkVo로 받아도 됨 근데 where문을 하나로 하고싶었음
         return ResponseEntity.ok("북마크가 존재함 update");
         
      }else {
         System.out.println(2 + "북마크가 존재안함"); // 만들어진 북마크 없다는 뜻임
         likeMapper.addLike(likeVo); //insert
         System.out.println(likeVo);
         return ResponseEntity.ok("북마크가 존재안함 insert");
      }
   }
   
   @PostMapping("/Likes/deleteLike")
   public ResponseEntity<String> DeleteLike(@RequestBody LikeVo likeVo) {
       
   LikeVo like = likeMapper.selectLike(likeVo);
       
      if(like != null) {
         likeMapper.deleteLike(like);
         return ResponseEntity.ok("delete");
         
      }else {
         return    ResponseEntity.badRequest().body("해당 북마크가 존재하지 않습니다.");
      }
       
   }
}