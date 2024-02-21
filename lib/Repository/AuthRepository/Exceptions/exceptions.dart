class SignUpWithEmailAndPasswordFailure{

final String message;

     SignUpWithEmailAndPasswordFailure([this.message="An Unknown error occurred"]);

     factory SignUpWithEmailAndPasswordFailure.code(String code){
       switch(code){
         case "weak-password":return  SignUpWithEmailAndPasswordFailure("Please enter a strong Password");
         case "invalid-email":return  SignUpWithEmailAndPasswordFailure("Email is not valid or badly formatted");
         case "email-already-in-use":return  SignUpWithEmailAndPasswordFailure("An account already exists for that email");
         case "operation-not-allowed":return  SignUpWithEmailAndPasswordFailure("Operation is not allowed.Please contact support.");
         case "user-disabled":return  SignUpWithEmailAndPasswordFailure("This user has been disabled. Please contact support");
         default:return  SignUpWithEmailAndPasswordFailure();
       }
     }


}