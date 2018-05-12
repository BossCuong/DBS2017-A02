function showClick(num)
{
	//đổi màu theo click
	switch(num) {
    case 1:
        document.getElementById("oneStar").style.color = "orange";
        document.getElementById("twoStar").style.color = "black";
        document.getElementById("threeStar").style.color = "black";
        document.getElementById("fourStar").style.color = "black";
        document.getElementById("fiveStar").style.color = "black";
        break;
    case 2:
        document.getElementById("oneStar").style.color = "orange";
        document.getElementById("twoStar").style.color = "orange";
        document.getElementById("threeStar").style.color = "black";
        document.getElementById("fourStar").style.color = "black";
        document.getElementById("fiveStar").style.color = "black";
        break;
    case 3:
        document.getElementById("oneStar").style.color = "orange";
        document.getElementById("threeStar").style.color = "orange";
        document.getElementById("twoStar").style.color = "orange";
        document.getElementById("fourStar").style.color = "black";
        document.getElementById("fiveStar").style.color = "black";
        break;
    case 4:
        document.getElementById("oneStar").style.color = "orange";
        document.getElementById("threeStar").style.color = "orange";
        document.getElementById("twoStar").style.color = "orange";
        document.getElementById("fourStar").style.color = "orange";
        document.getElementById("fiveStar").style.color = "black";
        break;
    default:
    	document.getElementById("oneStar").style.color = "orange";
        document.getElementById("threeStar").style.color = "orange";
        document.getElementById("twoStar").style.color = "orange";
        document.getElementById("fourStar").style.color = "orange";
        document.getElementById("fiveStar").style.color = "orange";
	}
}
function show(num)
{ // đổi màu star theo số
    if(num<2){
        document.getElementById("one").style.color = "orange";
        document.getElementById("two").style.color = "black";
        document.getElementById("three").style.color = "black";
        document.getElementById("four").style.color = "black";
        document.getElementById("five").style.color = "black";
      }
     else if(num<3||num==2){
        document.getElementById("one").style.color = "orange";
        document.getElementById("two").style.color = "orange";
        document.getElementById("three").style.color = "black";
        document.getElementById("four").style.color = "black";
        document.getElementById("five").style.color = "black";
     }
     else if(num<4||num==3){
        document.getElementById("one").style.color = "orange";
        document.getElementById("three").style.color = "orange";
        document.getElementById("two").style.color = "orange";
        document.getElementById("four").style.color = "black";
        document.getElementById("five").style.color = "black";
       }
    else  if(num<5||num==4){
        document.getElementById("one").style.color = "orange";
        document.getElementById("three").style.color = "orange";
        document.getElementById("two").style.color = "orange";
        document.getElementById("four").style.color = "orange";
        document.getElementById("five").style.color = "black";
    } else if(num==5){
    	document.getElementById("one").style.color = "orange";
        document.getElementById("three").style.color = "orange";
        document.getElementById("two").style.color = "orange";
        document.getElementById("four").style.color = "orange";
        document.getElementById("five").style.color = "orange";
		}
		//làm tròn 1 chữ số thập phân
		document.getElementById("tb").innerHTML='&nbsp;'+Math.round(num * 100) / 100;
}