import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<String> _imagePaths = [
    'assets/images/home.png',
    'assets/images/data_peserta.png',
    'assets/images/pengaturan.png',
    'assets/images/pesan.png',
  ];

  Widget _buildImage(String imagePath) {
    return Image.asset(
      imagePath,
      errorBuilder: (context, error, stackTrace) {
        return const Center(child: Text('Image not found'));
      },
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Medical Health Physiotherapy',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: Center(
        child: _imagePaths.length > _selectedIndex
            ? _buildImage(_imagePaths[_selectedIndex])
            : const Center(child: Text('Image not found')),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: _selectedIndex == 0 ? 30 : 24,
                color: _selectedIndex == 0 ? Colors.blueAccent : Colors.grey,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.people,
                size: _selectedIndex == 1 ? 30 : 24,
                color: _selectedIndex == 1 ? Colors.blueAccent : Colors.grey,
              ),
              label: 'Data Peserta',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.message,
                size: _selectedIndex == 2 ? 30 : 24,
                color: _selectedIndex == 2 ? Colors.blueAccent : Colors.grey,
              ),
              label: 'Messages',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                size: _selectedIndex == 3 ? 30 : 24,
                color: _selectedIndex == 3 ? Colors.blueAccent : Colors.grey,
              ),
              label: 'Settings',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          showUnselectedLabels: true,
        ),
      ),
    );
  }
}
