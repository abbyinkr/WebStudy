/*========================
    FriendDTO.java
========================*/


package com.test;

public class FriendDTO
{
	
	// 주요 속성 구성(이름, 나이, 성별, 이상형)
	private String userName;					//-- 이름
    
	private String userAge;						//-- 나이
    
	private String gender;						//-- 성별
    
	private String[] lover;						//-- 이상형(들)
	//-- 이상형은 여러 개의 데이터가 동시에 전달되므로
	//   즉, 다중선택이 가능하므로 배열로 선언한다.

	public String getUserName()
	{
		return userName;
	}

	public void setUserName(String userName)
	{
		this.userName = userName;
	}

	public String getUserAge()
	{
		return userAge;
	}

	public void setUserAge(String userAge)
	{
		this.userAge = userAge;
	}

	public String getGender()
	{
		return gender;
	}

	public void setGender(String gender)
	{
		this.gender = gender;
	}

	
	public String[] getLover()
	{
		return lover;
	}
	
	public void setLover(String[] lover)
	{
		this.lover = lover;
	}
	
	
}
