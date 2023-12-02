package kr.spring.controller.dto;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import kr.spring.entity.Article;
import kr.spring.entity.ArticleFile;
import kr.spring.entity.Member;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ArticleDto {
	
	private long atc_id;
	private String atc_title;
	private String atc_content;
	private LocalDateTime created_at;
	private Member writer_id;
	private int atc_likes;
	private int atc_views;
    private List<ArticleFileDto> articleFiles = new ArrayList<>();
    
    public ArticleDto articleDto(Article article) {
    	
    	List<ArticleFileDto> articleFiles = new ArrayList<ArticleFileDto>();
    	List<ArticleFile> files = article.getArticleFiles();
    	for (int i=0; i<files.size(); i++) {
    		ArticleFileDto articleFileDto = new ArticleFileDto();
    		articleFiles.add(articleFileDto.articleFileDto(files.get(i)));
    	}
    	
    	return ArticleDto.builder()
    			.atc_id(article.getAtc_id())
    			.atc_title(article.getAtc_title())
    			.atc_content(article.getAtc_content())
    			.writer_id(article.getWriter_id())
    			.atc_likes(article.getAtc_likes())
    			.atc_views(article.getAtc_views())
    			.created_at(LocalDateTime.now())
    			.articleFiles(articleFiles)
    			.build();
    }
}
