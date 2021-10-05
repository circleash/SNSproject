package com.circleash.SNS.post.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.circleash.SNS.post.comment.model.Comment;

@Repository
public interface CommentDAO {
	
	public int insertComment(
			@Param("postId") int postId
			, @Param("userId") int userId 
			, @Param("name") String name
			, @Param("content") String content);
	
	public List<Comment> selectCommentListByPostId(int postId);
	
	public int deleteCommentByPostId(
			@Param("postId") int postId);
}
