import 'package:case_devido/bloc/bloc/bloc.dart';
import 'package:case_devido/model/category_model.dart';
import 'package:case_devido/screens/menus/category/widget/item_category.dart';
import 'package:case_devido/utils/constant.dart';
import 'package:case_devido/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  DataBloc _dataBloc;
  List<CategoryModel> _myDataCategory;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _dataBloc = BlocProvider.of<DataBloc>(context);
    _dataBloc.add(GetDataCategoryEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _dataBloc,
      listener: (context, state) async {
        if (state is GetDataCategoryState) {
          _isLoading = false;
          _myDataCategory = state.result;
        }
      },
      child: BlocBuilder(
        bloc: _dataBloc,
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text(
                "Post",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: HexColor(ColorPalette['ColorPrimaryDark'])),
              ),
              elevation: 0,
            ),
            body: _isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: _myDataCategory.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ItemCategory(data: _myDataCategory[index]);
                    }),
          );
        },
      ),
    );
  }
}
