rem ע���������,���������ı���ʽΪANSI,��Ȼ����,�޷�����ִ��

mkdir "D:\Program Files (x86)\WOWDIY\ACore\out\build\x64-Debug\bin\configs\"
mkdir "D:\Program Files (x86)\WOWDIY\ACore\out\build\x64-Release\bin\configs\"
mkdir "D:\Program Files (x86)\WOWDIY\ACore\out\build\x64-Debug\bin\configs\modules\"
mkdir "D:\Program Files (x86)\WOWDIY\ACore\out\build\x64-Release\bin\configs\modules\"

copy /Y "D:\Program Files (x86)\WOWDIY\ACore\dev\�����ļ�\playerbots.conf.dist" "D:\Program Files (x86)\WOWDIY\ACore\out\build\x64-Release\bin\configs\modules\"
copy /Y "D:\Program Files (x86)\WOWDIY\ACore\dev\�����ļ�\playerbots.conf.dist" "D:\Program Files (x86)\WOWDIY\ACore\out\build\x64-Debug\bin\configs\modules\"

copy /Y "D:\Program Files (x86)\WOWDIY\ACore\dev\�����ļ�\mod_LuaEngine.conf.dist" "D:\Program Files (x86)\WOWDIY\ACore\out\build\x64-Release\bin\configs\modules\"
copy /Y "D:\Program Files (x86)\WOWDIY\ACore\dev\�����ļ�\mod_LuaEngine.conf.dist" "D:\Program Files (x86)\WOWDIY\ACore\out\build\x64-Debug\bin\configs\modules\"


copy /Y "D:\Program Files (x86)\WOWDIY\ACore\dev\�����ļ�\authserver.conf.dist" "D:\Program Files (x86)\WOWDIY\ACore\out\build\x64-Debug\bin\configs\authserver.conf"
copy /Y "D:\Program Files (x86)\WOWDIY\ACore\dev\�����ļ�\worldserver.conf.dist" "D:\Program Files (x86)\WOWDIY\ACore\out\build\x64-Debug\bin\configs\worldserver.conf"


copy /Y "D:\Program Files (x86)\WOWDIY\ACore\dev\�����ļ�\authserver.conf.dist" "D:\Program Files (x86)\WOWDIY\ACore\out\build\x64-Release\bin\configs\authserver.conf"
copy /Y "D:\Program Files (x86)\WOWDIY\ACore\dev\�����ļ�\worldserver.conf.dist" "D:\Program Files (x86)\WOWDIY\ACore\out\build\x64-Release\bin\configs\worldserver.conf"
