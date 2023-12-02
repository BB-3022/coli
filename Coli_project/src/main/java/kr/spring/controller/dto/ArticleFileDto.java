package kr.spring.controller.dto;

import java.util.Date;

import kr.spring.entity.Article;
import kr.spring.entity.ArticleFile;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ArticleFileDto {
	   private long file_id;
	   private String file_path;
	   private long file_size;
	   private String file_ext;
	   private String file_name;
	   private Date uploaded_at;
	   
	   
	   public ArticleFileDto articleFileDto(ArticleFile articleFile) {
		   return ArticleFileDto.builder()
				   .file_id(articleFile.getFile_id())
				   .file_path(articleFile.getFile_path().replace("\\", "\\\\"))
				   .file_size(articleFile.getFile_size())
				   .file_ext(articleFile.getFile_ext())
				   .file_name(articleFile.getFile_name())
				   .build();
	}
}
