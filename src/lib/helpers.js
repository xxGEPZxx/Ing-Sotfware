const bcrypt = require('bcryptjs');
const helpers = {};

helpers.encryptPassword = async (password_U) => {
   const salt = await bcrypt.genSalt(10);
   const hash = await bcrypt.hash(password_U, salt);
   return hash;
};

helpers.machPassword = async (password_U, savedPasword) => {
   try{
    return await bcrypt.compare(password_U, savedPasword);
   }catch(e){
    console.log(e);
   }   
};

module.exports = helpers;