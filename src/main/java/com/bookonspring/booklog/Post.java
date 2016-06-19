package com.bookonspring.booklog;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.validation.constraints.NotNull; // ④
import javax.validation.constraints.Size; // ④

@Entity
public class Post {
	@Id
	@GeneratedValue
	int id;

	@NotNull // ①
	@Size(min = 1, max = 255) // ②
	String bookTitle;

	@NotNull
	@Size(min = 5, max = 1000) // ③
	@Column(length = 1000)
	String content;

	Date createdAt;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getBookTitle() {
		return bookTitle;
	}

	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
}
