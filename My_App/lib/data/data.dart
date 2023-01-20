import '../models/cateories_model.dart';

String apiKEY = "[API_KEY]";

List<CategorieModel> getCategories() {
  List<CategorieModel> categories = [];
  CategorieModel categorieModel = new CategorieModel();

  //
  categorieModel.imgUrl =
  "https://images.pexels.com/photos/545008/pexels-photo-545008.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categorieModel.categorieName = "Abstract";
  categories.add(categorieModel);
  categorieModel = new CategorieModel();

  //
  categorieModel.imgUrl =
  "https://images.pexels.com/photos/704320/pexels-photo-704320.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categorieModel.categorieName = "Animals";
  categories.add(categorieModel);
  categorieModel = new CategorieModel();

  //
  categorieModel.imgUrl =
  "https://images.pexels.com/photos/34950/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categorieModel.categorieName = "Nature";
  categories.add(categorieModel);
  categorieModel = new CategorieModel();

  //
  categorieModel.imgUrl =
  "https://images.pexels.com/photos/466685/pexels-photo-466685.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categorieModel.categorieName = "Artistic";
  categories.add(categorieModel);
  categorieModel = new CategorieModel();

  //
  categorieModel.imgUrl =
  "https://images.pexels.com/photos/1434819/pexels-photo-1434819.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260";
  categorieModel.categorieName = "Astronomy";

  categories.add(categorieModel);
  categorieModel = new CategorieModel();

  //
  categorieModel.imgUrl =
  "https://images.pexels.com/photos/2116475/pexels-photo-2116475.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categorieModel.categorieName = "Autumn";
  categories.add(categorieModel);
  categorieModel = new CategorieModel();

  //
  categorieModel.imgUrl =
  "https://images.pexels.com/photos/1149137/pexels-photo-1149137.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categorieModel.categorieName = "Babies & Kids";
  categories.add(categorieModel);
  categorieModel = new CategorieModel();

  return categories;
}