package com.myweb.www.repository;

import java.util.List;

import com.myweb.www.security.AuthVO;
import com.myweb.www.security.MemberVO;

public interface MemberDAO {

	int memberRegister(MemberVO mvo);

	MemberVO findUser(String email);

	int insertAuthInit(String string);

	MemberVO selectEmail(String username);

	List<AuthVO> selectAuths(String username);

	int updateLastLogin(String authEmail);

	int updateMember(MemberVO mvo);

	String findPassword(String email);

	List<MemberVO> getMemberList();

	int deleteMember(String email);

	int deleteAuthMember(String email);
	

}
