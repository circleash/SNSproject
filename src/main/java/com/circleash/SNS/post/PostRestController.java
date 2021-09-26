package com.circleash.SNS.post;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.circleash.SNS.post.bo.PostBO;

@RestController
@RequestMapping("/post")
public class PostRestController {
	
	@Autowired
	private PostBO postBO;
	
	@PostMapping("/create")
	public Map<String, String> create (
			@RequestParam("content") String content
			, @RequestParam("file") MultipartFile file
			, HttpServletRequest request) {
		
		//파일을 저장할때 같은 파일이름이 중복되서 파일 덮어써지거나 하는 문제 막기 위함임
		//파일을 바로 저장하는게 아닌 디렉토리를 만들어 중복을 피하려함.
		//사용자별 디렉토리 구분 --> 중복확률 다운되기 때문에 사용자 정보로 디렉토리 이름을 만드는 것
		//같은 사용자도 같은 파일 이름을 쓸수 있기 때문에 추가로 현재시간을 초로 나타내는걸 추가로 이름에 대한 문제 회피
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		String name = (String)session.getAttribute("userName");
		int count = postBO.addPost(userId, name, content, file);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		return result;
	}
	//addPost와 비슷하게 해서 저장
	//클라이언트로부터 userId 등등을 다 받아와서 코멘트를 데이터베이스에 저장하는게 목표.
	//comment BO DAO 따로 만들어서 해볼것.
	
}
