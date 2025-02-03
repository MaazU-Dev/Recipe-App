import 'package:flutter/material.dart';
import 'recipe.dart';


class RecipeDetail extends StatefulWidget {
  final MyRecipe recipe;

  const RecipeDetail({super.key, required this.recipe});

  @override
  State<RecipeDetail> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.label),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 300.0,
              width: double.infinity,
              // child: Image.asset(widget.recipe.imageURL, fit: BoxFit.cover),
              child: Image(image: AssetImage(widget.recipe.imageURL), fit: BoxFit.cover),
            ),
            const SizedBox(
              height: 4.0,
            ),
            Text(
              widget.recipe.label,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}