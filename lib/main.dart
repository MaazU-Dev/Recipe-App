import 'package:flutter/material.dart';
// import recipe.dart
import 'recipe.dart';

void main() {
  runApp(const Recipe());
}

class Recipe extends StatelessWidget {
  const Recipe({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Calculator',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: const MyHomePage(title: 'Recipe Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title; // run time constant (final) compile time condtant (const)

  @override
  State<MyHomePage> createState() => _MyHomePageState(); // _ means private
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: MyRecipe.samples.length,
          // itemBuilder: (BuildContext context, int index) {
          //   return Text(MyRecipe.samples[index].label);
          // },
          itemBuilder: (BuildContext context, int index) {
            return buildRecipeCard(MyRecipe.samples[index]);
          },
        ),
      ),
    );
  }
}

Widget buildRecipeCard(MyRecipe recipe) {
  return Card(
    elevation: 2.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Image(image: AssetImage(recipe.imageURL)),
          // Image.asset(
          //   recipe.imageURL,
          //   fit: BoxFit.cover,
          // ),
          const SizedBox(height: 14.0),
          Text(
            recipe.label,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
              fontFamily: 'Palatino',
            ),
          ),
        ],
      ),
    ),
  );
}
