package com.circleash.SNS.post.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.circleash.SNS.common.FileManagerService;
import com.circleash.SNS.post.comment.bo.CommentBO;
import com.circleash.SNS.post.comment.model.Comment;
import com.circleash.SNS.post.dao.PostDAO;
import com.circleash.SNS.post.like.bo.LikeBO;
import com.circleash.SNS.post.model.Post;
import com.circleash.SNS.post.model.PostDetail;

@Service
public class PostBO {
	
	@Autowired
	private LikeBO likeBO;
	
	@Autowired
	private PostDAO postDAO;
	
	@Autowired
	private CommentBO commentBO;
	
	public int addPost(int userId, String name, String content, MultipartFile file) {
		
		String imagePath = null;
		// 파일이 있을 경우에만 저장 로직 진행
		if(file != null) {
			imagePath = FileManagerService.saveFile(userId, file);
			// saveFile에서 파일 저장에 실패한 경우
			if(imagePath == null) {
				return 0;
			}
		}
		
		return postDAO.insertPost(userId, name, content, imagePath);
	}
	
	public List<PostDetail> getSnsList(int userId) {
		
		List<Post> snsList = postDAO.selectSnsList();
		
		List<PostDetail> postDetailList = new ArrayList<>();
		//포스트 하나당 댓글 가져오기
		for(Post post : snsList) {
			//해당하는 포스트의 댓글 가져오기
			//commentBO로 이동 --> comment에서 만든거 여기서 사용
			List<Comment> commentList = commentBO.getCommentListByPostId(post.getId());
			// 해당하는 포스트를 현재 로그인한 사용자가 좋아요 했는지 확인
			boolean isLike = likeBO.likeByUserId(post.getId(), userId);
			
			// 해당 포스트에 좋아요 개수
			int likeCount = likeBO.likeCount(post.getId());
			
			
			
			//post와 댓글이 매칭 되어야함
			//post와 comment 두개의 값이 저장될 수 있는 클래스를 생성해야함.
			PostDetail postDetail = new PostDetail();
			postDetail.setPost(post);
			postDetail.setCommentList(commentList);
			postDetail.setLike(isLike);
			postDetail.setLikeCount(likeCount);
			
			postDetailList.add(postDetail);
				
		}
		
		return postDetailList;
	}
	
}


