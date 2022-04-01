// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room2.dart';

// **************************************************************************
// MigrationGenerator
// **************************************************************************

class Room2Migration extends Migration {
  @override
  void up(Schema schema) {
    schema.create('room2s', (table) {
      table.serial('id').primaryKey();
      table.timeStamp('created_at');
      table.timeStamp('updated_at');
      table.integer('state');
      table.varChar('short_code', length: 255);
      table.varChar('teams', length: 255);
      table.varChar('cards', length: 255);
    });
  }

  @override
  void down(Schema schema) {
    schema.drop('room2s');
  }
}

// **************************************************************************
// OrmGenerator
// **************************************************************************

class Room2Query extends Query<Room2, Room2QueryWhere> {
  Room2Query({Query? parent, Set<String>? trampoline}) : super(parent: parent) {
    trampoline ??= <String>{};
    trampoline.add(tableName);
    _where = Room2QueryWhere(this);
  }

  @override
  final Room2QueryValues values = Room2QueryValues();

  List<String> _selectedFields = [];

  Room2QueryWhere? _where;

  @override
  Map<String, String> get casts {
    return {};
  }

  @override
  String get tableName {
    return 'room2s';
  }

  @override
  List<String> get fields {
    const _fields = [
      'id',
      'created_at',
      'updated_at',
      'state',
      'short_code',
      'teams',
      'cards'
    ];
    return _selectedFields.isEmpty
        ? _fields
        : _fields.where((field) => _selectedFields.contains(field)).toList();
  }

  Room2Query select(List<String> selectedFields) {
    _selectedFields = selectedFields;
    return this;
  }

  @override
  Room2QueryWhere? get where {
    return _where;
  }

  @override
  Room2QueryWhere newWhereClause() {
    return Room2QueryWhere(this);
  }

  Optional<Room2> parseRow(List row) {
    if (row.every((x) => x == null)) {
      return Optional.empty();
    }
    var model = Room2(
        id: fields.contains('id') ? row[0].toString() : null,
        createdAt: fields.contains('created_at') ? (row[1] as DateTime?) : null,
        updatedAt: fields.contains('updated_at') ? (row[2] as DateTime?) : null,
        state: fields.contains('state')
            ? row[3] == null
                ? null
                : GameState?.values[(row[3] as int)]
            : null,
        shortCode: fields.contains('short_code') ? (row[4] as String?) : null,
        teams: fields.contains('teams') ? (row[5] as String?) : null,
        cards: fields.contains('cards') ? (row[6] as String?) : null);
    return Optional.of(model);
  }

  @override
  Optional<Room2> deserialize(List row) {
    return parseRow(row);
  }
}

class Room2QueryWhere extends QueryWhere {
  Room2QueryWhere(Room2Query query)
      : id = NumericSqlExpressionBuilder<int>(query, 'id'),
        createdAt = DateTimeSqlExpressionBuilder(query, 'created_at'),
        updatedAt = DateTimeSqlExpressionBuilder(query, 'updated_at'),
        state = EnumSqlExpressionBuilder<GameState?>(
            query, 'state', (v) => v?.index as int),
        shortCode = StringSqlExpressionBuilder(query, 'short_code'),
        teams = StringSqlExpressionBuilder(query, 'teams'),
        cards = StringSqlExpressionBuilder(query, 'cards');

  final NumericSqlExpressionBuilder<int> id;

  final DateTimeSqlExpressionBuilder createdAt;

  final DateTimeSqlExpressionBuilder updatedAt;

  final EnumSqlExpressionBuilder<GameState?> state;

  final StringSqlExpressionBuilder shortCode;

  final StringSqlExpressionBuilder teams;

  final StringSqlExpressionBuilder cards;

  @override
  List<SqlExpressionBuilder> get expressionBuilders {
    return [id, createdAt, updatedAt, state, shortCode, teams, cards];
  }
}

class Room2QueryValues extends MapQueryValues {
  @override
  Map<String, String> get casts {
    return {};
  }

  String? get id {
    return (values['id'] as String?);
  }

  set id(String? value) => values['id'] = value;
  DateTime? get createdAt {
    return (values['created_at'] as DateTime?);
  }

  set createdAt(DateTime? value) => values['created_at'] = value;
  DateTime? get updatedAt {
    return (values['updated_at'] as DateTime?);
  }

  set updatedAt(DateTime? value) => values['updated_at'] = value;
  GameState? get state {
    return GameState?.values[(values['state'] as int)];
  }

  set state(GameState? value) => values['state'] = value?.index;
  String? get shortCode {
    return (values['short_code'] as String?);
  }

  set shortCode(String? value) => values['short_code'] = value;
  String? get teams {
    return (values['teams'] as String?);
  }

  set teams(String? value) => values['teams'] = value;
  String? get cards {
    return (values['cards'] as String?);
  }

  set cards(String? value) => values['cards'] = value;
  void copyFrom(Room2 model) {
    createdAt = model.createdAt;
    updatedAt = model.updatedAt;
    state = model.state;
    shortCode = model.shortCode;
    teams = model.teams;
    cards = model.cards;
  }
}

// **************************************************************************
// JsonModelGenerator
// **************************************************************************

@generatedSerializable
class Room2 extends _Room2 {
  Room2(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.state,
      this.shortCode,
      this.teams,
      this.cards});

  /// A unique identifier corresponding to this item.
  @override
  String? id;

  /// The time at which this item was created.
  @override
  DateTime? createdAt;

  /// The last time at which this item was updated.
  @override
  DateTime? updatedAt;

  @override
  GameState? state;

  @override
  String? shortCode;

  @override
  String? teams;

  @override
  String? cards;

  Room2 copyWith(
      {String? id,
      DateTime? createdAt,
      DateTime? updatedAt,
      GameState? state,
      String? shortCode,
      String? teams,
      String? cards}) {
    return Room2(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        state: state ?? this.state,
        shortCode: shortCode ?? this.shortCode,
        teams: teams ?? this.teams,
        cards: cards ?? this.cards);
  }

  @override
  bool operator ==(other) {
    return other is _Room2 &&
        other.id == id &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.state == state &&
        other.shortCode == shortCode &&
        other.teams == teams &&
        other.cards == cards;
  }

  @override
  int get hashCode {
    return hashObjects(
        [id, createdAt, updatedAt, state, shortCode, teams, cards]);
  }

  @override
  String toString() {
    return 'Room2(id=$id, createdAt=$createdAt, updatedAt=$updatedAt, state=$state, shortCode=$shortCode, teams=$teams, cards=$cards)';
  }

  Map<String, dynamic> toJson() {
    return Room2Serializer.toMap(this);
  }
}

// **************************************************************************
// SerializerGenerator
// **************************************************************************

const Room2Serializer room2Serializer = Room2Serializer();

class Room2Encoder extends Converter<Room2, Map> {
  const Room2Encoder();

  @override
  Map convert(Room2 model) => Room2Serializer.toMap(model);
}

class Room2Decoder extends Converter<Map, Room2> {
  const Room2Decoder();

  @override
  Room2 convert(Map map) => Room2Serializer.fromMap(map);
}

class Room2Serializer extends Codec<Room2, Map> {
  const Room2Serializer();

  @override
  Room2Encoder get encoder => const Room2Encoder();
  @override
  Room2Decoder get decoder => const Room2Decoder();
  static Room2 fromMap(Map map) {
    return Room2(
        id: map['id'] as String?,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null,
        state: map['state'] is GameState?
            ? (map['state'] as GameState?)
            : (map['state'] is int
                ? GameState?.values[map['state'] as int]
                : null),
        shortCode: map['short_code'] as String?,
        teams: map['teams'] as String?,
        cards: map['cards'] as String?);
  }

  static Map<String, dynamic> toMap(_Room2? model) {
    if (model == null) {
      return {};
    }
    return {
      'id': model.id,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String(),
      'state':
          model.state != null ? GameState.values.indexOf(model.state!) : null,
      'short_code': model.shortCode,
      'teams': model.teams,
      'cards': model.cards
    };
  }
}

abstract class Room2Fields {
  static const List<String> allFields = <String>[
    id,
    createdAt,
    updatedAt,
    state,
    shortCode,
    teams,
    cards
  ];

  static const String id = 'id';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';

  static const String state = 'state';

  static const String shortCode = 'short_code';

  static const String teams = 'teams';

  static const String cards = 'cards';
}
