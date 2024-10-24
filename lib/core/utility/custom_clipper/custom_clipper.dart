import 'package:flutter/material.dart';

class CustomCardShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // Sol üst köşeden başlıyoruz
    path.moveTo(0, 0);

    // Üst kısmın sağa doğru çıkıntısı
    path.lineTo(size.width * 0.9, 0);
    // Sağ üst köşedeki eğimli köşegen
    path.lineTo(size.width, size.height * 0.3);

    // Sağ alt köşe
    path.lineTo(size.width, size.height);

    // Sol alt köşedeki köşegen
    path.lineTo(size.width * 0.1, size.height);

    // Sol alt köşeden sol üst köşeye dönüyoruz
    path.lineTo(0, size.height * 0.7);

    path.close(); // Path'i kapatıyoruz
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
