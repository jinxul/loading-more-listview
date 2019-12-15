import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

typedef void OnLoadMoreCallBack();

class LoadMoreListView extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  final OnLoadMoreCallBack onLoadMore;

  final Widget loadingIndicator;
  final bool enableLoadMore;

  final int itemCount;
  final Axis scrollDirection;
  final bool reverse;
  final bool primary;
  final ScrollPhysics physics;
  final bool shrinkWrap;
  final EdgeInsetsGeometry padding;
  final double itemExtent;
  final IndexedWidgetBuilder itemBuilder;
  final bool addAutomaticKeepAlives;
  final bool addRepaintBoundaries;
  final bool addSemanticIndexes;
  final double cacheExtent;
  final int semanticChildCount;
  final DragStartBehavior dragStartBehavior;

  LoadMoreListView({
    Key key,
    @required this.itemCount,
    @required this.itemBuilder,
    @required this.onLoadMore,
    this.enableLoadMore: true,
    this.loadingIndicator,
    this.padding,
    this.scrollDirection: Axis.vertical,
    this.reverse: false,
    this.primary,
    this.physics,
    this.shrinkWrap: false,
    this.itemExtent,
    this.addAutomaticKeepAlives: true,
    this.addRepaintBoundaries: true,
    this.addSemanticIndexes: true,
    this.cacheExtent,
    this.semanticChildCount,
    this.dragStartBehavior: DragStartBehavior.start,
  }) : super(key: key) {
    _initController();
  }

  Widget get _loadingIndicator =>
      loadingIndicator ??
      Padding(
        child: Center(
          child: CircularProgressIndicator(),
        ),
        padding: EdgeInsets.only(top: 10),
      );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _getItemCount(),
      itemBuilder: _itemBuilder,
      controller: _scrollController,
      scrollDirection: scrollDirection,
      reverse: reverse,
      primary: primary,
      physics: physics,
      shrinkWrap: shrinkWrap,
      padding: padding,
      itemExtent: itemExtent,
      addAutomaticKeepAlives: addAutomaticKeepAlives,
      addRepaintBoundaries: addRepaintBoundaries,
      addSemanticIndexes: addSemanticIndexes,
      cacheExtent: cacheExtent,
      semanticChildCount: semanticChildCount,
      dragStartBehavior: dragStartBehavior,
    );
  }

  int _getItemCount() {
    return itemCount > 0 ? itemCount + (enableLoadMore ? 1 : 0) : 0;
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return enableLoadMore && itemCount == index
        ? _loadingIndicator
        : itemBuilder(context, index);
  }

  void _initController() {
    int previousTotal = 0;
    bool _isLoadingMore = false;

    _scrollController.addListener(() {
      if (!enableLoadMore) return;
      double after = _scrollController.position.extentAfter;
      int total = itemCount;

      if (_isLoadingMore && (total > previousTotal)) {
        _isLoadingMore = false;
        previousTotal = total;
      }

      if (!_isLoadingMore && after == 0) {
        _isLoadingMore = true;
        previousTotal = total;
        onLoadMore();
      }
    });
  }
}
