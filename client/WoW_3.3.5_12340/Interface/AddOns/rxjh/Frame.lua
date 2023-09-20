-- Author      : 小女孩
-- Create Date : 2023/5/10 21:34:20

function Button1_OnClick()
	Frame_char:Show();--显示角色信息界面
end

function Button2_OnClick()
	Frame_Qigong:Hide();--关闭气功窗口	
end


function Button_close_char_OnClick()
	Frame_char:Hide();--隐藏角色信息界面
end

function Button_Qigong_on_char_OnClick()--角色界面上的气功按钮
	Frame_Qigong:Show();--显示气功界面
end

function Button__Ascending_Qigong_close_OnClick()--升天气功关闭按钮
	Frame_Ascending_Qigong:Hide();--关闭升天气功界面
end

function Button_Ordinary_Qigong_OnClick()
	Texture_Ordinary_Qigong:Show();
	Texture_Ascending_Qigong:Hide();
end

function Button__Ascending_Qigong_OnClick()
	Texture_Ordinary_Qigong:Hide();
	Texture_Ascending_Qigong:Show();
end

function Button_ActionBar_close_OnClick()
	Frame_ActionBar:Hide();
end
