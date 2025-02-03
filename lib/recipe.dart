class MyRecipe {
  String label;
  String imageURL;

  MyRecipe(this.label, this.imageURL);

  static List<MyRecipe> samples = [
    // Recipe('Spaghetti and Meatballs', 'https://plus.unsplash.com/premium_photo-1664472607170-692bc1d09eb8?q=80&w=1780&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
    // Recipe('Tomato Soup', 'https://plus.unsplash.com/premium_photo-1667251759684-1b64147356d6?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
    // Recipe('Grilled Cheese', 'https://plus.unsplash.com/premium_photo-1675727577724-ee059785c087?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
    // Recipe('Chocolate Chip Cookies', 'https://plus.unsplash.com/premium_photo-1673967816735-fcbeec26553a?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
    // Recipe('Taco Salad', 'https://images.unsplash.com/photo-1547496502-affa22d38842?q=80&w=1877&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
    // Recipe('Hawaiian Pizza', 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?q=80&w=1981&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
    // now pick all above from assets
    MyRecipe('Spaghetti and Meatballs', 'assets/1.jpeg'),
    MyRecipe('Tomato Soup', 'assets/2.jpeg'),
    MyRecipe('Grilled Cheese', 'assets/3.jpeg'),
    MyRecipe('Chocolate Chip Cookies', 'assets/4.jpeg'),
    MyRecipe('Taco Salad', 'assets/5.jpeg'),
    MyRecipe('Hawaiian Pizza', 'assets/6.jpeg'),
    // Recipe('from assets', 'assets/food.jpg'),
  ];
}