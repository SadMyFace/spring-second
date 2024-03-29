package com.myweb.www.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myweb.www.domain.BoardDTO;
import com.myweb.www.domain.BoardVO;
import com.myweb.www.domain.FileVO;
import com.myweb.www.domain.PagingVO;
import com.myweb.www.repository.BoardDAO;
import com.myweb.www.repository.FileDAO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class BoardServiceImpl implements BoardService {
	private final BoardDAO bdao;
	private final FileDAO fdao;
	
	@Transactional
	@Override
	public int insert(BoardDTO bdto) {
		log.info("insert service in");
		//bvo boardMapper / flist fileMapper 등록
		int isOk = bdao.register(bdto.getBvo());
		
		if(bdto.getFlist() == null) {
			return isOk;
		}
		
		//bvo register 후 파일도 있다면...
		if(isOk > 0 && bdto.getFlist().size() > 0) {
			//bno setting
			long bno = bdao.selectOneBno(); //가장 마지막에 등록된 bno;
			for(FileVO fvo : bdto.getFlist()) {
				fvo.setBno(bno);
				isOk *= fdao.insertFile(fvo);
			}
		}
		
		return isOk;
	}

	@Override
	public List<BoardVO> getList(PagingVO pgvo) {
		
		int isOk  = bdao.updateCommentCount();
		
		if(isOk == 0) {
			log.info("getCommentCount error!!");
			return null;
		}
		
		isOk = bdao.updateFileCount();
		
		if(isOk == 0) {
			log.info("getFileCount error!!");
			return null;
		}
		
		return bdao.getList(pgvo);
	}

	@Override
	public int updateReadCount(long bno) {
		
		return bdao.updateReadCount(bno);
	}
	
	@Transactional
	@Override
	public BoardDTO getDetail(long bno) {
		
		BoardVO bvo = bdao.getDetail(bno);
		List<FileVO> flist = fdao.getFileList(bno);
		BoardDTO bdto = new BoardDTO(bvo, flist);
		return bdto;
	}
	
	@Override
	public int modify(BoardDTO bdto) {
		
		int isOk = bdao.modify(bdto.getBvo());
		
		if(bdto.getFlist() == null) {
			return isOk;
		}
		
		if(isOk > 0 && bdto.getFlist().size() > 0) {
			for(FileVO fvo : bdto.getFlist()) {
				fvo.setBno(bdto.getBvo().getBno());
				isOk *= fdao.insertFile(fvo);
			}
		}
		return isOk;
	}

	@Override
	public int remove(int bno) {
		
		return bdao.remove(bno);
	}

	@Override
	public int getTotalCount(PagingVO pgvo) {
		return bdao.getTotalCount(pgvo);
	}

	@Override
	public int deleteImgae(String uuid) {
		return fdao.deleteImage(uuid);
	}
}
