mkdir "D:\Program Files (x86)\WOWDIY\ACore\out\build\x64-Debug\bin\configs\"
mkdir "D:\Program Files (x86)\WOWDIY\ACore\out\build\x64-Release\bin\configs\"
mkdir "D:\Program Files (x86)\WOWDIY\ACore\out\build\x64-Debug\bin\configs\modules\"
mkdir "D:\Program Files (x86)\WOWDIY\ACore\out\build\x64-Release\bin\configs\modules\"

copy /Y "D:\Program Files (x86)\WOWDIY\ACore\modules\mod-challenge-modes\conf\challenge_modes.conf.dist" "D:\Program Files (x86)\WOWDIY\ACore\out\build\x64-Release\bin\configs\modules\"

copy /Y "D:\Program Files (x86)\WOWDIY\ACore\modules\mod-challenge-modes\conf\challenge_modes.conf.dist" "D:\Program Files (x86)\WOWDIY\ACore\out\build\x64-Debug\bin\configs\modules\"

copy /Y "D:\Program Files (x86)\WOWDIY\ACore\dev\配置文件\playerbots.conf.dist" "D:\Program Files (x86)\WOWDIY\ACore\out\build\x64-Release\bin\configs\modules\"
copy /Y "D:\Program Files (x86)\WOWDIY\ACore\dev\配置文件\playerbots.conf.dist" "D:\Program Files (x86)\WOWDIY\ACore\out\build\x64-Debug\bin\configs\modules\"

copy /Y "D:\Program Files (x86)\WOWDIY\ACore\dev\配置文件\mod_LuaEngine.conf.dist" "D:\Program Files (x86)\WOWDIY\ACore\out\build\x64-Release\bin\configs\modules\"
copy /Y "D:\Program Files (x86)\WOWDIY\ACore\dev\配置文件\mod_LuaEngine.conf.dist" "D:\Program Files (x86)\WOWDIY\ACore\out\build\x64-Debug\bin\configs\modules\"


copy /Y "D:\Program Files (x86)\WOWDIY\ACore\src\server\apps\authserver\authserver.conf.dist" "D:\Program Files (x86)\WOWDIY\ACore\out\build\x64-Debug\bin\configs\authserver.conf"
copy /Y "D:\Program Files (x86)\WOWDIY\ACore\src\server\apps\worldserver\worldserver.conf.dist" "D:\Program Files (x86)\WOWDIY\ACore\out\build\x64-Debug\bin\configs\worldserver.conf"


copy /Y "D:\Program Files (x86)\WOWDIY\ACore\src\server\apps\authserver\authserver.conf.dist" "D:\Program Files (x86)\WOWDIY\ACore\out\build\x64-Release\bin\configs\authserver.conf"
copy /Y "D:\Program Files (x86)\WOWDIY\ACore\src\server\apps\worldserver\worldserver.conf.dist" "D:\Program Files (x86)\WOWDIY\ACore\out\build\x64-Release\bin\configs\worldserver.conf"
