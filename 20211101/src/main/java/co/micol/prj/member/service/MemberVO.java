package co.micol.prj.member.service;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberVO {
	private String id;
	private String password;
	private String name;
	private String address;
	private String tel;
	private String author;
	
	public MemberVO() {
		
	}
}
