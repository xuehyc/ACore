/*
 * This file is part of the AzerothCore Project. See AUTHORS file for Copyright information
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Affero General Public License as published by the
 * Free Software Foundation; either version 3 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#include "Banner.h"
#include "GitRevision.h"
#include "StringFormat.h"

void Acore::Banner::Show(std::string_view applicationName, void(*log)(std::string_view text), void(*logExtraInfo)())
{
    log(Acore::StringFormatFmt("{} ({})", GitRevision::GetFullVersion(), applicationName));
    log("<Ctrl-C> to stop.\n");
    log("                                                      ..]]]]]]]]].                                          \n");
    log("                                        .,]/OOOOOOOOOOOOOOOOOOOOOO]`                                        \n");
    log("                                 ]OOOOOOOOOOOOOOOOOOOOOOO@OOOOOOOOOOOO]                                    \n");
    log("                           ,OOO@@@@@@@@@OOOO@OOOOOOOOOOOOOOOOOOOOOOOOOOOOO]]]]]]]`.                         \n");
    log("                       ]O@@OO@@@@@@@OOOOOOOOO@OOOO@@@@@OOOOOOOOOOOOOOOOOOOO@@O@@@@@OOOO]                    \n");
    log("                    ,O@@@@@@OOOOOOOOOOOOOOOOOOOOOOOOOOO@@@@@@@OOOOOOOOOOOO@@@@@@@@@@@@OOOO`                 \n");
    log("                 ,O@@O@OOOOOOOOOOOOOO@@@@@@@@@OOOOOOOOOOO@@@@@@@O. =OOOOOOOO@@@O@@@@@@@@@@O]               \n");
    log("               OOO@@@@@OO@OOOOOOOOO@@@@@@@@@@@@@@@OOOO@OOOOO@@@@@OO@OOOOOOOOOOOO@OO@OO@@@@@O             \n");
    log("             OO@@@@@@@@@@@@OOOOO@@@@@@OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO@OOOO@@OOOOOOOOOOOO@@@@@O           \n");
    log("           =OO@@@@@@@@@@@OO@OOOOOO@@@@@OOOOOOOOOOOOOOOOOOOO@OOOOOOOOOOOOOOOO@@OOOOOOOOOOOOOOOO@@O^         \n");
    log("          OOO@@@@@OO@OOO@OO@OOOOOOOO@@OOO@OOOOOOO@@@@@@@OOOOOOOOOOOOOOOOOOOOOOOOOO@@@OOOOOOOOOOOOOOO`       \n");
    log("        ,O@@@@@@OOOO@OOO@OOO@OOOOOO@@@OOOO@@@@@@OOOOOOOOOOOOOOOOOOOOOOOOOOOOO@OOOO@@@@@OOOOOOO@OOOOOOO      \n");
    log("       =O@@@@@@OOOOO@@OO@@OOOOOOOOOO@@@OOOOO@@@@@@@OOOOOOOOOOOOOOOOOOOOOOOOOO@@OOO@@@@@OOOOOOOOOOOOOOOO`    \n");
    log("      =OO@@@@@@OOOOO@@OO@@@OOOOOOOOOO@@@@OOOOOOO@@@@@@@OOOOOOOOOOOOOOOOOOO@@@@@OOOO@@@@OOOOOOO@@@OOOOOOO`   \n");
    log("     =OO@@@@@@O@OOOOO@@O@@@@OOOOOOOOOOO@@@OOOOOOOOOOOOO@OOOOOOOOOOOOOOOO@@@@@@@@OOO@@@@@@@@@OOO@@OOOOOOOO   \n");
    log("    =O@@@O@@@@OOOO@OOO@@@@OOOOOOOOOOOOOOO@@@OOOOOOOOOOOOOOOOOOOOOOOOOOOOO@@@@@@@OOO@@@@@/[O@@OOOOOOOOOOOO^  \n");
    log("   =@@OOO@@@@OOO@OOOOO@O@OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO@@@@@@@@O@@@@@0OO@OOOO[0OOOO@OO. \n");
    log("  ,OOOOOOOOOOOOOOOO@OOO@OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO@@@@@@@@@@@@@@@OO^. =OOOOOOOO@O` \n");
    log(" .OO/0OOO@O`OOOOO@OO@OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO@@@@@@O/..`..,[,OOOOOO@@^ \n");
    log(" =@OOOOOOO`*O@@OOOOOOOOOOOOOOOO@OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO@@@@@@OO`**...*,OOOOOO@@^   \n");
    log(".OOOOOOOO^..=O@@OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO@@@@@@@@@@@@@@@@@@@@@O^*,***,/OOOOOO@@O \n");
    log("=O@OOOOO^...,O@@@OOOOOOOO/.00OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO...*,^.,OOOO@O@^ \n");
    log("=@@@OOOO.....=OOO@@OOOOOO0`/OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO/[OOO[O`/@OOO^........*OOOOOO^ \n");
    log("=@@@@OOO.. ...0OOO@@@OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO@OO` =@OOOOOO[[[0OO0O*..*]OOOOOO. \n");
    log("=O@@@OOO..  ...=OOOO@OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO@@@@@@@@......**0O/=/0OOOOOO`  \n");
    log("=@@@@@OO..   ....0OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO@@@@@@@OOOOOOOOO`*  ... ..[`...@O`   \n");
    log(" 0O@@@OO^./OO/[`...[OOOOO.,OOOOOOOOOOOOOOOOOOO@@@@OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO@OOOOOO`*..........=/     \n");
    log("  =@@OOOO...        ..[OOO.`,0OOO@OOOOOOOOOOOOOOOOO@OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO.=.**...`.OO[       \n");
    log("   ,O@@OO.. ,.......   .,OOO..,0OOOO@@@OOOOOOOOOOOOOOOOOO@OOOOOOOOOOOOOOOOOOOOOO@@@OOOO`..*]=[`..          \n");
    log("    ,@OOO^...OOOOOOOO.`.    .,OOO...,0OOOOOOO[[[[OOOOOOOOOOOOOOOOOOOOOOOOOOOOOO@@@@@@OOOOO=^.,.[*`.]`        \n");
    log("     =OO@O0OOOOOOOOOOOO..     ...[0O]...,[OOOOO0]]*]OOOOOOOOOOOOO[[OOOOOOOOOOOOO@@@@OOO@^=0OO.,,O,OOOO      \n");
    log("     .OO@O^=^.OOOOOOOO.0O`        .............]OOOOOOOOOOOOOOOOO`......*OOOOOOOOO@@@@@OO`o.O.^...^,0OOOO` \n");
    log("     .O/O@.. OOOOOOOOO0OO.                 .,OOOOOOOOOOOOOOO^ =OOO/`...=O/`..[OO@@@@@@@@OO.O.=./O    ,0OOO\n");
    log("     =O =OO...  OOOOOOOOOO^                 ,O/.OOOOOOOOOOOOOOOO/OO/[...=^      0O@@@@@@OOO@O/OOOO.       .\n");
    log("     =`  0O.. ..0OOOOOOOO^                 ..   =OOOOOOOOOOOOOOOOOO^....=......  @@@@@OO/OO@OOOOOO^        \n");
    log("         =O^.  .,[[[[[[.                          .OOOOOOOOOOOOOO/,.  ..`... ..  O@@OOOOOOOO@OOOOOO^        \n");
    log("         .O.                                    ..,OOOOOOOOOOOOO[..   .....  .  /@@OO@OOOOOOOOOOOOO^        \n");
    log("          /. ..                                    ...[[O/[[[..       .....   ,OO@@@@@OOOOOOOOOOOOO`        \n");
    log("           .  .                                             ......   ..     ./OO@@@@@@OOOOOOOOOOOOO         \n");
    log("           ..                                             ........  ./]]]OOO@@OO@@@O@OOOOOOOOOOOOO^         \n");
    log("            ..                                          ........   /OOOOO@@@@@@@@@OOOOOOOOOOOOOOO^          \n");
    log("              .              .`                         ......  .,OOOO@@@@@@@@@@@@@@@OOOOOOOOOOO/           \n");
    log("                ..              ..........                    ./OOOOOO@@@@@@@@OO@@@@@@@@OOOOOOO/            \n");
    log("                  ...                                      .**..OOOOOO@@@@@@@@@@@O@@@@@@OOOOOO^            \n");
    log("                      ``                               ..,**....=OOOOOOO@@@@@@@@@OOO@OOOOOOO@@O            \n");
    log("                         [.`.                    ...*............OOOOOOOO@@@@@@@@@OOOOO. =OO@O^            \n");
    log("                             ,[.`.    .....]]*[`.     ..........,/OOOOOOOOO@@@@@@@@@@@OOOOO@O`             \n");
    log("                                 ,^=/..         .    ...,]OOOOOOOOOOOOOOO@OO@@@@@@OOOO[O/[                \n");
    log("                              .]OO./               .]/OOOOOOOOOOOOOOOOOOOOOOOOOOO@OOO/                     \n");
    log("                           ,/OOOO,`            ,/OOOOOOOOOOOOOOOOOOOOOOOOOOOO/`                            \n");
    log("                         ,OOOOOO`.         ,/OOOOOoooOOOOOOOOOOOOOOOOOOOOOOO`                              \n");
    log("                        /oooOOO`        ./OOoooooooooOOOOOOOOOOOOOOOOOOOOOOO                               \n");
    log("(XGirl Self Development and improvement Edition.)\n");
    log("(XCore,小女孩自研版.)\n");
    log("(Maybe God is a girl...)\n");

    log("     ACore 3.3.5a  -  https://github.com/xuehyc/ACore\n");

    if (logExtraInfo)
    {
        logExtraInfo();
    }

    log(" ");
}
