#include <sourcemod>
#include <shavit>
#include <multicolors>

#pragma newdecls required

stylesettings_t gA_StyleSettings[STYLE_LIMIT];

public Plugin myinfo = 
{
    name = "Scroll Style Enforcement Warning",
    author = ".sneaK",
    description = "Warns players about macro/hyperscrolling scroll modes",
    version = "1.0",
    url = "https://snksrv.com"
}

public void OnPluginStart()
{
	LoadTranslations("shavit-scroll-warning.phrases");
}

public void Shavit_OnStyleChanged(int client, int oldstyle, int newstyle, int track, bool manual)
{
	Shavit_GetStyleSettings(newstyle, gA_StyleSettings[newstyle]);
	
	if (!gA_StyleSettings[newstyle].bAutobhop)
	{
		if (IsClientConnected(client) && IsClientInGame(client))
		{
			SetGlobalTransTarget(client);
			CPrintToChat(client, "%t", "Scroll Warning");
		}
	}
}
