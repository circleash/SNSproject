package com.circleash.SNS.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.circleash.SNS.common.EncryptUtils;
import com.circleash.SNS.user.dao.UserDAO;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	
	public int addUser(String loginId, String password, String name, String email) {
		
		String encryptPassword = EncryptUtils.md5(password);
		return userDAO.insertUser(loginId, password, name, email);
	}
	
	public boolean isDuplication(String loginId) {
		int count = userDAO.selectCountByLoginId(loginId);
		if(count >= 1) {
			return true;
		} else {
			return false;
		}
	}

}
