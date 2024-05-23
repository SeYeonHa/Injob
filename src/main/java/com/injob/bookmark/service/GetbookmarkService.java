package com.injob.bookmark.service;

import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.injob.bookmark.mapper.BookmarkMapper;
import com.injob.mypage.domain.AiRecommend;
import com.injob.mypage.mapper.MypageMapper;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;

@Service
public class GetbookmarkService {

	@Autowired
	private BookmarkMapper bookmarkMapper;
	
	public List<AiRecommend> getBookmark(Long userId ){
		List<AiRecommend> bookList =  bookmarkMapper.getBookMarks(userId);
		
		 for (AiRecommend dayReset : bookList) {
		    	System.out.println("-----------------");
		    	System.out.println(dayReset.getPo_end_date()); //2024-06-05 LocalDate로 받으면 00:00:00빠짐
		    	System.out.println(dayReset.getPo_end_date().getDayOfMonth());//5 날짜만 가지고 올수있음
		    	

		    	 // DateTimeFormatter를 사용하여 원하는 형식으로 날짜를 포맷합니다.
		    	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM.dd (E)");
		    	    //위에 포멧형식으로 내 날짜 바꾸기
		    	    String formattedDate = dayReset.getPo_end_date().format(formatter);
		    	    dayReset.setStringDay(formattedDate); //06-05
			    	   
		    	    System.out.println(dayReset.getStringDay());//06.05 (수)
		    	    
		    	    LocalDate today = LocalDate.now();
		    	    Period period = Period.between(today, dayReset.getPo_end_date());
		    	    int daysRemaining = period.getDays();
		    	    dayReset.setDaysRemaining(daysRemaining);

		    	    System.out.println("Days remaining: " + daysRemaining);
		    	  
			}
		
		return bookList.isEmpty() ? null : bookList;
		
	}
}
