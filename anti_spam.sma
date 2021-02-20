#include <amxmodx>
#include <amxmisc>
#include <ColorChat>

#define PLUGIN "Anti Spamming messages"
#define VERSION "1.0"
#define AUTHOR "YYPython1^"

new wait[33]

public plugin_init() {
	register_plugin(PLUGIN, VERSION, AUTHOR)
	
	register_clcmd("say", "CmdSay")
	register_clcmd("say_team", "Cmd_TeamSay")
}

public CmdSay(id)
{
	if (cooldown[id])
	{
		ColorChat(id, GREEN, "^4[^1Anti Spam System^4] ^1You need to wait ^4 1.5 ^1seconds untill you can send another message!");
		return 1;
	}
	cooldown[id] = 1;
	set_task(1.5, "wait", id)
	return 0;
}

public Cmd_TeamSay(id)
{
	if (cooldown[id])
	{
		ColorChat(id, GREEN, "^4[^1Anti Spam System^4] ^1You need to wait ^4 1.5 ^1seconds untill you can send another message!");
		return 1;
	}
	cooldown[id] = 1;
	set_task(1.5, "wait", id)
	return 0;
}

public wait(id)
{
	cooldown[id] = 0;
	return 0;
}
