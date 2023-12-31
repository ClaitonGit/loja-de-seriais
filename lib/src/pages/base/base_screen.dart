import 'package:flutter/material.dart';
import 'package:gamekey/src/pages/home/home.dart';


class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int currentIndex = 0 ;
  final pageControlle = PageController(

  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: PageView (
        physics: const NeverScrollableScrollPhysics(),
        controller: pageControlle,
        children: [
          const Home(),
          Container(color: Colors.yellow),
          Container(color: Colors.blue),
          Container(color: Colors.green),
        ],
      ),


      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
         setState(() {
           currentIndex = index;
           pageControlle.jumpToPage(index);
         });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black54,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withAlpha(100),

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Carrinho',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Pedidos',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: 'Conta',
          ),
        ],
      ),

    );
  }
}
