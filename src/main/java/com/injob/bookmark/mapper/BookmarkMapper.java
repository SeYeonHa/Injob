package com.injob.bookmark.mapper;



import org.apache.ibatis.annotations.Mapper;

import com.injob.bookmark.domain.BookmarkVo;



@Mapper
public interface BookmarkMapper {

	BookmarkVo selectBookMark(BookmarkVo bookmarkVo);

	void addBookMark(BookmarkVo bookmarkVo);

	void updateBookMark(BookmarkVo bookmarkVo);

	void deleteBookMark(BookmarkVo book);



	

}
