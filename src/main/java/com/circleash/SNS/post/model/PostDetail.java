package com.circleash.SNS.post.model;

import java.util.List;

import com.circleash.SNS.post.comment.model.Comment;

// post와 comment 결합
// DTO, VO라고 불림.
public class PostDetail {
	
	private Post post;
	private List<Comment> commentList;
	private boolean isLike;
	private int likeCount;
	
	
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}
	public List<Comment> getCommentList() {
		return commentList;
	}
	public void setCommentList(List<Comment> commentList) {
		this.commentList = commentList;
	}
	public boolean isLike() {
		return isLike;
	}
	public void setLike(boolean isLike) {
		this.isLike = isLike;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	
}
