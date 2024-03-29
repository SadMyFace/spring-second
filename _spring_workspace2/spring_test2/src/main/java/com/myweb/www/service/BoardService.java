package com.myweb.www.service;

import java.util.List;

import com.myweb.www.domain.BoardDTO;
import com.myweb.www.domain.BoardVO;
import com.myweb.www.domain.PagingVO;

public interface BoardService {

	int insert(BoardDTO bdto);

	List<BoardVO> getList(PagingVO pgvo);

	int updateReadCount(long bno);

	BoardDTO getDetail(long bno);

	int modify(BoardDTO bdto);

	int remove(int bno);

	int getTotalCount(PagingVO pgvo);

	int deleteImgae(String uuid);
	
}
