import 'package:jsonplaceholder_app/bloc/bloc/bloc.dart';
import 'package:jsonplaceholder_app/model/category_model.dart';
import 'package:jsonplaceholder_app/screens/menus/category/widget/item_category.dart';
import 'package:jsonplaceholder_app/utils/constant.dart';
import 'package:jsonplaceholder_app/utils/toast.dart';
import 'package:jsonplaceholder_app/utils/util.dart';
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
  bool _isVisibleClear = false;
  TextEditingController searchController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _dataBloc = BlocProvider.of<DataBloc>(context);
    _dataBloc.add(GetDataCategoryEvent(keyword: ""));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _dataBloc,
      listener: (context, state) async {
        if (state is GetDataCategorySuccessState) {
          _isLoading = false;
          _myDataCategory = state.result;
        } else if (state is GetDataPostFailedState) {
          _isLoading = false;
          ToastUtils.show(state.message);
        }
      },
      child: BlocBuilder(
        bloc: _dataBloc,
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: HexColor(ColorPalette['ColorAccent']),
              title: Text(
                "Category",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: HexColor(ColorPalette['ColorPrimaryDark'])),
              ),
              elevation: 0,
            ),
            body: Column(
              children: [
                Container(
                  color: HexColor(ColorPalette['ColorAccent']),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: ListTile(
                        leading: Icon(Icons.search),
                        title: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                              hintText: 'Search by title . . .',
                              border: InputBorder.none),
                          onChanged: onSearchTextChanged,
                        ),
                        trailing: Visibility(
                          visible: _isVisibleClear,
                          child: IconButton(
                            icon: Icon(Icons.cancel),
                            onPressed: () {
                              searchController.clear();
                              onSearchTextChanged('');
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                _isLoading
                    ? Expanded(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                            itemCount: _myDataCategory.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ItemCategory(data: _myDataCategory[index]);
                            }),
                      ),
              ],
            ),
          );
        },
      ),
    );
  }

  onSearchTextChanged(String text) async {
    setState(() {
      if (text != "" || text.isNotEmpty)
        _isVisibleClear = true;
      else
        _isVisibleClear = false;
      _dataBloc.add(GetDataCategoryEvent(keyword: text));
    });
  }
}
