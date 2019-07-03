import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileOperate {
  String fileName = "content.txt";
  File file;

  Future<File> _openLocalFile() async {
    if (file == null){
      String dir = (await getApplicationDocumentsDirectory()).path;
      file =  new File("$dir/$fileName");
    }
    return file;
  }

  Future<String> readFile() async{
    try{
      File file = await _openLocalFile();
      return await file.readAsString();
    }on FileSystemException catch(e){
      return "${e.message}";
    }
  }

  writeFile(String info) async {
    try{
      File file = await _openLocalFile();
      file.writeAsString(info);
    }on FileSystemException catch(e){
      print("${e.message}");
    }
  }
}
