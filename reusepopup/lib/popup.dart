import 'package:flutter/material.dart';

class Popup extends StatefulWidget {
  const Popup({super.key});

  @override
  State<Popup> createState() => _PopupState();
}

class _PopupState extends State<Popup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Popup menu"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey,
        fixedColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.home, color: Colors.black),
              label: 'Home'),
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.recommend, color: Colors.black),
              label: 'Recommendations'),
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.message, color: Colors.black),
              label: 'My Requests'),
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(
                Icons.settings,
                color: Colors.black,
              ),
              label: 'Setttings')
        ],
        onTap: (int index) {
          if (index == 1 || index == 3) {
            _showPopupMenu(context);
          }
        },
      ),
    );
  }

  void _showPopupMenu(BuildContext context) async {
    final RenderBox overlay =
        Overlay.of(context)!.context.findRenderObject() as RenderBox;
    final result = await showMenu(
      context: context,
      position: RelativeRect.fromRect(
        Rect.fromPoints(
            const Offset(0, 400),
            overlay.localToGlobal(overlay.size.bottomRight(Offset.zero),
                ancestor: overlay)),
        Offset.zero & overlay.size,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      items: [
        const PopupMenuItem(
          value: 1,
          child: Text("We will be Updating this Shortly!!"),
        ),
        PopupMenuItem(
          value: 2,
          child: Row(
            children: [
              const SizedBox(
                width: 170,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Ok"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
