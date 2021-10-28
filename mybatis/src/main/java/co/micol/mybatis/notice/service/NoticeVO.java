package co.micol.mybatis.notice.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NoticeVO {
	private int nid;
	private String id;
	private String name;
	private Date writeDate; //java sql 로 import
	private String title;
	private String contents;
	private int hit;
}
