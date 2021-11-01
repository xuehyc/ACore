local lic = {}
lic.servername = 'MonSuperServeur'

lic.jokes = {
  [1] = function(player) return ""..player:GetName().." ne se sent pas bien aujourd'hui, nous pensons qu'il veux un câlin." end,
  [2] = function(player) return ""..player:GetName().." vous souhaite à tous une très bonne partie sur "..lic.servername.."." end,
  [3] = function(player) return ""..player:GetName().." pense que l'Equipe de "..lic.servername.." fait vraiement du très bon travail." end,
  [4] = function(player) return "La maman de "..player:GetName().." dit toujours que c'est pas bien de sucer son pouce pour des gens de son âge." end,
  [5] = function(player) return ""..player:GetName().." se sens tout petit... tout frêle... Quelqu'un veut bien le prendre dans ses bras ?" end,
  [6] = function(player) return ""..player:GetName().." essaie d'être une personne plus respectueuse. C'est difficile, mais il essaie, je vous jure." end,
  [7] = function(player) return ""..player:GetName().." devrais déjà être au dodo. Surtout ne dites rien à sa maman, d'accord ?" end,
  [8] = function(player) return ""..player:GetName().." pense que les gaz émis par les Taurens accélére la fonte des glaces en Norfendre." end,
  [9] = function(player) return ""..player:GetName().." sais comment reconnaitre un elfe de la nuit à un elfe de sang, d'après "..player:GetName().." la viande Kaldorei est plus dure." end,
  [10] = function(player) return ""..player:GetName().." sais pourquoi le courrier prend une heure à arriver, car d'après "..player:GetName().." il a Durotar." end,
  [11] = function(player) return "\"Ma latence descend aussi vite que le charisme de Kael'thas\" - "..player:GetName()..", 2020" end,
  [12] = function(player) return "La maman de "..player:GetName().." est si grosse que l'équipe de "..lic.servername.." à cru que Therazane s'était échappée du Tréfonds !" end,
  [13] = function(player) return "\"Si les nains ont une barbe aussi longue c'est pour garder le repas vomis d'hier, et l'hydromel vomis de demain\" - "..player:GetName()..", 2020" end,
  [14] = function(player) return "\"Si les gnomes ont inventés la cape parachute, c'est à cause de la hauteur des trottoirs de Dalaran\" - "..player:GetName()..", 2020" end,
  [15] = function(player) return ""..player:GetName().." se demande si les gnomes lépreux perdent leur bras quand ils font la 'Hola'" end,
  [16] = function(player) return ""..player:GetName().." raconte qu'il parraitrais que Vol'jin a un coffre remplis de pantalon dans son bastion. Il serais mal vu d'en porter quand on ce présente à lui.. C'est qu'il porte bien son nom." end,
  [17] = function(player) return "Depuis le jour où "..player:GetName().." a tenté de traire une Taurène, il ne bouge plus du branquart à l'infirmerie de l'auberge. C'est sûrement une allergie au lactose.." end,
}

lic.icons = {
  [":pepeabathur:"] = "|TInterface\\ICONS\\IconsChat\\pepeabathur.blp:30:30|t",
  [":pepealarak:"] = "|TInterface\\ICONS\\IconsChat\\pepealarak.blp:30:30|t",
  [":pepeally:"] = "|TInterface\\ICONS\\IconsChat\\pepeally.blp:30:30|t",
  [":pepeanubarak:"] = "|TInterface\\ICONS\\IconsChat\\pepeanubarak.blp:30:30|t",
  [":pepeartanis:"] = "|TInterface\\ICONS\\IconsChat\\pepeartanis.blp:30:30|t",
  [":pepearthas:"] = "|TInterface\\ICONS\\IconsChat\\pepearthas.blp:30:30|t",
  [":pepeasmodan:"] = "|TInterface\\ICONS\\IconsChat\\pepeasmodan.blp:30:30|t",
  [":pepeauriel:"] = "|TInterface\\ICONS\\IconsChat\\pepeauriel.blp:30:30|t",
  [":pepebaelog:"] = "|TInterface\\ICONS\\IconsChat\\pepebaelog.blp:30:30|t",
  [":pepebalafré:"] = "|TInterface\\ICONS\\IconsChat\\pepebl.blp:30:30|t",
  [":pepeblblbl:"] = "|TInterface\\ICONS\\IconsChat\\pepeblblbl.blp:30:30|t",

  [":pepebourbie:"] = "|TInterface\\ICONS\\IconsChat\\pepebourbie.blp:30:30|t",
  [":pepeception:"] = "|TInterface\\ICONS\\IconsChat\\pepeception.blp:30:30|t",
  [":pepechasseur:"] = "|TInterface\\ICONS\\IconsChat\\pepechasseur.blp:30:30|t",
  [":pepechen:"] = "|TInterface\\ICONS\\IconsChat\\pepechen.blp:30:30|t",
  [":pepechevalier:"] = "|TInterface\\ICONS\\IconsChat\\pepechevalier.blp:30:30|t",
  [":pepechogall:"] = "|TInterface\\ICONS\\IconsChat\\pepechogall.blp:30:30|t",
  [":pepechromie:"] = "|TInterface\\ICONS\\IconsChat\\pepechromie.blp:30:30|t",
  [":pepedehaka:"] = "|TInterface\\ICONS\\IconsChat\\pepedehaka.blp:30:30|t",
  [":pepedemo:"] = "|TInterface\\ICONS\\IconsChat\\pepedemo.blp:30:30|t",
  [":pepediablo:"] = "|TInterface\\ICONS\\IconsChat\\pepediablo.blp:30:30|t",
  [":pepedruide:"] = "|TInterface\\ICONS\\IconsChat\\pepedruide.blp:30:30|t",
  [":pepeElune:"] = "|TInterface\\ICONS\\IconsChat\\pepeElune.blp:30:30|t",
  [":pepefalstad:"] = "|TInterface\\ICONS\\IconsChat\\pepefalstad.blp:30:30|t",
  [":pepefox:"] = "|TInterface\\ICONS\\IconsChat\\pepefox.blp:30:30|t",
  [":pepefox2:"] = "|TInterface\\ICONS\\IconsChat\\pepefox2.blp:30:30|t",
  [":pepefox3:"] = "|TInterface\\ICONS\\IconsChat\\pepefox3.blp:30:30|t",
  [":pepefurion:"] = "|TInterface\\ICONS\\IconsChat\\pepefurion.blp:30:30|t",
  [":pepegazleu:"] = "|TInterface\\ICONS\\IconsChat\\pepegazleu.blp:30:30|t",
  [":pepegold:"] = "|TInterface\\ICONS\\IconsChat\\pepegold.blp:30:30|t",
  [":pepegrisetete:"] = "|TInterface\\ICONS\\IconsChat\\pepegrisetete.blp:30:30|t",
  [":pepeguerrier:"] = "|TInterface\\ICONS\\IconsChat\\pepeguerrier.blp:30:30|t",
  [":pepeguldan:"] = "|TInterface\\ICONS\\IconsChat\\pepeguldan.blp:30:30|t",
  [":pepehorde:"] = "|TInterface\\ICONS\\IconsChat\\pepehorde.blp:30:30|t",
  [":pepeillidan:"] = "|TInterface\\ICONS\\IconsChat\\pepeillidan.blp:30:30|t",
  [":pepeillidan2:"] = "|TInterface\\ICONS\\IconsChat\\pepeillidan2.blp:30:30|t",
  [":pepeillidemon:"] = "|TInterface\\ICONS\\IconsChat\\pepeillidemon.blp:30:30|t",
  [":pepejaina:"] = "|TInterface\\ICONS\\IconsChat\\pepejaina.blp:30:30|t",
  [":pepejohanna:"] = "|TInterface\\ICONS\\IconsChat\\pepejohanna.blp:30:30|t",
  [":pepekaelthas:"] = "|TInterface\\ICONS\\IconsChat\\pepekaelthas.blp:30:30|t",
  [":pepekerrigan:"] = "|TInterface\\ICONS\\IconsChat\\pepekerrigan.blp:30:30|t",
  [":pepekharazim:"] = "|TInterface\\ICONS\\IconsChat\\pepekharazim.blp:30:30|t",
  [":pepeleboucher:"] = "|TInterface\\ICONS\\IconsChat\\pepeleboucher.blp:30:30|t",
  [":pepeleoric:"] = "|TInterface\\ICONS\\IconsChat\\pepeleoric.blp:30:30|t",
  [":pepelichking:"] = "|TInterface\\ICONS\\IconsChat\\pepelichking.blp:30:30|t",
  [":pepelili:"] = "|TInterface\\ICONS\\IconsChat\\pepelili.blp:30:30|t",
  [":pepeliming:"] = "|TInterface\\ICONS\\IconsChat\\pepeliming.blp:30:30|t",
  [":pepeluisaile:"] = "|TInterface\\ICONS\\IconsChat\\pepeluisaile.blp:30:30|t",
  [":pepelunara:"] = "|TInterface\\ICONS\\IconsChat\\pepelunara.blp:30:30|t",
  [":pepemage:"] = "|TInterface\\ICONS\\IconsChat\\pepemage.blp:30:30|t",
  [":pepemalfurion:"] = "|TInterface\\ICONS\\IconsChat\\pepemalfurion.blp:30:30|t",
  [":pepemarteau:"] = "|TInterface\\ICONS\\IconsChat\\pepemarteau.blp:30:30|t",
  [":pepemedivh:"] = "|TInterface\\ICONS\\IconsChat\\pepemedivh.blp:30:30|t",
  [":pepemorales:"] = "|TInterface\\ICONS\\IconsChat\\pepemorales.blp:30:30|t",
  [":pepemuradin:"] = "|TInterface\\ICONS\\IconsChat\\pepemuradin.blp:30:30|t",
  [":pepenaga:"] = "|TInterface\\ICONS\\IconsChat\\pepenaga.blp:30:30|t",
  [":pepenasibo:"] = "|TInterface\\ICONS\\IconsChat\\pepenasibo.blp:30:30|t",
  [":pepenature:"] = "|TInterface\\ICONS\\IconsChat\\pepenature.blp:30:30|t",
  [":pepeninja:"] = "|TInterface\\ICONS\\IconsChat\\pepeninja.blp:30:30|t",
  [":pepenova:"] = "|TInterface\\ICONS\\IconsChat\\pepenova.blp:30:30|t",
  [":pepeOBS:"] = "|TInterface\\ICONS\\IconsChat\\pepeOBS.blp:30:30|t",
  [":pepeolaf:"] = "|TInterface\\ICONS\\IconsChat\\pepeolaf.blp:30:30|t",

  [":pepeonfire:"] = "|TInterface\\ICONS\\IconsChat\\pepeonfire.blp:30:30|t",
  [":pepeonfire_vert:"] = "|TInterface\\ICONS\\IconsChat\\pepeonfire_vert.blp:30:30|t",
  [":pepeonfire_violet:"] = "|TInterface\\ICONS\\IconsChat\\pepeonfire_violet.blp:30:30|t",
  [":pepepal:"] = "|TInterface\\ICONS\\IconsChat\\pepepal.blp:30:30|t",
  [":pepeparty:"] = "|TInterface\\ICONS\\IconsChat\\pepeparty.blp:30:30|t",
  [":peperaynor:"] = "|TInterface\\ICONS\\IconsChat\\peperaynor.blp:30:30|t",
  [":peperehgar:"] = "|TInterface\\ICONS\\IconsChat\\peperehgar.blp:30:30|t",
  [":peperexxar:"] = "|TInterface\\ICONS\\IconsChat\\peperexxar.blp:30:30|t",
  [":peperik:"] = "|TInterface\\ICONS\\IconsChat\\peperik.blp:30:30|t",
  [":peperogue:"] = "|TInterface\\ICONS\\IconsChat\\peperogue.blp:30:30|t",
  [":pepesilver:"] = "|TInterface\\ICONS\\IconsChat\\pepesilver.blp:30:30|t",
  [":pepesonya:"] = "|TInterface\\ICONS\\IconsChat\\pepesonya.blp:30:30|t",
  [":pepedruid:"] = "|TInterface\\ICONS\\IconsChat\\pepedruid.blp:30:30|t",
  [":pepedruid2:"] = "|TInterface\\ICONS\\IconsChat\\pepedruid2.blp:30:30|t",
  [":pepesylvanas:"] = "|TInterface\\ICONS\\IconsChat\\pepesylvanas.blp:30:30|t",
  [":pepetassadar:"] = "|TInterface\\ICONS\\IconsChat\\pepetassadar.blp:30:30|t",
  [":pepetc:"] = "|TInterface\\ICONS\\IconsChat\\pepetc.blp:30:30|t",
  [":pepethrall:"] = "|TInterface\\ICONS\\IconsChat\\pepethrall.blp:30:30|t",
  [":pepetracer:"] = "|TInterface\\ICONS\\IconsChat\\pepetracer.blp:30:30|t",
  [":pepetychus:"] = "|TInterface\\ICONS\\IconsChat\\pepetychus.blp:30:30|t",
  [":pepetyrael:"] = "|TInterface\\ICONS\\IconsChat\\pepetyrael.blp:30:30|t",
  [":pepetyrande:"] = "|TInterface\\ICONS\\IconsChat\\pepetyrande.blp:30:30|t",
  [":pepeuther:"] = "|TInterface\\ICONS\\IconsChat\\pepeuther.blp:30:30|t",
  [":pepevalla:"] = "|TInterface\\ICONS\\IconsChat\\pepevalla.blp:30:30|t",
  [":pepevide:"] = "|TInterface\\ICONS\\IconsChat\\pepevide.blp:30:30|t",
  [":pepeviking:"] = "|TInterface\\ICONS\\IconsChat\\pepeviking.blp:30:30|t",
  [":pepevikings:"] = "|TInterface\\ICONS\\IconsChat\\pepevikings.blp:30:30|t",
  [":pepewtf:"] = "|TInterface\\ICONS\\IconsChat\\pepewtf.blp:30:30|t",

  [":pepexul:"] = "|TInterface\\ICONS\\IconsChat\\pepexul.blp:30:30|t",
  [":pepezagara:"] = "|TInterface\\ICONS\\IconsChat\\pepezagara.blp:30:30|t",
  [":pepezandalar:"] = "|TInterface\\ICONS\\IconsChat\\pepezandalar.blp:30:30|t",
  [":pepezeratul:"] = "|TInterface\\ICONS\\IconsChat\\pepezeratul.blp:30:30|t",
  [":pepirate:"] = "|TInterface\\ICONS\\IconsChat\\pepirate.blp:30:30|t",

  [":pepeyes:"] = "|TInterface\\ICONS\\IconsChat\\pepeyes.blp:30:30|t",
  [":pepeno:"] = "|TInterface\\ICONS\\IconsChat\\pepeno.blp:30:30|t",
  [":pepewhy:"] = "|TInterface\\ICONS\\IconsChat\\pepewhy.blp:30:30|t",
  [":pepemoine:"] = "|TInterface\\ICONS\\IconsChat\\pepemoine.blp:30:30|t",
  [":hinterlands:"] = "|TInterface\\ICONS\\IconsChat\\hinterlands.blp:30:30|t",
}

lic.players = {}

function lic.onChat(event, player, msg, Type, lang, channel)
  if channel == 0 then
    if( msg:find( '#gg' ) or msg:find( '#gg ' ) )then

      if ( GetGameTime() > player:GetData( 'chat_cool' ) ) then
        SendWorldMessage( '|CFF35CFA3[|Hplayer:'..player:GetName()..'|'..lic.servername..'|h]: '..lic.jokes[math.random( 1, #lic.jokes )] (player ) )
      else
        local calc = tostring( player:GetData( 'chat_cool' ) - GetGameTime() )
        player:SendBroadcastMessage( '|CFFFF7676['..lic.servername..']: Merci d\'attendre '..calc..' seconde(s).' )
      end

    else

      for i in string.gmatch( msg, "%S+" ) do
        if ( lic.icons[i] ) then
          msg = string.gsub( msg:gsub(i, lic.icons[i]), '::', '' )
          break
        end
      end

      for i in string.gmatch( msg, "%S+" ) do
        for k , v in pairs( lic.players ) do
          if ( v == i ) then
            GetPlayerByName(string.gsub(v, '@', '')):SendBroadcastMessage( '|CFF2DAFFF[|Hplayer:'..player:GetName()..'|h'..player:GetName()..'|h] viens de vous tag dans le WorldChat' )
            msg = string.gsub( msg:gsub( i, '[|Hplayer:'..v..'|h'..v..'|h]'), '@', '' )
            break
          end
        end
      end

      if ( player:GetGMRank() > 0 ) then
        SendWorldMessage( '|CFFffbfbf['..lic.servername..'] |CFF49ced4[MJ]|r |CFFff9fa5[|Hplayer:'..player:GetName()..'|h'..player:GetName()..'|h]:|r |CFFffbfbf'..msg..'|r' )
      else
        SendWorldMessage( '|CFFffbfbf['..lic.servername..'] |CFFff9fa5[|Hplayer:'..player:GetName()..'|h'..player:GetName()..'|h]:|r |CFFffbfbf'..msg..'|r' )
      end

    end
    return false
  end
end
RegisterPlayerEvent( 22, lic.onChat )

function lic.onLogin(event, player)
  table.insert( lic.players, '@'..player:GetName() )
end
RegisterPlayerEvent( 3, lic.onLogin )

function lic.onLogout(event, player)
  for k , v in pairs( lic.players ) do
    if v == player:GetName() then
      k = nil
      break
    end
  end
end
RegisterPlayerEvent( 4, lic.onLogout )

function lic.getAll(event)
  for _, player in pairs( GetPlayersInWorld() ) do
    lic.onLogin( event, player )
  end
end
RegisterServerEvent( 33, lic.getAll )
