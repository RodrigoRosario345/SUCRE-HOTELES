import 'package:flutter/material.dart';
import '../../config/text_style.dart';
import 'card_model.dart';
import 'package:hotel/view/tab_screen.dart';

class MultipleSelectionGrid extends StatefulWidget {
  const MultipleSelectionGrid({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MultipleSelectionGridState createState() => _MultipleSelectionGridState();
}

class _MultipleSelectionGridState extends State<MultipleSelectionGrid> {
  List<CardModel> cards = [
    CardModel('Hotel Lujo', 'assets/images/hotel_lujo.jpg'),
    CardModel('Hotel boutique', 'assets/images/hotel_boutique.jpg'),
    CardModel('Hotel negocios', 'assets/images/hotel_negocios.jpg'),
    CardModel('Hotel familiar', 'assets/images/hotel_familiar.jpg'),
    CardModel('Hotel resort', 'assets/images/hotel_resort.jpg'),
    CardModel('Hotel económico', 'assets/images/hotel_economico.jpg'),
  ];

  List<CardModel> selectedCards = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 50.0),
          ),
          const Text(
            'Selecciona tus preferencias',
            style: TextStyle(fontSize: 20.0),
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: GridView.builder(
              itemCount: cards.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      cards[index].isSelected = !cards[index].isSelected;
                      if (cards[index].isSelected) {
                        selectedCards.add(cards[index]);
                      } else {
                        selectedCards.remove(cards[index]);
                      }
                    });
                  },
                  child: Container(
                    margin: const EdgeInsetsDirectional.only(
                      top: 20.0,
                      start: 20.0,
                      end: 20.0,
                    ),
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 2),
                          blurRadius: 6.0,
                        ),
                      ],
                      color: cards[index].isSelected
                          ? HexColor(AppTheme.primaryColorString!)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              image: DecorationImage(
                                image: AssetImage(cards[index].imagePath),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            cards[index].title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 16.0, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: HexColor(AppTheme.primaryColorString!),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
        ),
        onPressed: selectedCards.isEmpty
            ? null
            : () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TabScreen(),
                  ),
                );
              },
        child:
            const Text('Comenzar Travesía', style: TextStyle(fontSize: 16.0)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
