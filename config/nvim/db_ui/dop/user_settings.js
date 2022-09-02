use seervision
const user =  db.users.findOne()
const runtime_config_id = user.runtime_config_id
db.user_settings.findOne({config_id: runtime_config_id})
