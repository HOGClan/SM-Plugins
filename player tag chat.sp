#include <sourcemod>
#include <multicolors>

public Plugin myinfo =
{
name = "HOG Player Tag",
author = "Temur (https://github.com/HOGClan)",
description = "Adds a [Player] tag to player's name in chat",
version = "1.0",
url = "https://github.com/HOGClan"
};

char g_sTag[] = "[Player]";

public OnPluginStart()
{
RegConsoleCmd("say", Command_Say);
}

public Action Command_Say(client, args)
{
char sMessage[256];
GetCmdArgString(sMessage, sizeof(sMessage));

char sClientName[64];
GetClientName(client, sClientName, sizeof(sClientName));

// Remove quotes from the message
StripQuotes(sMessage);

// Add the colored tag to the player's name
CPrintToChatAll("{green}%s {blue}%s: {default}%s", g_sTag, sClientName, sMessage);

return Plugin_Handled;
}
