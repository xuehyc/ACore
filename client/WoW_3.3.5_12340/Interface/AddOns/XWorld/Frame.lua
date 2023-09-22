-- Author      : 小女孩
-- Create Date : 2023/9/22 9:01:32


function AnimationGroup1_OnLoad()
	
end

function Button1_OnClick()
	-- 0-00001 到 
	local time=time()
	local i=1
	local j=2
	while time()==time+50 and i<9	--当时间过去50 ms(?)并且i的值小于5
	do 
	time=time()
	Texture2.file="E:\资源库\热血江湖\140组动态称号合集\称号1\01_出入道门\"..i.."0-0000"..j..".png"
	i=i+1
end

function Button2_OnClick()
	
end

function SimpleHTML1_OnLoad()
	
end

function Frame1_OnLoad()
	print("Hi")
	
end
