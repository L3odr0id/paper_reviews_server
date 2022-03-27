import 'package:angel3_migration/angel3_migration.dart';
import 'package:angel3_serialize/angel3_serialize.dart';
import 'package:angel3_orm/angel3_orm.dart';
import 'package:optional/optional.dart';

part 'room.g.dart';

@serializable
@orm
abstract class _Room extends Model {
  @hasMany
  List<_Card> get cards;

  @hasMany
  List<_Team> get teams;

  @hasMany
  List<_Action> get history;

  GameState? get state;

  @hasMany
  List<_Rule> get rules;
}

enum GameState { starting, inProgress, finised }

@serializable
@orm
abstract class _Card extends Model {
  String? get title;

  @hasOne
  _Team? get team;
}

@serializable
@orm
abstract class _Team extends Model {
  @hasMany
  List<_Player> get slaves;
  @hasOne
  _Player? get master;

  TeamColor? get teamColor;
  TeamState? get teamState;
}

enum TeamColor {
  yellow,
  green,
  red,
  blue,
  purple,
  orange,
  turquoise,
}

enum TeamState {
  system,
  user,
}

@serializable
@orm
abstract class _Player extends Model {
  String? get name;
  String? get uuid;
  PlayerState? get playerState;
}

enum PlayerState { anonymus, authorized }

@serializable
@orm
abstract class _Action extends Model {
  @hasOne
  _Player? get who;
  @hasOne
  _Card? get card;
}

@serializable
@orm
abstract class _Rule extends Model {
  String? get uuid;
}
