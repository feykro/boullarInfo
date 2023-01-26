import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = (MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom);
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Boullar'Info"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/account");
            },
            icon: const Icon(Icons.person),
          )
        ],
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2.5),
          child: Container(
            color: Colors.blue,
            height: 2.5,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight * 0.02),
            //  ==  Search bar  ==
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SizedBox(
                width: screenWidth * 0.9,
                child: TextField(
                  controller: searchFieldController,
                  onChanged: (data) {
                    //  TODO
                  },
                  decoration: InputDecoration(
                    isDense: true,
                    labelText: "Rechercher un cours",
                    prefixIcon: const Icon(Icons.search_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            //  ==  Grid view ==
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: screenWidth * 0.02,
                  mainAxisSpacing: screenWidth * 0.02,
                  children: [
                    for (int i = 0; i < 13; i++)
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/courseDetail');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue[400] ?? Colors.lightBlueAccent,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blue[100],
                          ),
                          child: Center(child: Text("Chapitre ${i + 1}")),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
