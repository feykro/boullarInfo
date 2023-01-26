
class FormValidationUtil {

  static String? validateName(String name) {
    if(name.isEmpty) {
      return "Ce champ ne peut pas être vide";
    }
    if(name.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return "Ce champ peut pas contenir de caractère spécial";
    }
    return null;
  }

  static String? validateEmail(String email) {
    if(email.isEmpty) {
      return "Ce champ ne peut pas être vide";
    }
    if (email.contains("@") && (email.contains(".fr") || email.contains(".com"))) {
      return null;
    }
    return "L'adresse email n'est pas correcte";
  }

  static String? validatePassword(String password) {
    if(password.isEmpty) {
      return "Ce champ ne peut pas être vide";
    }
    bool hasMinLength = password.length > 8;
    if(!hasMinLength) {
      return "Le mot de passe doit contenir au moins 8 caractères";
    }
    bool hasUppercase = password.contains(RegExp(r'[A-Z]'));
    bool hasLowercase = password.contains(RegExp(r'[a-z]'));
    if (! (hasUppercase && hasLowercase)){
      return "Le mot de passe doit contenir au moins une majuscule et une miniscule";
    }
    bool hasDigits = password.contains(RegExp(r'[0-9]'));
    if(!hasDigits) {
      return "Le mot de passe doit contenir au moins un chiffre";
    }
    bool hasSpecialCharacters = password.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    if(!hasSpecialCharacters) {
      return "Le mot de passe doit contenir au moins un caractère spécial";
    }
    return null;
  }
}