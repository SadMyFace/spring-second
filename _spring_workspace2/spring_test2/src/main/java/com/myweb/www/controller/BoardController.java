package com.myweb.www.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myweb.www.domain.BoardDTO;
import com.myweb.www.domain.BoardVO;
import com.myweb.www.domain.FileVO;
import com.myweb.www.domain.PagingVO;
import com.myweb.www.handler.FileHandler;
import com.myweb.www.handler.PagingHandler;
import com.myweb.www.service.BoardService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


//@RequiredArgsConstructor 선언 후
//private final로 객체 등록 => 생성자 주입
@Slf4j
@RequestMapping("/board/*")
@RequiredArgsConstructor
@Controller
public class BoardController {
	
	private final BoardService bsv;
	
	private final FileHandler fh;
	
	@GetMapping("/register")
	public void register() {}
	
	@PostMapping("/register")
	public String register(BoardVO bvo, @RequestParam(name = "files", required = false)MultipartFile[] files ) {
		log.info(">>> bvo >>> {}", bvo);
		
		List<FileVO> flist = null;
		
		//fileHandler 생성 multipartfile -> flist
		if(files[0].getSize() > 0) {
			flist = fh.uploadFiles(files);
		}
		
		int isOk = bsv.insert(new BoardDTO(bvo, flist));
		return "index";
	}
	
	@GetMapping("/list")
	public void list(Model m, PagingVO pgvo) {
		log.info(">>> PagingVO >>> {} ", pgvo);
		//페이징 처리
		List<BoardVO> list = bsv.getList(pgvo);
		//totalCount 구하기
		int totalCount = bsv.getTotalCount(pgvo);
		log.info(">>> total count >>> " + totalCount);
		PagingHandler ph = new PagingHandler(pgvo, totalCount);
		log.info(">>> ph >>> " + ph);
		
		m.addAttribute("list", list);
		m.addAttribute("ph", ph);
	}
	
	@GetMapping({"/detail", "/modify"})
	public void detail(Model m, @RequestParam("bno") int bno) {
		log.info(">>> bno >>> " + bno);
		
		int isOk = bsv.updateReadCount(bno);
		
		log.info(">>> readCount Update >>>" + ((isOk > 0) ? "OK" : "Fail"));
		
		m.addAttribute("BoardVO", bsv.getDetail(bno));
	}
	
	@PostMapping("/modify")
	public String modify(BoardVO bvo) {
		log.info(">>> bvo >>> {}", bvo);
		
		int isOk = bsv.modify(bvo);
		
		return "redirect:/board/detail?bno="+bvo.getBno();
	}
	
	@GetMapping("/remove")
	public String remove(@RequestParam("bno") int bno, RedirectAttributes re) {
		log.info(">>> bno >>> " + bno);
		
		int isOk = bsv.remove(bno);
		
		log.info(">>> remove >>>" + ((isOk > 0) ? "OK" : "Fail"));
		
		re.addFlashAttribute("isDel", isOk);
		
		return "redirect:/board/list";
	}
}
