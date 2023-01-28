import 'package:boularinfo/UI/roundedButton.dart';
import 'package:boularinfo/models/locator.dart';
import 'package:boularinfo/models/loginManager.dart';
import 'package:boularinfo/utils/colors.dart';
import 'package:boularinfo/utils/formValidationUtil.dart';
import 'package:flutter/material.dart';

import 'coloredTextFormField.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController(text: locator<LoginManager>().userDetails?.email);
  TextEditingController passwordController = TextEditingController();
  String? emailValidation;
  String? connexionValidation;

  @override
  Widget build(BuildContext context) {
    final screenHeight = (MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom);
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight / 10),
            const Text(
              "Boullar'Info",
              style: TextStyle(
                fontFamily: 'Fira',
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight / 5),
            //  ===== Champ email =====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: ColoredTextFormFieldBuilder.getColoredTextFormField(
                mainColor: mainBlueColor,
                backgroundColor: lightBlueColor,
                icon: Icons.mail_outline,
                lblText: "Email",
                controller: emailController,
                onChanged: (newValue) {
                  setState(() {
                    emailValidation = FormValidationUtil.validateEmail(newValue);
                  });
                },
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            if (emailValidation != null)
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  emailValidation!,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.deepOrangeAccent,
                  ),
                ),
              ),
            SizedBox(height: screenHeight * 0.02),
            //  ===== Champ mot de passe =====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: ColoredTextFormFieldBuilder.getColoredTextFormField(
                mainColor: mainBlueColor,
                backgroundColor: lightBlueColor,
                icon: Icons.key_outlined,
                lblText: "Mot de passe",
                controller: passwordController,
                isSecret: true,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            if (connexionValidation != null)
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  connexionValidation!,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.red[800] ?? Colors.red,
                  ),
                ),
              ),
            SizedBox(height: screenHeight * 0.03),
            // =====  Connexion button  =====
            SizedBox(
              width: screenWidth * 0.8,
              child: RoundedButton(
                text: "Connexion",
                onPressed: () {
                  //  TODO: tester la validiter des champs email/password
                  if (passwordController.text.isEmpty) {
                    setState(() {
                      connexionValidation = "Le champ mot de passe doit être renseigné";
                    });
                  } else if (emailValidation == null) {
                    locator<LoginManager>()
                        .login(emailController.value.text, passwordController.value.text)
                        .then((connectionMessage) {
                      if (connectionMessage == null) {
                        Navigator.pushReplacementNamed(context, '/home');
                      } else {
                        setState(() {
                          connexionValidation = connectionMessage;
                        });
                      }
                    }).onError((error, stackTrace) {
                      setState(() {
                        connexionValidation = "Une erreur s'est produite lors de la connexion";
                      });
                    });
                  }
                },
                color: Colors.white,
                backgroundColor: mainBlueColor,
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
                hasBorder: false,
              ),
            ),
            SizedBox(height: screenWidth * 0.04),
            // ===== Password forgotten =====
            InkWell(
              onTap: () {},
              child: const Text(
                "Mot de passe oublié ?",
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: mainBlueColor,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.04),
            Container(
              height: 1,
              width: screenWidth * 0.5,
              color: Colors.grey,
            ),
            SizedBox(height: screenHeight * 0.05),
            // =====  Creation button  ======
            SizedBox(
              width: screenWidth * 0.8,
              child: RoundedButton(
                text: "Créer un compte",
                onPressed: () {
                  Navigator.pushNamed(context, '/create');
                },
                color: Colors.green[800]!,
                backgroundColor: Colors.white,
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool canSubmit() {
    if (emailValidation == null && emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      return true;
    }
    setState(() {
      if (emailValidation != null && emailController.text.isNotEmpty) {
        setState(() {
          connexionValidation = "Le champ mot de passe doit être renseigné";
        });
      } else if (emailController.text.isEmpty) {
        setState(() {
          emailValidation = "Le champ email doit être renseigné";
        });
      }
    });
    return false;
  }
}
