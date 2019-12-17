# loading_more_listview

A Simple LoadingMore ListView

[![pub package](https://img.shields.io/pub/v/loading_more_listview.svg)](https://pub.dartlang.org/packages/loading_more_listview) [![GitHub license](https://img.shields.io/github/license/jinxul/loading-more-listview)](https://github.com/jinxul/loading-more-listview/blob/master/LICENSE)

## Use

* add library to your pubspec.yaml
  
```yaml

dependencies:
  loading_more_listview: 1.0.1

```  
* import library in dart file
  
```dart

  import 'package:loading_more_listview/loading_more_listview.dart';

```

## Argument

all of the `LisView` arguments are supported except `ScrollController`(because i use it internally). other argumets are:

|argument             |                description           |    default     |
|---------------------|--------------------------------------|:--------------:|
|onLoadMore           |a `void` callBack for when `ListView` is ready for new items to be inserted.   | required  |
|enableLoadMore       |Whether `ListView` should show loadingIndicator at the end of itself or not.     |  true   |
|loadingIndicator     |a `Widget` that will be shown at end of the `ListView` Until new data is Inserted in it.   |   `CircularProgressIndicator` |

