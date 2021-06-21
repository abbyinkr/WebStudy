

function myMenu(status)
{
	var menu = document.getElementById("menuTable");
	
	if (status==1)
	{
		menu.style.display = "block";
	}
	else
	{
		menu.style.display= "none";
	}
}

// 매개변수로 아래처럼 안만들수있도록 분개함 
/*
function myMenu1()
{}
function myMenu2()
{}
*/