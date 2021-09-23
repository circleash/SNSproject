package com.circleash.SNS.post;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.circleash.SNS.post.bo.PostBO;
import com.circleash.SNS.post.model.Post;

@Controller
@RequestMapping("/post")
public class PostController {
	@Autowired
	private PostBO postBO;
	
	@GetMapping("/create_view")
	public String createView() {
		
		return "post/createView";
	}
	
	@GetMapping("/list_view")
	public String listView(
			Model model
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		int userId = (Integer)session.getAttribute("userId");
		
		List<Post>snsList = postBO.getSnsList(userId);
		
		model.addAttribute("snsList", snsList);
		
		return "post/listView";
	}

}
