import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SingleImageCarousel extends StatefulWidget {
  const SingleImageCarousel({super.key});

  @override
  State<SingleImageCarousel> createState() => _SingleImageCarouselState();
}

class _SingleImageCarouselState extends State<SingleImageCarousel> {
  int _current = 0;

  final List<Map<String, String>> hotels = [
    {
      "image": "https://picsum.photos/id/1018/600/400", // 替换为你自己的图片
      "location": "印度尼西亚·万隆",
      "name": "万隆皇冠假日酒店",
      "desc": "酒店位于万隆市中心，地理位置优越，设备完善...",
      "rating": "4.9"
    },
    {
      "image": "https://picsum.photos/id/1015/600/400",
      "location": "中国·三亚",
      "name": "三亚海景度假村",
      "desc": "拥有一流的海滩景观，适合家庭与情侣出行...",
      "rating": "4.8"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        children: [
          // 图片轮播
          CarouselSlider.builder(
            itemCount: hotels.length,
            itemBuilder: (context, index, realIndex) {
              return Image.network(
                hotels[index]["image"]!,
                fit: BoxFit.cover,
                width: double.infinity,
              );
            },
            options: CarouselOptions(
              height: 280,
              viewportFraction: 1, // 单张全屏
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
          ),

          // 顶部位置标签
          Positioned(
            top: 12,
            left: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const Icon(Icons.location_on,
                      size: 16, color: Colors.black87),
                  const SizedBox(width: 4),
                  Text(
                    hotels[_current]["location"]!,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 底部信息 + 指示器
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black87, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          hotels[_current]["name"]!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      Text(
                        hotels[_current]["rating"]!,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.favorite_border,
                          color: Colors.white, size: 20),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    hotels[_current]["desc"]!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),

                  // 指示器
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: hotels.asMap().entries.map((entry) {
                      return Container(
                        width: _current == entry.key ? 20 : 8,
                        height: 6,
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: _current == entry.key
                              ? Colors.amber
                              : Colors.white54,
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
