import 'package:flutter/material.dart';
import 'recipe.dart';

class RecipeDetail extends StatefulWidget {
  final MyRecipe recipe;

  const RecipeDetail({super.key, required this.recipe});

  @override
  State<RecipeDetail> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  int sliderVal = 1;

  @override
  void initState() {
    sliderVal = widget.recipe.servings;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Light background for elegance
      appBar: AppBar(
        title: Text(
          widget.recipe.label,
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Recipe Image with rounded corners
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 2,
                    )
                  ]),
                  child: Hero(
                    tag: widget.recipe.label,
                    child: Image(
                      image: AssetImage(widget.recipe.imageURL),
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 250.0,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12.0),

              // Recipe Title
              Text(
                widget.recipe.label,
                style: const TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 6.0),

              // Servings Information
              Row(
                children: [
                  const Icon(Icons.restaurant, color: Colors.orangeAccent),
                  const SizedBox(width: 6.0),
                  Text(
                    'Servings: ${widget.recipe.servings}',
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12.0),

              // Ingredients Header
              const Text(
                "Ingredients",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 8.0),

              // Ingredients List
              Expanded(
                child: ListView.builder(
                  itemCount: widget.recipe.ingredients.length,
                  itemBuilder: (BuildContext context, int index) {
                    final ingredient = widget.recipe.ingredients[index];

                    return Card(
                      color: Colors.white,
                      margin: const EdgeInsets.symmetric(vertical: 6.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      elevation: 3,
                      child: ListTile(
                        leading: const Icon(Icons.check_circle,
                            color: Colors.orangeAccent),
                        title: Text(
                          '${ingredient.quantity} ${ingredient.measure} ${ingredient.name}',
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              RichText(text: TextSpan(
                text: 'Adjust Servings:',
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                ),
                children: [
                  TextSpan(
                    text: ' ${sliderVal * widget.recipe.servings}',
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.orangeAccent,
                    ),
                  ),
                ],
              ),),
              Slider(
                activeColor: Colors.orangeAccent,
                inactiveColor: Colors.black12,
                onChanged: (val) {
                  setState(() {
                    sliderVal = val.toInt();
                  });
                },
                min: 0,
                max: 100,
                divisions: 100,
                label: '${sliderVal * widget.recipe.servings}',
                value: sliderVal.toDouble(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
