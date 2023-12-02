package kr.spring.controller;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.OutputStream;
import java.security.Principal;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.Base64;
import java.util.Comparator;

import kr.spring.exception.PasswordNotMatchException;
import kr.spring.repository.MyGalleryRepository;
import kr.spring.entity.Article;
import kr.spring.entity.ArticleFile;
import kr.spring.entity.Member;
import kr.spring.entity.MyGallery;
import kr.spring.service.FileUtilsService;
import kr.spring.service.MemberService;
import kr.spring.service.MyGalleryService;

@Controller
@RequestMapping("member/*")
public class MemberController {
   
   @Autowired
   private MemberService memberService;
   
   @Autowired
   private MyGalleryService myGalleryService;
   
   @Autowired
   private MyGalleryRepository myGalleryRepository;
   
   @Autowired
   private ServletContext servletContext;
   
   @GetMapping("/login")
   public String login() {
      return "member/login";
   }
   
   @PostMapping("/join")
   public String join(Member vo) {
       // 현재 시간을 가져와서 회원가입 시간으로 설정
       boolean joinResult = memberService.join(vo);
       if (joinResult) {
           return "redirect:login";
       }

       // 회원가입에 실패한 경우 로그인 페이지로 이동
       return "redirect:login";
   }
   
   @PostMapping("/login")
    public String login(Member vo, Model model, HttpSession session) {
        if (memberService.login(vo, session)) {
            // 로그인 성공
        	
            // 로그인 성공 후 수행할 작업 추가
            return "index"; // 예시로 home 페이지로 리다이렉트
        } else {
            // 로그인 실패
            // 로그인 실패 후 수행할 작업 추가
            model.addAttribute("loginFail", true); // 실패 메시지를 모델에 추가
            return "member/login";
        }
    }
      
   @GetMapping("/mypage")
   public String mypage() {
      return "member/mypage";
   }
   
   @GetMapping("/modify")
   public String modify() {
	   return "member/modify";
   }
   
   @PostMapping("/modify")
   public String modify(Member vo, Model model, HttpSession session ) {
      try {
           memberService.modify(vo, session);

           // 수정된 회원 정보를 다시 가져와서 모델에 추가
           Member updatedMember = memberService.getMemberByUsername(vo.getUsername());
           model.addAttribute("member", updatedMember);

           return "redirect:/member/mypage";
           } catch (Exception e) {
           // 수정 중 오류가 발생한 경우
           model.addAttribute("error", "회원정보 수정 중 오류가 발생했습니다.");
           return "member/mypage";
       }
   }
   
   @GetMapping("/myplan")
   public String myplan() {
	   return "member/myplan";
   }
    
   // 사진파일 불러와서 MyGallery 페이지에 출력하기
   @GetMapping("/mygallery")
   public String mygallery(Model model) {
       List<String> images = myGalleryService.getAllImages();
       model.addAttribute("images", images);
       return "member/mygallery";
   }  
}