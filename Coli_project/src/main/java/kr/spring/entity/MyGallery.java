package kr.spring.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.Data;
import lombok.ToString;

@Entity
@Data
@ToString
public class MyGallery {
	   
   @Id
   @GeneratedValue(strategy = GenerationType.IDENTITY)
   private long file_id;
   
   @ManyToOne
   @JoinColumn(name = "atc_idx", referencedColumnName = "atc_id")
   private Article atc_idx;
   
   private String file_path; // 파일 저장 경로
   
   private long file_size; // 파일 크기
   
   private String file_ext; // 파일 확장자
   
   @Column(insertable = false, updatable = false, columnDefinition = "datetime default now()")
   @Temporal(TemporalType.TIMESTAMP
		   )
   private Date uploaded_at; // 파일 업로드 시간
   
   @ManyToOne
   @JoinColumn(name="user_id", referencedColumnName="username")
   private Member user; // 파일 업로드한 사람
	 
   private String file_name;
}
