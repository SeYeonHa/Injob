package com.injob.bookmark.mapper;



import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.injob.bookmark.domain.BookmarkVo;
import com.injob.mypage.domain.AiRecommend;



@Mapper
public interface BookmarkMapper {

	BookmarkVo selectBookMark(BookmarkVo bookmarkVo);

	void addBookMark(BookmarkVo bookmarkVo);

	void updateBookMark(BookmarkVo bookmarkVo);

	void deleteBookMark(BookmarkVo book);

	List<AiRecommend> getBookMarks(Long userId);



	

}
