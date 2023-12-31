package com.myweb.www.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.myweb.www.domain.BoardVO;
import com.myweb.www.domain.PagingVO;
import com.myweb.www.repository.BoardDAO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class BoardServiceImpl implements BoardService {
	private final BoardDAO bdao;

	@Override
	public int insert(BoardVO bvo) {
		log.info("insert service in");
		
		return bdao.register(bvo);
	}

	@Override
	public List<BoardVO> getList(PagingVO pgvo) {
		
		return bdao.getList(pgvo);
	}

	@Override
	public int updateReadCount(int bno) {
		
		return bdao.updateReadCount(bno);
	}

	@Override
	public BoardVO getDetail(int bno) {
		
		return bdao.getDetail(bno);
	}

	@Override
	public int modify(BoardVO bvo) {
		
		return bdao.modify(bvo);
	}

	@Override
	public int remove(int bno) {
		
		return bdao.remove(bno);
	}

	@Override
	public int getTotalCount(PagingVO pgvo) {
		return bdao.getTotalCount(pgvo);
	}
}
