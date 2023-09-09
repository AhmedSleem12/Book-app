import 'package:bookely_app/Features/home/data/data_model/book/book.dart';
import 'package:bookely_app/Features/home/presentation/view_model/simller_boks/cubit/simller_books_cubit_cubit.dart';
import 'package:bookely_app/Features/home/presentation/views/widgets/books_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksDetailsView extends StatefulWidget {
  final BookModel book;
  const BooksDetailsView({super.key, required this.book});

  @override
  State<BooksDetailsView> createState() => _BooksDetailsViewState();
}

class _BooksDetailsViewState extends State<BooksDetailsView> {
  @override
  void initState() {
    BlocProvider.of<SimllerBooksCubitCubit>(context).fetchSimllerBooks(
        category: widget.book.volumeInfo.categories?[0] ?? "programming");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BooksDetailsViewBody(book: widget.book),
      ),
    );
  }
}
