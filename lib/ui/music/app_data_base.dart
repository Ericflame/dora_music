import 'dart:async';
import 'package:floor/floor.dart';
import 'package:flutter_advanced/ui/music/person_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'entity/person.dart';

// part 'app_data_base.g.dart';

@Database(version:1 ,entities:[Person])
abstract class AppDatabase extends FloorDatabase{
  PersonDao get personDao;
}