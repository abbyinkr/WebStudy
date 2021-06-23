/*====================
   MemberDTO.java
====================*/

package com.test.core;

public class MemberDTO
{

	private String name, tel, addr;
	
	
	// 기본 생성자 구성 → 사용자정의 생성자가 있으므로 직접 구성
	public MemberDTO()
	{
	}
	
	// 사용자정의 생성자 구성
	public MemberDTO(String name, String tel, String addr)
	{
		this.name = name;
		this.tel = tel;
		this.addr = addr;
	}

	// getter / setter 구성
	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getTel()
	{
		return tel;
	}

	public void setTel(String tel)
	{
		this.tel = tel;
	}

	public String getAddr()
	{
		return addr;
	}

	public void setAddr(String addr)
	{
		this.addr = addr;
	}
	
	
	
	
	
	
}
