import 'package:flutter/material.dart';
import 'package:gamekey/src/config/app_data.dart' as appData;
import 'package:gamekey/src/pages/home/componets/categoryTile.dart';
import 'package:gamekey/src/pages/home/componets/itemTile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedCategory = 'Steam';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //App bar

      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Padding(
          padding: const EdgeInsets.all(4),
          child: Image.asset(
            "images/logo.png",
            width: 250,
            height: 250,
            alignment: AlignmentDirectional.centerStart,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
              right: 15,
            ),
            child: GestureDetector(
              onTap: () {},
              child: Badge(
                backgroundColor: Colors.red,
                label: Text(
                  '2',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),

      body: Column(
        // Campo pesquisa
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                isDense: true,
                hintText: 'Pesquise aqui..',
                hintStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(60),
                  borderSide: const BorderSide(
                    color: Colors.black54,
                    width: 0,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
            ),
          ),
          //categorias

          Container(
            padding: const EdgeInsets.only(left: 25),
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return CategoryTile(
                  onPressed: () {
                    setState(() {
                      selectedCategory = appData.categorias[index];
                    });
                  },
                  category: appData.categorias[index],
                  isSelection: appData.categorias[index] == selectedCategory,
                );
              },
              separatorBuilder: (_, index) => const SizedBox(width: 10),
              itemCount: appData.categorias.length,
            ),
          ),

          //Grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 9 / 11.5,
              ),
              itemCount: appData.items.length,
              itemBuilder: (_, index) {
                return ItemTile(
                  item: appData.items[index],
                );
              },
            ),
          ),
        ],
      ),

      // Grid
    );
  }
}
