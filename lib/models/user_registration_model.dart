

class UserRegistrationModel {

  String? name;
  String? email;
  String? password;

  UserRegistrationModel({

    this.name,
    this.email,
    this.password
});


  toJson(){
   return {
     "Name":name,
     "Email":email,
     "Password":password,
  };
  }

}