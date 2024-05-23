package com.injob.community.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.injob.community.domain.User_boardVo;





@Mapper
public interface User_boardMapper {

   
    void updateUser_board(User_boardVo user_boardVo);

    void insertUser_board(User_boardVo user_boardVo);

    void deleteUser_board(User_boardVo user_boardVo);

    

	void incHit(User_boardVo user_boardVo);

	List<User_boardVo> getUser_boardList(User_boardVo user_boardVo);

	User_boardVo getUser_board(User_boardVo user_boardVo);

	User_boardVo getUser_board(long boardId);

	List<User_boardVo> getUser_boardList(String user_id);

	List<User_boardVo> getUser_boardList();
}




