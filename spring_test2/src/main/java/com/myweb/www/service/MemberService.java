package com.myweb.www.service;

import com.myweb.www.security.MemberVO;

public interface MemberService {

	int memberRegister(MemberVO mvo);

	boolean updateLastLogin(String authEmail);

}