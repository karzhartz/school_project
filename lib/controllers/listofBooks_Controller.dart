import 'package:get/get.dart';

import '../models/book_model.dart';

class BookController extends GetxController {
  RxList<Book> _books = <Book>[].obs;
  List<Book> get books => _books.value;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _books.addAll([
      Book(
          title: 'Math',
          bookCover:
              'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/1baebe76-ed3d-4252-adc9-398a3b997fb2/d98azp3-45af2675-1cde-4b23-8df8-f9d252d2a668.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzFiYWViZTc2LWVkM2QtNDI1Mi1hZGM5LTM5OGEzYjk5N2ZiMlwvZDk4YXpwMy00NWFmMjY3NS0xY2RlLTRiMjMtOGRmOC1mOWQyNTJkMmE2NjguanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.k5YSB307Dnqp9H-nShBXIm8Zd6CNT0lwmR1vnuPj4b8'),
      Book(
          title: 'Chemistry',
          bookCover:
              'https://images-na.ssl-images-amazon.com/images/I/51Of8AR0LEL._SX398_BO1,204,203,200_.jpg'),
      Book(
          title: 'Physics',
          bookCover:
              'https://novapublishers.com/wp-content/uploads/2018/10/9781536147124-e1546534240337.jpg'),
      Book(
          title: 'Biology',
          bookCover:
              'https://m.media-amazon.com/images/I/51G0BX7gzfL._SL500_.jpg'),
      Book(
          title: "History",
          bookCover:
              'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/roman-history-book-cover-design-template-48914ad1e972113cd5e8508a05ad2904_screen.jpg?ts=1637014074'),
      Book(
          title: 'Business',
          bookCover:
              'https://marketplace.canva.com/EADajkZf9l0/1/0/1003w/canva-blue-and-orange-big-type-business-book-kindle-cover-Mc6LBpALHyM.jpg'),
      Book(
          title: 'English',
          bookCover:
              'https://blog-cdn.reedsy.com/directories/gallery/63/large_d36ed7ef509475e638cbb82dbcbb359e.jpg'),
      Book(
          title: 'Kiswahili',
          bookCover: 'https://m.media-amazon.com/images/I/51zmCndrX4L.jpg'),
      Book(
          title: 'Pe',
          bookCover:
              'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/fitness%2C-book-cover-design-template-8a4c20657413476da693903aa8ec92b4_screen.jpg?ts=1644248740'),
    ]);

    print(_books.value);
  }
}

// List allBooks = [
//   Book(title: 'Math', bookCover: 'Numbers'),
//   Book(title: 'Chemistry', bookCover: 'Chemicals'),
//   Book(title: 'Physics', bookCover: 'Gears'),
//   Book(title: 'Biology', bookCover: 'Bacteria'),
// ];
