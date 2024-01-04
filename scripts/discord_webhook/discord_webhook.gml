function discord_webhook(argument0, argument1) //gml_Script_discord_webhook
{
    argument0 = string(argument0)
    argument1 = string(argument1)
    var _inst = instance_create_depth(0, 0, 0, obj_dcw)
    _inst.url_id = argument0
    _inst.url_token = argument1
    with (_inst)
        event_user(0)
    return _inst;
}

