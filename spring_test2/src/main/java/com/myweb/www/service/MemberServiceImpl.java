package com.myweb.www.service;

import javax.inject.Inject;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myweb.www.repository.MemberDAO;
import com.myweb.www.security.MemberVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class MemberServiceImpl implements MemberService {
	
	private final MemberDAO mdao;
	
	@Transactional
	@Override
	public int memberRegister(MemberVO mvo) {
		
		int isOk = mdao.memberRegister(mvo);
		return mdao.insertAuthInit(mvo.getEmail());
//		MemberVO tempMvo = mdao.findUser(mvo.getEmail());
//		
//		if(tempMvo != null) {
//			return 0;
//		}
//		
//		if(mvo.getEmail() == null || mvo.getEmail().length() == 0) {
//			return 0;
//		}
//		if(mvo.getPwd() == null || mvo.getPwd().length() == 0) {
//			return 0;
//		}
//		
//		String pwd = mvo.getPwd();
//		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
//		String encodePw = passwordEncoder.encode(pwd);
//		mvo.setPwd(encodePw);
//		
//		int isOk = mdao.memberRegister(mvo);
//		
//		return isOk;
	}

	@Override
	public boolean updateLastLogin(String authEmail) {
		return mdao.updateLastLogin(authEmail) > 0 ? true : false;
	}
}
