class User {
  int user_id;
  String user_name;
  String user_password;

    User(
        this.user_id,this.user_name,this.user_password
        );
    Map<String, dynamic> toJson()=>{
      'userid': user_id.toString(),
      'USERNAME': user_name.toString(),
      'PASSWORD' : user_password.toString()
    };
}