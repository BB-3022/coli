package kr.spring.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import kr.spring.controller.dto.ArticleDto;
import kr.spring.entity.Article;
import kr.spring.entity.ArticleFile;
import kr.spring.entity.Comment;
import kr.spring.service.ArticleFileService;
import kr.spring.service.ArticleFileServiceImpl;
import kr.spring.service.ArticleService;
import kr.spring.service.CommentService;
import kr.spring.service.FileUtilsService;

import java.io.File;
import java.time.LocalDateTime;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import org.springframework.util.FileCopyUtils;

import org.springframework.web.multipart.MultipartFile;


import kr.spring.entity.Member;
import kr.spring.repository.ArticleFileRepository;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;



@Controller
@RequestMapping("board/*")
public class BoardController {
   
   @Autowired
   private ArticleService articleService;
   
   @Autowired
   private ArticleFileService articleFileService;
   
   @Autowired
   private ArticleFileRepository articleFileRepository;
   
   @Autowired 
   private CommentService commentService;
   
   // 파일 업로드 처리
   @PostMapping("/upload")
   @ResponseBody
   public ResponseEntity<String> uploadFiles(
         HttpServletRequest request,
         @RequestParam("files") List<MultipartFile> files,
           @RequestParam("articleId") Long articleId) {
       try {
           // 글 ID를 이용하여 ArticleFile 객체에 연결
    	   // 파일을 반복하면서 업로드 처리
           for (MultipartFile file : files) {
              articleId = articleFileService.upload(articleId, request, file);
           }
           // 업로드 성공 응답
           return new ResponseEntity<>("success", HttpStatus.OK).ok().body(String.valueOf(articleId));
       } catch (Exception e) {
    	   // 예외 발생 시 오류 응답
           e.printStackTrace();
           return new ResponseEntity<>("error", HttpStatus.INTERNAL_SERVER_ERROR);
       }
   }
   
   // 게시글 작성 폼 페이지로 이동
   @GetMapping("/boardform")
   public String boardform(Model model) {
      return "board/boardform";
   }
   
   // 게시글 등록 처리
   @PostMapping("/register")
   @ResponseBody
   public ResponseEntity<Long> register(@ModelAttribute Article vo) {
      // 현재 로그인한 사용자의 아이디 가져오기   
       String writerId = getCurrentUserId();

       // vo에 writerId 설정 및 게시글 정보 설정
       Member member = new Member();
       member.setUsername(writerId);
       
       vo.setCreated_at(LocalDateTime.now());
       vo.setWriter_id(member);
       Article articleId;
       
       // 글 등록 및 등록된 글의 ID 반환
       articleId = articleService.register(vo);       
       // 글 ID를 반환
       return new ResponseEntity<>(articleId.getAtc_id(), HttpStatus.OK);
   }
   
   // 현재 로그인한 사용자의 아이디를 반환하는 보조 메소드
   private String getCurrentUserId() {
       Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
       if (authentication.getPrincipal() instanceof UserDetails) {
           UserDetails userDetails = (UserDetails) authentication.getPrincipal();
           return userDetails.getUsername(); // 사용자 아이디 반환
       }
       return null;
   }

   // 게시글 삭제 
   @GetMapping("/remove")
   public String remove(@RequestParam("atc_id")long atc_id) {
      articleService.delete(atc_id);
      return "redirect:/board/gallery";
   }
   
   // 첨부 파일 삭제
   @PostMapping("/remove/file")
   public ResponseEntity<String> removeFile(@RequestParam("file_id")long file_id) {
	   try {
		   articleFileRepository.deleteById(file_id);
	   }catch (Exception e) {
		e.printStackTrace();
		return new ResponseEntity<>("error", HttpStatus.INTERNAL_SERVER_ERROR);
	}
	   return new ResponseEntity<>("success", HttpStatus.OK).ok().body(String.valueOf(file_id));
   }
   
   // 게시글 수정 폼 페이지로 이동
   @GetMapping("/modify")
   public String modify(HttpServletRequest request,
		   @RequestParam("atc_id") long atc_id, 
		   @RequestParam("user_id") String user_id, 
		   Model model) throws Exception{
	// GET 요청으로 변경된 내용을 처리하는 코드를 작성
       Article article = articleService.Detail(atc_id);
       List<ArticleFile> articleFiles = article.getArticleFiles();
       
       for (int i =0; i<articleFiles.size(); i++) {
    	   String filepath = FileUtilsService.takeFilePath(request, articleFiles.get(i).getFile_path());
    	   articleFiles.get(i).setFile_path(filepath);
       }
       article.setArticleFiles(articleFiles);
       Member member = new Member();
       member.setUsername(user_id);
       article.setWriter_id(member);
       model.addAttribute("article", new ArticleDto().articleDto(article));
       return "board/modifyform";
   }

   // 게시글 수정
   @PostMapping("/modify")
   public ResponseEntity<String> modify(Article vo) {
	   try {
		   // 서비스를 통해 게시글 정보 업데이트
		   articleService.modify(vo);
	   }catch(Exception e) {
		   // 예외 발생 시 오류 응답
		   e.printStackTrace();
		   return new ResponseEntity<>("error", HttpStatus.INTERNAL_SERVER_ERROR);
	   }
	   // 수정 성공 응답
	   return new ResponseEntity<>("success", HttpStatus.OK).ok().body("sccuess");
   }
   
   // 게시글에 첨부된 파일 업로드 처리
   @PostMapping("/articleFileUpload")
   public String articleFileUpload(ArticleFile articleFile) {
//      articleFileService.save(articleFile);
      return "";
   }
   
   // 게시판 갤러리 페이지로 이동
   @GetMapping("/gallery")
   public String gallery(HttpServletRequest request, Model model) {
       // 게시물 목록을 가져와 모델에 추가
       List<Article> articles = articleService.getList();
       
       // 내림차순으로 정렬 (atc_id를 기준으로 최신순으로 정렬)
       articles.sort(Comparator.comparingLong(Article::getAtc_id).reversed());
       
       // 파일 경로 처리
       for (Article article : articles) {
           List<ArticleFile> articleFiles = article.getArticleFiles();
           for (ArticleFile file : articleFiles) {
        	   // 파일 경로를 실제 접근 가능한 서버 경로로 변환
               String filepath = FileUtilsService.takeFilePath(request, file.getFile_path());
               file.setFile_path(filepath);
           }
       }
       // 정렬된 게시물 모델에 추가
       model.addAttribute("articles", articles);
       return "board/gallery";
   }

   // 게시글 상세 페이지로 이동
   @GetMapping("/detail/{atc_id}")
   public String detail(@PathVariable long atc_id, Model model) {
       // GET 요청으로 변경된 내용을 처리하는 코드를 작성
	   // 선택한 게시글의 상세 정보 모델에 추가
       Article article = articleService.Detail(atc_id);
       model.addAttribute("article", article); 
       
       // 선택한 게시글에 달린 댓글을 가져와 모델에 추가
       List<Comment> comments = commentService.getCommentsByArticleId(atc_id);
       model.addAttribute("comments", comments);
       
       return "board/detail";
   }
   
   // 댓글 등록 처리
   @PostMapping("/commentRegister")
   public String commentRegister(@RequestParam("atc_id") long atc_id, @RequestParam("comment_content") String comment_content) {
       Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
       // 현재 로그인한 사용자의 아이디 가져오기   
       String username = authentication.getName(); 
       // 댓글 서비스를 이용해 댓글을 저장
       commentService.saveComment(atc_id, comment_content, username);

       // 현재 페이지로 리다이렉트
       return "board/detail/" + atc_id;
   }
   
   // 댓글 삭제
   @PostMapping("commentRemove")
   public void commentRemove(@RequestParam("cmt_id")long cmt_id) {
	   // 해당 ID 의 댓글 삭제
	   commentService.delete(cmt_id);
	   
   }
}