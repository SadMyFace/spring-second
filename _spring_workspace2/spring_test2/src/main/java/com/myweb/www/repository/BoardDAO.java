package com.myweb.www.repository;

import java.util.List;

import com.myweb.www.domain.BoardVO;

public interface BoardDAO {

	int register(BoardVO bvo);

	List<BoardVO> getList();

	int updateReadCount(int bno);

	BoardVO getDetail(int bno);

	int modify(BoardVO bvo);

	int remove(int bno);

}
