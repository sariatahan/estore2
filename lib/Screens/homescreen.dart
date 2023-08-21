import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:estore2/Shopping Brain/ItemsManagement.dart';
import 'package:estore2/Shopping Brain/ItemsBank.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'HomeScreen';
  @override
  Widget build(BuildContext context) {
    initializeItems();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF008080),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // Add your menu button onPressed code here
          },
        ),
        title: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: Colors.white,
          ),
          child: const Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(Icons.search, color: Colors.grey),
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'البحث',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 25, left: 10),
          child: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Add your onTap code here
                      },
                      child: Row(
                        children: [
                          Text(
                            'عرض الكل',
                            style: GoogleFonts.almarai(
                              fontSize: 15.0,
                              decoration: TextDecoration.underline,
                              color: const Color(0xFF515C6F),
                            ),
                          ),
                          const SizedBox(
                            width: 170,
                          ),
                          Text(
                            'الفئات',
                            style: GoogleFonts.almarai(
                              fontSize: 33.0,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF515C6F),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildIconCard(icon: Icons.laptop, title: 'لابتوبات'),
                      _buildIconCard(
                          icon: Icons.phone_android, title: 'موبايلات'),
                      _buildIconCard(
                          icon: Icons.tablet_android, title: '     تابات '),
                      _buildIconCard(icon: Icons.watch, title: 'ساعات ذكية'),
                      _buildIconCard(icon: Icons.headphones, title: 'سماعات'),
                      _buildIconCard(icon: Icons.diamond, title: 'اكسسوارات'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 160),
                  child: Text(
                    'الأكثر مبيع',
                    style: GoogleFonts.almarai(
                      fontSize: 33.0,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF515C6F),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Flexible(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: bestSellerItems.length, // Update the itemCount
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          width: 200,
                          child: Column(
                            children: [
                              AspectRatio(
                                aspectRatio: 1.3,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image(
                                    image: AssetImage(bestSellerItems[index]
                                        .assetImage), // Update the image source
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(bestSellerItems[index].name),
                              Text(bestSellerItems[index].price),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 160),
                  child: Text(
                    'الموصى به',
                    style: GoogleFonts.almarai(
                      fontSize: 33.0,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF515C6F),
                    ),
                  ),
                ),
                Flexible(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: recommendedItems.length, // Update the itemCount
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          width: 200,
                          child: Column(
                            children: [
                              AspectRatio(
                                aspectRatio: 1.3,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image(
                                    image: AssetImage(recommendedItems[index]
                                        .assetImage), // Update the image source
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(recommendedItems[index].name),
                              Text(recommendedItems[index].price),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFF008080),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
        ],
      ),
    );
  }

  Widget _buildIconCard({
    required IconData icon,
    required String title,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50,
              color: const Color(0xFF008080),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: GoogleFonts.almarai(
                fontSize: 15.0,
                color: const Color(0xFF515C6F),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
