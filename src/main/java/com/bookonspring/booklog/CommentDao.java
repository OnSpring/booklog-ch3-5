package com.bookonspring.booklog;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface CommentDao extends JpaRepository<Comment, Integer> {

	List<Comment> findByPostId(int postId);
}
