use seervision
const result = db.users.findOneAndUpdate({},{ $set: { 'password.is_enabled': false } })
const user =  db.users.findOne()
user.password.is_enabled
