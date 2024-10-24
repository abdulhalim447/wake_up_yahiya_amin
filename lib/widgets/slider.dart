import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeBannerSlider extends StatefulWidget {
  const HomeBannerSlider({
    super.key,
  });

  @override
  State<HomeBannerSlider> createState() => _HomeBannerSliderState();
}

class _HomeBannerSliderState extends State<HomeBannerSlider> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);

  // List of image URLs and texts
  final List<Map<String, String>> _imageData = [
    {
      'image': 'https://img.freepik.com/free-photo/free-photo-ramadan-kareem-eid-mubarak-royal-elegant-lamp-with-mosque-holy-gate-with-fireworks_1340-23597.jpg?t=st=1729097660~exp=1729101260~hmac=b6fe2284b70bd16dc9b7d7f718ac71347c3a5f5570529b119aa4fb156a5ae782&w=826',
      'text': 'Quran Tilawat',
    },
    {
      'image': 'https://img.freepik.com/free-photo/fit-man-practicing-yoga_23-2151745591.jpg?t=st=1729097821~exp=1729101421~hmac=0833a9c0d89a0778b3f0124c8e9ca76ab5f7a11f65e7cfa4aa79bfc2e61798f7&w=826',
      'text': 'Meditation',
    },
    {
      'image': 'https://img.freepik.com/free-photo/tense-young-sporty-man-wearing-headband-wristband-exercising-with-dumbbells_141793-89450.jpg?t=st=1729097989~exp=1729101589~hmac=1ab1374fed5cb86622afa2c00bc454151922b0a4db6fc002f341d1155dd5232e&w=740',
      'text': 'Exercise',
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
            height: 200.0, // Adjust height if needed
            autoPlay: true,
            enlargeCenterPage: true,
            enableInfiniteScroll: true,
            autoPlayInterval: const Duration(seconds: 3),
            onPageChanged: (index, reason) {
              _selectedIndex.value = index;
            },
          ),
          itemCount: _imageData.length,
          itemBuilder: (context, index, realIndex) {
            return Stack(
              children: [
                // Image part
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Image.network(

                    _imageData[index]['image']!,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                              (loadingProgress.expectedTotalBytes ?? 1)
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Center(
                        child: Text(
                          'Image failed to load',
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    },
                  ),
                ),

                // Text part
                Positioned(
                  bottom: 10, // Adjust to position the text
                  left: 10,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    color: Colors.black.withOpacity(0.5), // Background for text
                    child: Text(
                      _imageData[index]['text']!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        const SizedBox(height: 10),
        ValueListenableBuilder(
          valueListenable: _selectedIndex,
          builder: (context, currentIndex, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < _imageData.length; i++)
                  Container(
                    height: 12,
                    width: 12,
                    margin: const EdgeInsets.only(right: 4),
                    decoration: BoxDecoration(
                      color: currentIndex == i
                          ? Colors.blue
                          : Colors.grey.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey),
                    ),
                  )
              ],
            );
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    _selectedIndex.dispose();
    super.dispose();
  }
}
