import 'package:myapp/database/dao/conatct_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

//Retorno async await
Future<Database> getDataBase() async {
  final String path = join(await getDatabasesPath(), 'bytebank.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(ContactDao.tableSql);
    },
    version: 1,
    // Limpar Banco de dados alterar version pra 2 restart
    //onDowngrade: onDatabaseDowngradeDelete,
  );
}



