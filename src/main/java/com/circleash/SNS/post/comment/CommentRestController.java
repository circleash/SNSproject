package com.circleash.SNS.post.comment;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.circleash.SNS.post.comment.bo.CommentBO;

@RestController
@RequestMapping("/post/comment")
public class CommentRestController {
	
	@Autowired
	private CommentBO commentBO;
	
	@PostMapping("/create")
	public Map<String, String> comment (
			@RequestParam("postId") int postId
			,@RequestParam("content") String content
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		String name = (String)session.getAttribute("userName");
		int count = commentBO.addComment(postId, userId, name, content);
		
		Map<String, String> result = new HashMap<>();
		if (count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		return result;
	}

}
