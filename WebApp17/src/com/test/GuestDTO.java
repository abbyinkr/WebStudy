/*=======================
   GuestDTO.java
   - dto 또는 vo 활용
=======================*/


package com.test;

public class GuestDTO
{
	String userName, title, content;
	// ※ 여기에서 사용하는 변수명(속성명)의 앞 두글자는
	//    소문자로 작성할 것.
	//    numScore → getNumScore() / setNumScore()
	//    nScore   → getnScore() / setnScore()
	//             → getNScore() / setNScore()
	//   와 같이 setter 가 속성명을 불러오는 과정에서
	//   인식이 어긋나는 경우가 발생할 수 있기 때문...
	
	// ※ 여기에서 사용하는 변수(속성명)는 
	//    HTML 의 form 태그에서 name 속성으로 지정할 것.
	//    그래야 속성 데이터 수신 및 속성 매핑을
	//    자동으로 처리해줄 수 있기 때문...
	
	// getter / setter 구성 
	public String getUserName()
	{
		return userName;
	}

	public void setUserName(String userName)
	{
		this.userName = userName;
	}

	public String getTitle()
	{
		return title;
	}

	public void setTitle(String title)
	{
		this.title = title;
	}

	public String getContent()
	{
		return content;
	}

	public void setContent(String content)
	{
		this.content = content;
	}
	
	
}
