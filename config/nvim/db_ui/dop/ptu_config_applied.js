
use seervision
const applied = db.ptu_relaunch_configs.findOne({key: "ptu_config_applied"})
db.ptu_configs.findOne(applied.ptu_config_id)
