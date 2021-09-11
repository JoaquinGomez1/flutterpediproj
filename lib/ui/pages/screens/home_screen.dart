import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pediprojflutter/constants/Constants.dart';
import 'package:pediprojflutter/constants/data/UiData.dart';
import 'package:pediprojflutter/constants/uiModels/card_model.dart';
import 'package:pediprojflutter/domain/models/product_model.dart';
import 'package:pediprojflutter/domain/models/user_model.dart';
import 'package:pediprojflutter/services/cart_service.dart';
import 'package:pediprojflutter/services/user_service.dart';
import 'package:pediprojflutter/ui/components/card_list.dart';
import 'package:pediprojflutter/ui/components/pill.dart';
import 'package:pediprojflutter/ui/components/custom_input.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<CategoryModel> _categories = [
    CategoryModel(
        name: "Pizza", icon: Icon(Icons.local_pizza, color: Colors.white)),
    CategoryModel(
        name: "Drinks", icon: Icon(Icons.wine_bar, color: Colors.white)),
    CategoryModel(
        name: "Meals", icon: Icon(Icons.food_bank, color: Colors.white)),
    CategoryModel(
        name: "Pizza", icon: Icon(Icons.local_pizza, color: Colors.white)),
    CategoryModel(
        name: "Drinks", icon: Icon(Icons.wine_bar, color: Colors.white)),
    CategoryModel(
        name: "Meals", icon: Icon(Icons.food_bank, color: Colors.white)),
  ];
  List<ProductModel> _products = products;

  TextEditingController _searchController = new TextEditingController();
  int _selectedCategory = 0;

  void _selectCategory(int index) {
    setState(() {
      if (index == _selectedCategory) {
        _selectedCategory = -1;
        _products = products;
      } else {
        _selectedCategory = index;
        _products = _getProductsByCategory(_categories[index].name);
      }
    });
  }

  List<ProductModel> _getProductsByCategory(String category) {
    return products.where((element) => element.category == category).toList();
  }

  CardModel _mapProductToCard(ProductModel product) {
    return CardModel(
      buttonActionName: "Add To Cart",
      header: product.name,
      subHeader: product.description,
      subHeader2: "\$${product.price}",
      imageUrl: product.imageUrl,
    );
  }

  @override
  void initState() {
    super.initState();

    _searchController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: Constants.paddingVertical,
              horizontal: Constants.paddingHorizontal,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildTopBanner(context),
                SizedBox(height: 20.0),
                CustomTextField(
                  prefixIcon: Icons.search,
                  placeholder: "Search something",
                  inputController: _searchController,
                ),
                SizedBox(
                  height: 15.0,
                ),
                _buildCategoriesList(),
                SizedBox(height: 15.0),
                Divider(
                  height: 1,
                  color: Colors.grey[350],
                  thickness: 1,
                ),
                CardList<ProductModel>(
                  onButtonTapAction: (ProductModel item) {
                    Provider.of<CartService>(context, listen: false)
                        .addItem(item);
                  },
                  dataList: _products,
                  formatterFunction: _mapProductToCard,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _buildTopBanner(BuildContext context) {
    UserModel? _user = Provider.of<UserService>(context).currentUser;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome",
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 36.0,
              ),
            ),
            Text("We've been waiting for you")
          ],
        ),
        ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(
              30,
            ),
          ),
          child: CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            radius: 30,
            child: Container(
              child: _user == null || _user.imageUrl == null
                  ? Icon(Icons.person, size: 24.0)
                  : Image.network(_user.imageUrl!),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoriesList() {
    bool _isSelected(int index) => _selectedCategory == index;

    return Container(
      height: 35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        itemBuilder: (context, i) {
          CategoryModel category = _categories[i];
          return GestureDetector(
            onTap: () {
              _selectCategory(i);
            },
            child: Pill(
              name: category.name,
              icon: category.icon,
              isActive: _isSelected(i),
            ),
          );
        },
      ),
    );
  }
}

class CategoryModel {
  String name;
  Icon icon;
  CategoryModel({
    required this.name,
    required this.icon,
  }) {}
}
