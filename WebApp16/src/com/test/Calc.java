/*==================
   Calc.java
==================*/

package com.test;

public class Calc
{
	// 변수 이름을 지을 때 앞 두글자는 소문자로 짓는게 혹시 모를 에러를 방지할 수 있다.
	// 주요 속성 구성
	private int su1;			//-- 피연산자1(정수 형태)
	private String op;		//-- 연산자 (문자열 형태)
	private int su2;			//-- 피연산자2(정수 형태)
	
	
	// 사용자 정의 생성자 → 정의하지 않음 → default 생성자 자동 삽입
	
	// getter / setter 구성
	public int getSu1()
	{
		return su1;
	}
	public void setSu1(int su1)
	{
		this.su1 = su1;
	}
	public String getOp()
	{
		return op;
	}
	public void setOp(String op)
	{
		this.op = op;
	}
	public int getSu2()
	{
		return su2;
	}
	public void setSu2(int su2)
	{
		this.su2 = su2;
	}

	public String result()
	{
		String result="";
		
		int s=0;
		
		if(op!=null)
		{
			if(op.equals("+"))
				s = su1 + su2;
			else if(op.equals("-"))
				s = su1 - su2;
			else if(op.equals("*"))
				s = su1 * su2;
			else if(op.equals("/"))
				s = su1 / su2;
			
			result = String.format("%d %s %d = %d", su1, op, su2, s);
		}
		
		return result;
		
	}
	
	
}
