package com.myweb.www.service;

import java.util.List;

import com.myweb.www.security.MemberVO;

public interface MemberService {

	int memberRegister(MemberVO mvo);

	boolean updateLastLogin(String authEmail);

	MemberVO detail(String email);

	int updateMember(MemberVO mvo);

	String findPassword(String email);

	List<MemberVO> getMemberList();

	int deleteMember(String email);

}
