import 'package:boularinfo/UI/roundedButton.dart';
import 'package:flutter/material.dart';

class UserAccountPage extends StatelessWidget {
  const UserAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = (MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom);
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mon compte"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(height: screenHeight * 0.02),
                Padding(
                  padding: const EdgeInsets.only(left: 58, right: 44),
                  child: TextFormField(
                    //controller: nameController,
                    initialValue: "Maxime",
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Prenom',
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Padding(
                  padding: const EdgeInsets.only(left: 58, right: 44),
                  child: TextFormField(
                    //controller: surnameController,
                    initialValue: "Boullard",
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Nom',
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 44),
                  child: TextFormField(
                    //  TODO: validator
                    //controller: emailController,
                    initialValue: "maxime.boullard@yopmail.com",
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      icon: Icon(Icons.mail_outline),
                      labelText: 'Email',
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  width: screenWidth * 0.9,
                  child: RoundedButton(
                    text: "Me déconnecter",
                    color: Colors.red[900] ?? Colors.red,
                    backgroundColor: Colors.white,
                    onPressed: () {
                      //  TODO: logout
                      Navigator.pop(context);
                      Navigator.pushReplacementNamed(context, "/login");
                    },
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
