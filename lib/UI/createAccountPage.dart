import 'package:boularinfo/UI/coloredTextFormField.dart';
import 'package:boularinfo/UI/roundedButton.dart';
import 'package:boularinfo/models/locator.dart';
import 'package:boularinfo/models/loginManager.dart';
import 'package:boularinfo/utils/colors.dart';
import 'package:boularinfo/utils/formValidationUtil.dart';
import 'package:flutter/material.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController classController = TextEditingController(); // TODO: get list of class from firebase
  String? prenom;
  String? nom;
  String? email;
  String? password;
  String? passwordConfirm;
  String? dropdownValue;
  String? prenomValidation;
  String? nomValidation;
  String? emailValidation;
  String? passwordValidation;
  String? passwordConfirmValidation;
  bool shouldDisplayClassHint = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = (MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom);
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Créer un compte"),
        backgroundColor: Colors.white,
        foregroundColor: mainGreenColor,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2.5),
          child: Container(
            color: mainGreenColor,
            height: 2.5,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(height: screenHeight * 0.06),
                // ===== Champ Prenom =====
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: ColoredTextFormFieldBuilder.getColoredTextFormField(
                    mainColor: mainGreenColor,
                    backgroundColor: lightGreenColor,
                    lblText: "Prenom",
                    controller: nameController,
                    onChanged: (newValue) {
                      prenom = newValue;
                      setState(() {
                        prenomValidation = FormValidationUtil.validateName(newValue);
                      });
                    },
                  ),
                ),
                if (prenomValidation != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 6.0, left: 20, right: 20),
                    child: Text(
                      prenomValidation ?? "Prenom incorrect",
                      style: const TextStyle(
                        color: Colors.deepOrangeAccent,
                      ),
                    ),
                  ),
                SizedBox(height: screenHeight * 0.02),
                // ===== Champ Nom =====
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: ColoredTextFormFieldBuilder.getColoredTextFormField(
                    mainColor: mainGreenColor,
                    backgroundColor: lightGreenColor,
                    lblText: "Nom",
                    controller: surnameController,
                    onChanged: (newValue) {
                      nom = newValue;
                      setState(() {
                        nomValidation = FormValidationUtil.validateName(newValue);
                      });
                    },
                  ),
                ),
                if (nomValidation != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 6, left: 20, right: 20),
                    child: Text(
                      nomValidation ?? "Nom incorrect",
                      style: const TextStyle(
                        color: Colors.deepOrangeAccent,
                      ),
                    ),
                  ),
                SizedBox(height: screenHeight * 0.02),
                // ===== Champ Email =====
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: ColoredTextFormFieldBuilder.getColoredTextFormField(
                      mainColor: mainGreenColor,
                      backgroundColor: lightGreenColor,
                      lblText: "Email",
                      icon: Icons.mail_outline,
                      controller: emailController,
                      onChanged: (newValue) {
                        setState(() {
                          email = newValue;
                          emailValidation = FormValidationUtil.validateEmail(newValue);
                        });
                      }),
                ),
                if (emailValidation != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 6, left: 20, right: 20),
                    child: Text(
                      emailValidation ?? "Email incorrect",
                      style: const TextStyle(
                        color: Colors.deepOrangeAccent,
                      ),
                    ),
                  ),
                SizedBox(height: screenHeight * 0.02),
                // ===== Champ Password =====
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: ColoredTextFormFieldBuilder.getColoredTextFormField(
                      mainColor: mainGreenColor,
                      backgroundColor: lightGreenColor,
                      lblText: "Mot de passe",
                      icon: Icons.key_outlined,
                      controller: passwordController,
                      isSecret: true,
                      onChanged: (newValue) {
                        setState(() {
                          password = newValue;
                          passwordValidation = FormValidationUtil.validatePassword(newValue);
                        });
                      }),
                ),
                if (passwordValidation != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 6, left: 20, right: 20),
                    child: Text(
                      passwordValidation ?? "Mot de passe trop faible",
                      style: const TextStyle(
                        color: Colors.deepOrangeAccent,
                      ),
                    ),
                  ),
                SizedBox(height: screenHeight * 0.02),
                // ===== Champ Confirm Password =====
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: ColoredTextFormFieldBuilder.getColoredTextFormField(
                      mainColor: mainGreenColor,
                      backgroundColor: lightGreenColor,
                      lblText: "Confirmez mot de passe",
                      icon: Icons.key_outlined,
                      controller: passwordConfirmController,
                      isSecret: true,
                      onChanged: (newValue) {
                        setState(() {
                          passwordConfirm = newValue;
                          passwordConfirmValidation =
                              (passwordConfirm == password) ? null : "Différent du mot de passe";
                        });
                      }),
                ),
                if (passwordConfirmValidation != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 6, left: 20, right: 20),
                    child: Text(
                      passwordConfirmValidation ?? "Confirmation incorrecte",
                      style: const TextStyle(
                        color: Colors.deepOrangeAccent,
                      ),
                    ),
                  ),
                SizedBox(height: screenHeight * 0.04),
                //  ===== Classe dropdown =====
                SizedBox(
                  width: screenWidth * 0.5,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: mainGreenColor, width: 2),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: dropdownValue,
                        hint: const Text("Classe"),
                        style: const TextStyle(color: mainGreenColor, fontSize: 15, fontWeight: FontWeight.w500),
                        iconEnabledColor: mainGreenColor,
                        onChanged: (newValue) {
                          setState(() {
                            if (newValue != null) dropdownValue = newValue;
                            shouldDisplayClassHint = false;
                          });
                        },
                        borderRadius: BorderRadius.circular(15),
                        items: const [
                          DropdownMenuItem<String>(
                            value: "Seconde",
                            child: Text("Seconde"),
                          ),
                          DropdownMenuItem<String>(
                            value: "Premiere",
                            child: Text("Premiere"),
                          ),
                          DropdownMenuItem<String>(
                            value: "Terminale",
                            child: Text("Terminale"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (shouldDisplayClassHint)
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "Vous devez selectionner une classe",
                      style: TextStyle(
                        color: Colors.deepOrangeAccent,
                      ),
                    ),
                  ),
              ],
            ),

            // ===== Bouton Confirmer =====
            Padding(
              padding: EdgeInsets.only(bottom: screenHeight * 0.03),
              child: SizedBox(
                width: screenWidth * 0.9,
                child: RoundedButton(
                  text: "Confirmer la création du compte",
                  color: Colors.white,
                  backgroundColor: mainGreenColor,
                  hasBorder: false,
                  onPressed: () async {
                    if (canCreateAccount()) {
                      locator<LoginManager>()
                          .createAccount(email!, password!, dropdownValue!, prenom!, nom!)
                          .then((value) async {
                        await _showCreationDialog();
                      });
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  bool canCreateAccount() {
    if (prenomValidation != null ||
        nomValidation != null ||
        emailValidation != null ||
        passwordValidation != null ||
        passwordConfirmValidation != null) {
      return false;
    }
    if (prenom == null) {
      setState(() {
        prenomValidation = "Ce champ ne peut pas être vide";
      });
      return false;
    }
    if (nom == null) {
      setState(() {
        nomValidation = "Ce champ ne peut pas être vide";
      });
      return false;
    }
    if (email == null) {
      setState(() {
        emailValidation = "Ce champ ne peut pas être vide";
      });
      return false;
    }
    if (password == null) {
      setState(() {
        passwordValidation = "Ce champ ne peut pas être vide";
      });
      return false;
    }
    if (passwordConfirm == null) {
      setState(() {
        passwordConfirmValidation = "Ce champ ne peut pas être vide";
      });
      return false;
    }
    if (dropdownValue == null) {
      setState(() {
        shouldDisplayClassHint = true;
      });
      return false;
    }
    return true;
  }

  Future<void> _showCreationDialog({bool wasCreated = true}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Création du compte ${wasCreated ? 'réussie' : 'échouée'}"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                if (wasCreated) const Text('Votre compte a été créé !\nVous pouvez désormais vous connecter.'),
                if (!wasCreated)
                  const Text('La création du compte a échouée !\nRééssayez plus tard ou demandez à votre prof.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'OK',
                style: TextStyle(
                  color: mainGreenColor,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
              },
            ),
          ],
        );
      },
    );
  }
}
