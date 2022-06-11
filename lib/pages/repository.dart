import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:school_ui/controllers/tag_controller.dart';
import 'package:school_ui/models/tag_model.dart';
import 'package:school_ui/widgets/tag_shape.dart';

import '../controllers/listofBooks_Controller.dart';
import '../models/book_model.dart';

class Repository extends StatelessWidget {
  final TagController tagController = Get.find();
  final search_controller = TextEditingController();
  final BookController bookController = Get.find();
  RxList<Book> visibleBooks = <Book>[].obs;
  RxString currentSearchString = "".obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor("#092836"),
        appBar: AppBar(
            elevation: 0,
            backgroundColor: HexColor("#092836"),
            toolbarHeight: 100,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    height: 30,
                    child: TextField(
                      controller: search_controller,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(
                                color:
                                    const Color.fromARGB(255, 145, 242, 255))),
                        focusedBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(const Radius.circular(8)),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 145, 242, 255))),
                        filled: true,
                        fillColor: HexColor("#06648c"),
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 182, 237, 245))),
                      ),
                      onChanged: searchBook,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: const [
                      Icon(
                        Icons.search,
                        size: 20,
                        color: Colors.white,
                      ),
                      Text(
                        'Search',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      )
                    ],
                  ),
                )
              ],
            )),
        body: Column(
          children: [
            Expanded(
              flex: 0,
              child: Container(
                color: HexColor("#092836"),
                width: MediaQuery.of(context).size.width,
                height: 35,
                child: ListView.separated(
                    padding: EdgeInsets.all(4.0),
                    separatorBuilder: (context, index) => const SizedBox(
                          width: 10,
                        ),
                    scrollDirection: Axis.horizontal,
                    itemCount: tagController.tagsAsList.length,
                    itemBuilder: (BuildContext context, int index) {
                      Tag tag = tagController.tagsAsList[index];
                      return TagShape(name: tag.name);
                    }),
              ),
            ),
            Expanded(
                flex: 6,
                child: Obx(() {
                  if (currentSearchString.value.trim() != "") {
                    return buildListView(visibleBooks.value);
                  }
                  return buildListView(bookController.books);
                }))
          ],
        ));
  }

  Widget buildListView(List<Book> books) {
    return ListView.separated(
      itemCount: books.length,
      itemBuilder: (context, index) {
        final book = books[index];
        return ListTile(
          onTap: () {},
          leading: Image.network(
            book.bookCover,
            fit: BoxFit.cover,
            width: 80,
            height: 200,
          ),
          title: Text(
            book.title,
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => SizedBox(
        height: 20,
      ),
    );
  }

  void searchBook(String query) {
    List<Book> suggestions = bookController.books.where((book) {
      final bookTitle = book.title.toLowerCase();
      final input = query.toLowerCase();
      return bookTitle.contains(input);
    }).toList();
    visibleBooks.value = suggestions;
    currentSearchString.value = query;
  }
}
