import 'package:case_devido/bloc/bloc/bloc.dart';
import 'package:case_devido/bloc/bloc/data_bloc.dart';
import 'package:case_devido/model/post_model.dart';
import 'package:case_devido/utils/constant.dart';
import 'package:case_devido/utils/toast.dart';
import 'package:case_devido/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widget/item_post.dart';
import 'widget/item_shimmer_post.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({key}) : super(key: key);

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  DataBloc _dataBloc;
  List<PostModel> _myDataPost = [];
  bool _isLoadingData = true;
  bool _isLoadingPagination = false;
  bool _isDataMax = false;
  int startPost = 0;

  @override
  void initState() {
    super.initState();
    _dataBloc = BlocProvider.of<DataBloc>(context);
    _dataBloc.add(GetDataPostEvent(start: startPost, limit: 10));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _dataBloc,
      listener: (context, state) async {
        if (state is GetDataPostSuccessState) {
          _isLoadingData = false;
          _isLoadingPagination = false;

          if (state.result.isEmpty) {
            _isDataMax = true;
            ToastUtils.show("No data anymore :(");
          } else {
            startPost += 10;
            if (_myDataPost.isEmpty) {
              _myDataPost = state.result;
            } else {
              state.result.forEach((PostModel data) => _myDataPost.add(data));
            }
          }
        } else if (state is GetDataPostFailedState) {
          _isLoadingData = false;
          _isLoadingPagination = false;
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
                    fontWeight: FontWeight.w700,
                    color: HexColor(ColorPalette['ColorPrimaryDark'])),
              ),
            ),
            body: _isLoadingData
                ? ListView.builder(
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return ItemShimmerPost();
                    })
                : Column(
                    children: [
                      NotificationListener<ScrollEndNotification>(
                        onNotification: (scrollEnd) {
                          var metrics = scrollEnd.metrics;
                          if (metrics.atEdge) {
                            if (metrics.pixels != 0) {
                              setState(() {
                                if (_isDataMax) {
                                  ToastUtils.show("No data anymore :(");
                                } else {
                                  _isLoadingPagination = true;
                                  _dataBloc.add(GetDataPostEvent(
                                      start: startPost, limit: 10));
                                }
                              });
                            }
                          }
                          return true;
                        },
                        child: Expanded(
                          child: ListView.builder(
                              physics: ClampingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: _myDataPost.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ItemPost(data: _myDataPost[index]);
                              }),
                        ),
                      ),
                      Visibility(
                          visible: _isLoadingPagination,
                          child: ItemShimmerPost())
                    ],
                  ),
          );
        },
      ),
    );
  }
}
