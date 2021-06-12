import 'package:case_devido/bloc/bloc/bloc.dart';
import 'package:case_devido/bloc/bloc/data_bloc.dart';
import 'package:case_devido/model/post_model.dart';
import 'package:case_devido/screens/menus/post/widget/item_post.dart';
import 'package:case_devido/utils/constant.dart';
import 'package:case_devido/utils/toast.dart';
import 'package:case_devido/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({key}) : super(key: key);

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  DataBloc _dataBloc;
  List<PostModel> _myDataPost;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _dataBloc = BlocProvider.of<DataBloc>(context);
    _dataBloc.add(GetDataPostEvent(start: "0", limit: "10"));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _dataBloc,
      listener: (context, state) async {
        if (state is GetDataPostSuccessState) {
          _isLoading = false;
          _myDataPost = state.result;
        } else if (state is GetDataPostFailedState) {
          _isLoading = false;
          ToastUtils.show(state.message);
        }
      },
      child: BlocBuilder(
        bloc: _dataBloc,
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              elevation: 0,
              title: Text(
                "Post",
                style: TextStyle(
                    color: HexColor(ColorPalette['ColorPrimaryDark'])),
              ),
            ),
            body: _isLoading
                ? Center(
              child: CircularProgressIndicator(),
            )
                : ListView.builder(
                itemCount: _myDataPost.length,
                itemBuilder: (BuildContext context, int index) {
                  return ItemPost(data: _myDataPost[index]);
                    }),
          );
        },
      ),
    );
  }
}
