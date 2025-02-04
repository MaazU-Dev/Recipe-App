import 'package:flutter/material.dart';
// import recipe.dart
import 'recipe.dart';
import 'recipe_detail.dart';

void main() {
  runApp(const Recipe());
}

class Recipe extends StatelessWidget {
  const Recipe({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe Calculator',
      theme: ThemeData(
        primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Recipe Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          widget.title,
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 2 items per row
              crossAxisSpacing: 16.0, // Space between columns
              mainAxisSpacing: 16.0, // Space between rows
            ),
            itemCount: MyRecipe.samples.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        RecipeDetail(recipe: MyRecipe.samples[index]),
                  ),
                ),
                child: buildRecipeCard(MyRecipe.samples[index]),
              );
            },
          ),
          // child: ListView.builder(
          //   itemCount: MyRecipe.samples.length,
          //   itemBuilder: (BuildContext context, int index) {
          //     return GestureDetector(
          //       onTap: () => Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => RecipeDetail(recipe: MyRecipe.samples[index]),
          //         ),
          //       ),
          //       child: buildRecipeCard(MyRecipe.samples[index]),
          //     );
          //   },
          // ),
        ),
      ),
    );
  }
}

Widget buildRecipeCard(MyRecipe recipe) {
  return Card(
    margin: const EdgeInsets.only(bottom: 16.0),
    elevation: 5.0,
    color: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    shadowColor: Colors.black.withOpacity(0.2),
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Hero(
            tag: recipe.label,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image(
                image: AssetImage(recipe.imageURL),
                fit: BoxFit.fill,
                width: double.infinity,
                height: 180.0,
              ),
            ),
          ),

          const SizedBox(height: 14.0), // Spacing below the image

          Text(
            recipe.label,
            style: const TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    ),
  );
}
