import 'package:boularinfo/UI/roundedButton.dart';
import 'package:flutter/material.dart';

class CourseDetailPage extends StatelessWidget {
  const CourseDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = (MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom);
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Chapitre X"),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.02),
              const Text(
                "Title",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              const Text(
                "Petit résumé",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Center(
                child: SizedBox(
                  width: screenWidth * 0.8,
                  child: RoundedButton(
                    text: "Télécharger le cours",
                    color: Colors.lightBlueAccent,
                    backgroundColor: Colors.white,
                    onPressed: () {},
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              const Text("Commentaires"),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: GridView.count(
                    crossAxisCount: 1,
                    children: [],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
