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
import com.circleash.SNS.post.model.PostDetail;

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
	public String listView(Model model) {
		//여기서는 session 필요없는듯 --> 선생님꺼 확인
		
		//객체화 시킨 userId를 쿼리를 통해 확인하고 List형태로 저장해주고
		List<PostDetail> snsList = postBO.getSnsList();
		
		//jsp에서 사용가능하도록 만들어주는 역할, model에 저장해서 활용
		//jsp는 모델에서 꺼내쓸수있음
		model.addAttribute("snsList", snsList);
		
		return "post/listView";
	}

}
