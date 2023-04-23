rem 注意此批处理,必须设置文本格式为ANSI,不然乱码,无法正常执行

mkdir "D:\Program Files (x86)\WOWDIY\ACore\out\build\x64-Debug\bin\configs\"
mkdir "D:\Program Files (x86)\WOWDIY\ACore\out\build\x64-Release\bin\configs\"
mkdir "D:\Program Files (x86)\WOWDIY\ACore\out\build\x64-Debug\bin\configs\modules\"
mkdir "D:\Program Files (x86)\WOWDIY\ACore\out\build\x64-Release\bin\configs\modules\"

copy /Y "D:\Program Files (x86)\WOWDIY\ACore\dev\配置文件\playerbots.conf.dist" "D:\Program Files (x86)\WOWDIY\ACore\out\build\x64-Release\bin\configs\modules\"
copy /Y "D:\Program Files (x86)\WOWDIY\ACore\dev\配置文件\playerbots.conf.dist" "D:\Program Files (x86)\WOWDIY\ACore\out\build\x64-Debug\bin\configs\modules\"

copy /Y "D:\Program Files (x86)\WOWDIY\ACore\dev\配置文件\mod_LuaEngine.conf.dist" "D:\Program Files (x86)\WOWDIY\ACore\out\build\x64-Release\bin\configs\modules\"
copy /Y "D:\Program Files (x86)\WOWDIY\ACore\dev\配置文件\mod_LuaEngine.conf.dist" "D:\Program Files (x86)\WOWDIY\ACore\out\build\x64-Debug\bin\configs\modules\"


copy /Y "D:\Program Files (x86)\WOWDIY\ACore\dev\配置文件\authserver.conf.dist" "D:\Program Files (x86)\WOWDIY\ACore\out\build\x64-Debug\bin\configs\authserver.conf"
copy /Y "D:\Program Files (x86)\WOWDIY\ACore\dev\配置文件\worldserver.conf.dist" "D:\Program Files (x86)\WOWDIY\ACore\out\build\x64-Debug\bin\configs\worldserver.conf"


copy /Y "D:\Program Files (x86)\WOWDIY\ACore\dev\配置文件\authserver.conf.dist" "D:\Program Files (x86)\WOWDIY\ACore\out\build\x64-Release\bin\configs\authserver.conf"
copy /Y "D:\Program Files (x86)\WOWDIY\ACore\dev\配置文件\worldserver.conf.dist" "D:\Program Files (x86)\WOWDIY\ACore\out\build\x64-Release\bin\configs\worldserver.conf"
