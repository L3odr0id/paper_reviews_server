import 'package:angel3_migration/angel3_migration.dart';
import 'package:angel3_serialize/angel3_serialize.dart';
import 'package:angel3_orm/angel3_orm.dart';
import 'package:optional/optional.dart';

part 'room2.g.dart';

@serializable
@orm
abstract class _Room2 extends Model {
  GameState? get state;

  String? get shortCode;

  String? get teams;

  String? get cards;
}

enum GameState { starting, inProgress, finised }
