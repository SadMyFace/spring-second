package com.myweb.www.service;

import java.util.List;

import com.myweb.www.domain.CommentVO;
import com.myweb.www.domain.PagingVO;
import com.myweb.www.handler.PagingHandler;

public interface CommentService {

	int postComment(CommentVO cvo);

	PagingHandler getList(long bno, PagingVO pgvo);

	int editComment(CommentVO cvo);

	int deleteComment(long cno);

}
