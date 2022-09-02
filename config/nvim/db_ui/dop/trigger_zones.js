use seervision
const user =  db.users.findOne()
const runtime_config_id = user.runtime_config_id
const user_settings = db.user_settings.findOne({config_id: runtime_config_id})
JSON.parse(user_settings.trigger_zones)


