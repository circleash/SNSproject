package com.circleash.SNS.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.circleash.SNS.common.EncryptUtils;
import com.circleash.SNS.user.dao.UserDAO;
import com.circleash.SNS.user.model.User;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	
	//private Logger logger = LoggerFactory.getLogger(this.getclass());	
	public int addUser(String loginId, String password, String name, String email) {
		//Password 암호화 
		
		String encryptPassword = EncryptUtils.md5(password);
		//if(encryptPassword.equals("")) {
		//logger.error("[UserBO signUp) 암호화 실패");
		//return 0;
		//}
		return userDAO.insertUser(loginId, encryptPassword, name, email);
		
	}
	public boolean isDuplication(String loginId) {
		int count = userDAO.selectCountByLoginId(loginId);
		if(count >= 1) {
			return true;
		} else {
			return false;
		}
	}
	//사용자 정보 다 들고올것임
	public User getUser(String loginId, String password) {
		String encryptPassword = EncryptUtils.md5(password);
		return userDAO.selectUserByLoginIdPassword(loginId, encryptPassword);
	}

}






