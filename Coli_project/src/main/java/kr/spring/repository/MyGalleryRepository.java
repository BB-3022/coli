package kr.spring.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import kr.spring.entity.Member;
import kr.spring.entity.MyGallery;


@Repository
public interface MyGalleryRepository extends JpaRepository<MyGallery, Long> {
	List<MyGallery> findByUser(Member user);
	
}
