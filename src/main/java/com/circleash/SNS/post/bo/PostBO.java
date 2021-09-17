package com.circleash.SNS.post.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.circleash.SNS.common.FileManagerService;
import com.circleash.SNS.post.dao.PostDAO;

@Service
public class PostBO {
	
	@Autowired
	private PostDAO postDAO;
	
	public int addPost(int userId, String content, MultipartFile file) {
		
		String imagePath = null;
		// 파일이 있을 경우에만 저장 로직 진행
		if(file != null) {
			imagePath = FileManagerService.saveFile(userId, file);
			// saveFile에서 파일 저장에 실패한 경우
			if(imagePath == null) {
				return 0;
			}
		}
		
		
		
		return postDAO.insertPost(userId, content, imagePath);
	}
}


