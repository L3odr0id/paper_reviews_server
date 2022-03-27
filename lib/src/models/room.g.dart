// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// MigrationGenerator
// **************************************************************************

class RoomMigration extends Migration {
  @override
  void up(Schema schema) {
    schema.create('rooms', (table) {
      table.serial('id').primaryKey();
      table.timeStamp('created_at');
      table.timeStamp('updated_at');
      table.integer('state');
    });
  }

  @override
  void down(Schema schema) {
    schema.drop('rooms', cascade: true);
  }
}

class CardMigration extends Migration {
  @override
  void up(Schema schema) {
    schema.create('cards', (table) {
      table.serial('id').primaryKey();
      table.timeStamp('created_at');
      table.timeStamp('updated_at');
      table.varChar('title', length: 255);
    });
  }

  @override
  void down(Schema schema) {
    schema.drop('cards', cascade: true);
  }
}

class TeamMigration extends Migration {
  @override
  void up(Schema schema) {
    schema.create('teams', (table) {
      table.serial('id').primaryKey();
      table.timeStamp('created_at');
      table.timeStamp('updated_at');
      table.integer('team_color');
      table.integer('team_state');
    });
  }

  @override
  void down(Schema schema) {
    schema.drop('teams', cascade: true);
  }
}

class PlayerMigration extends Migration {
  @override
  void up(Schema schema) {
    schema.create('players', (table) {
      table.serial('id').primaryKey();
      table.timeStamp('created_at');
      table.timeStamp('updated_at');
      table.varChar('name', length: 255);
      table.varChar('uuid', length: 255);
      table.integer('player_state');
    });
  }

  @override
  void down(Schema schema) {
    schema.drop('players');
  }
}

class ActionMigration extends Migration {
  @override
  void up(Schema schema) {
    schema.create('actions', (table) {
      table.serial('id').primaryKey();
      table.timeStamp('created_at');
      table.timeStamp('updated_at');
    });
  }

  @override
  void down(Schema schema) {
    schema.drop('actions', cascade: true);
  }
}

class RuleMigration extends Migration {
  @override
  void up(Schema schema) {
    schema.create('rules', (table) {
      table.serial('id').primaryKey();
      table.timeStamp('created_at');
      table.timeStamp('updated_at');
      table.varChar('uuid', length: 255);
    });
  }

  @override
  void down(Schema schema) {
    schema.drop('rules');
  }
}

// **************************************************************************
// OrmGenerator
// **************************************************************************

class RoomQuery extends Query<Room, RoomQueryWhere> {
  RoomQuery({Query? parent, Set<String>? trampoline}) : super(parent: parent) {
    trampoline ??= <String>{};
    trampoline.add(tableName);
    _where = RoomQueryWhere(this);
    leftJoin(_cards = CardQuery(trampoline: trampoline, parent: this), 'id',
        'room_id',
        additionalFields: const ['id', 'created_at', 'updated_at', 'title'],
        trampoline: trampoline);
    leftJoin(_teams = TeamQuery(trampoline: trampoline, parent: this), 'id',
        'room_id',
        additionalFields: const [
          'id',
          'created_at',
          'updated_at',
          'team_color',
          'team_state'
        ],
        trampoline: trampoline);
    leftJoin(_history = ActionQuery(trampoline: trampoline, parent: this), 'id',
        'room_id',
        additionalFields: const ['id', 'created_at', 'updated_at'],
        trampoline: trampoline);
    leftJoin(_rules = RuleQuery(trampoline: trampoline, parent: this), 'id',
        'room_id',
        additionalFields: const ['id', 'created_at', 'updated_at', 'uuid'],
        trampoline: trampoline);
  }

  @override
  final RoomQueryValues values = RoomQueryValues();

  List<String> _selectedFields = [];

  RoomQueryWhere? _where;

  late CardQuery _cards;

  late TeamQuery _teams;

  late ActionQuery _history;

  late RuleQuery _rules;

  @override
  Map<String, String> get casts {
    return {};
  }

  @override
  String get tableName {
    return 'rooms';
  }

  @override
  List<String> get fields {
    const _fields = ['id', 'created_at', 'updated_at', 'state'];
    return _selectedFields.isEmpty
        ? _fields
        : _fields.where((field) => _selectedFields.contains(field)).toList();
  }

  RoomQuery select(List<String> selectedFields) {
    _selectedFields = selectedFields;
    return this;
  }

  @override
  RoomQueryWhere? get where {
    return _where;
  }

  @override
  RoomQueryWhere newWhereClause() {
    return RoomQueryWhere(this);
  }

  Optional<Room> parseRow(List row) {
    if (row.every((x) => x == null)) {
      return Optional.empty();
    }
    var model = Room(
        id: fields.contains('id') ? row[0].toString() : null,
        createdAt: fields.contains('created_at') ? (row[1] as DateTime?) : null,
        updatedAt: fields.contains('updated_at') ? (row[2] as DateTime?) : null,
        state: fields.contains('state')
            ? row[3] == null
                ? null
                : GameState?.values[(row[3] as int)]
            : null);
    if (row.length > 4) {
      var modelOpt = CardQuery().parseRow(row.skip(4).take(4).toList());
      modelOpt.ifPresent((m) {
        model = model.copyWith(cards: [m]);
      });
    }
    if (row.length > 8) {
      var modelOpt = TeamQuery().parseRow(row.skip(8).take(5).toList());
      modelOpt.ifPresent((m) {
        model = model.copyWith(teams: [m]);
      });
    }
    if (row.length > 13) {
      var modelOpt = ActionQuery().parseRow(row.skip(13).take(3).toList());
      modelOpt.ifPresent((m) {
        model = model.copyWith(history: [m]);
      });
    }
    if (row.length > 16) {
      var modelOpt = RuleQuery().parseRow(row.skip(16).take(4).toList());
      modelOpt.ifPresent((m) {
        model = model.copyWith(rules: [m]);
      });
    }
    return Optional.of(model);
  }

  @override
  Optional<Room> deserialize(List row) {
    return parseRow(row);
  }

  CardQuery get cards {
    return _cards;
  }

  TeamQuery get teams {
    return _teams;
  }

  ActionQuery get history {
    return _history;
  }

  RuleQuery get rules {
    return _rules;
  }

  @override
  Future<List<Room>> get(QueryExecutor executor) {
    return super.get(executor).then((result) {
      return result.fold<List<Room>>([], (out, model) {
        var idx = out.indexWhere((m) => m.id == model.id);

        if (idx == -1) {
          return out..add(model);
        } else {
          var l = out[idx];
          return out
            ..[idx] = l.copyWith(
                cards: List<_Card>.from(l.cards)..addAll(model.cards),
                teams: List<_Team>.from(l.teams)..addAll(model.teams),
                history: List<_Action>.from(l.history)..addAll(model.history),
                rules: List<_Rule>.from(l.rules)..addAll(model.rules));
        }
      });
    });
  }

  @override
  Future<List<Room>> update(QueryExecutor executor) {
    return super.update(executor).then((result) {
      return result.fold<List<Room>>([], (out, model) {
        var idx = out.indexWhere((m) => m.id == model.id);

        if (idx == -1) {
          return out..add(model);
        } else {
          var l = out[idx];
          return out
            ..[idx] = l.copyWith(
                cards: List<_Card>.from(l.cards)..addAll(model.cards),
                teams: List<_Team>.from(l.teams)..addAll(model.teams),
                history: List<_Action>.from(l.history)..addAll(model.history),
                rules: List<_Rule>.from(l.rules)..addAll(model.rules));
        }
      });
    });
  }

  @override
  Future<List<Room>> delete(QueryExecutor executor) {
    return super.delete(executor).then((result) {
      return result.fold<List<Room>>([], (out, model) {
        var idx = out.indexWhere((m) => m.id == model.id);

        if (idx == -1) {
          return out..add(model);
        } else {
          var l = out[idx];
          return out
            ..[idx] = l.copyWith(
                cards: List<_Card>.from(l.cards)..addAll(model.cards),
                teams: List<_Team>.from(l.teams)..addAll(model.teams),
                history: List<_Action>.from(l.history)..addAll(model.history),
                rules: List<_Rule>.from(l.rules)..addAll(model.rules));
        }
      });
    });
  }
}

class RoomQueryWhere extends QueryWhere {
  RoomQueryWhere(RoomQuery query)
      : id = NumericSqlExpressionBuilder<int>(query, 'id'),
        createdAt = DateTimeSqlExpressionBuilder(query, 'created_at'),
        updatedAt = DateTimeSqlExpressionBuilder(query, 'updated_at'),
        state = EnumSqlExpressionBuilder<GameState?>(
            query, 'state', (v) => v?.index as int);

  final NumericSqlExpressionBuilder<int> id;

  final DateTimeSqlExpressionBuilder createdAt;

  final DateTimeSqlExpressionBuilder updatedAt;

  final EnumSqlExpressionBuilder<GameState?> state;

  @override
  List<SqlExpressionBuilder> get expressionBuilders {
    return [id, createdAt, updatedAt, state];
  }
}

class RoomQueryValues extends MapQueryValues {
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
  void copyFrom(Room model) {
    createdAt = model.createdAt;
    updatedAt = model.updatedAt;
    state = model.state;
  }
}

class CardQuery extends Query<Card, CardQueryWhere> {
  CardQuery({Query? parent, Set<String>? trampoline}) : super(parent: parent) {
    trampoline ??= <String>{};
    trampoline.add(tableName);
    _where = CardQueryWhere(this);
    leftJoin(_team = TeamQuery(trampoline: trampoline, parent: this), 'id',
        'card_id',
        additionalFields: const [
          'id',
          'created_at',
          'updated_at',
          'team_color',
          'team_state'
        ],
        trampoline: trampoline);
  }

  @override
  final CardQueryValues values = CardQueryValues();

  List<String> _selectedFields = [];

  CardQueryWhere? _where;

  late TeamQuery _team;

  @override
  Map<String, String> get casts {
    return {};
  }

  @override
  String get tableName {
    return 'cards';
  }

  @override
  List<String> get fields {
    const _fields = ['id', 'created_at', 'updated_at', 'title'];
    return _selectedFields.isEmpty
        ? _fields
        : _fields.where((field) => _selectedFields.contains(field)).toList();
  }

  CardQuery select(List<String> selectedFields) {
    _selectedFields = selectedFields;
    return this;
  }

  @override
  CardQueryWhere? get where {
    return _where;
  }

  @override
  CardQueryWhere newWhereClause() {
    return CardQueryWhere(this);
  }

  Optional<Card> parseRow(List row) {
    if (row.every((x) => x == null)) {
      return Optional.empty();
    }
    var model = Card(
        id: fields.contains('id') ? row[0].toString() : null,
        createdAt: fields.contains('created_at') ? (row[1] as DateTime?) : null,
        updatedAt: fields.contains('updated_at') ? (row[2] as DateTime?) : null,
        title: fields.contains('title') ? (row[3] as String?) : null);
    if (row.length > 4) {
      var modelOpt = TeamQuery().parseRow(row.skip(4).take(5).toList());
      modelOpt.ifPresent((m) {
        model = model.copyWith(team: m);
      });
    }
    return Optional.of(model);
  }

  @override
  Optional<Card> deserialize(List row) {
    return parseRow(row);
  }

  TeamQuery get team {
    return _team;
  }
}

class CardQueryWhere extends QueryWhere {
  CardQueryWhere(CardQuery query)
      : id = NumericSqlExpressionBuilder<int>(query, 'id'),
        createdAt = DateTimeSqlExpressionBuilder(query, 'created_at'),
        updatedAt = DateTimeSqlExpressionBuilder(query, 'updated_at'),
        title = StringSqlExpressionBuilder(query, 'title');

  final NumericSqlExpressionBuilder<int> id;

  final DateTimeSqlExpressionBuilder createdAt;

  final DateTimeSqlExpressionBuilder updatedAt;

  final StringSqlExpressionBuilder title;

  @override
  List<SqlExpressionBuilder> get expressionBuilders {
    return [id, createdAt, updatedAt, title];
  }
}

class CardQueryValues extends MapQueryValues {
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
  String? get title {
    return (values['title'] as String?);
  }

  set title(String? value) => values['title'] = value;
  void copyFrom(Card model) {
    createdAt = model.createdAt;
    updatedAt = model.updatedAt;
    title = model.title;
  }
}

class TeamQuery extends Query<Team, TeamQueryWhere> {
  TeamQuery({Query? parent, Set<String>? trampoline}) : super(parent: parent) {
    trampoline ??= <String>{};
    trampoline.add(tableName);
    _where = TeamQueryWhere(this);
    leftJoin(_slaves = PlayerQuery(trampoline: trampoline, parent: this), 'id',
        'team_id',
        additionalFields: const [
          'id',
          'created_at',
          'updated_at',
          'name',
          'uuid',
          'player_state'
        ],
        trampoline: trampoline);
    leftJoin(_master = PlayerQuery(trampoline: trampoline, parent: this), 'id',
        'team_id',
        additionalFields: const [
          'id',
          'created_at',
          'updated_at',
          'name',
          'uuid',
          'player_state'
        ],
        trampoline: trampoline);
  }

  @override
  final TeamQueryValues values = TeamQueryValues();

  List<String> _selectedFields = [];

  TeamQueryWhere? _where;

  late PlayerQuery _slaves;

  late PlayerQuery _master;

  @override
  Map<String, String> get casts {
    return {};
  }

  @override
  String get tableName {
    return 'teams';
  }

  @override
  List<String> get fields {
    const _fields = [
      'id',
      'created_at',
      'updated_at',
      'team_color',
      'team_state'
    ];
    return _selectedFields.isEmpty
        ? _fields
        : _fields.where((field) => _selectedFields.contains(field)).toList();
  }

  TeamQuery select(List<String> selectedFields) {
    _selectedFields = selectedFields;
    return this;
  }

  @override
  TeamQueryWhere? get where {
    return _where;
  }

  @override
  TeamQueryWhere newWhereClause() {
    return TeamQueryWhere(this);
  }

  Optional<Team> parseRow(List row) {
    if (row.every((x) => x == null)) {
      return Optional.empty();
    }
    var model = Team(
        id: fields.contains('id') ? row[0].toString() : null,
        createdAt: fields.contains('created_at') ? (row[1] as DateTime?) : null,
        updatedAt: fields.contains('updated_at') ? (row[2] as DateTime?) : null,
        teamColor: fields.contains('team_color')
            ? row[3] == null
                ? null
                : TeamColor?.values[(row[3] as int)]
            : null,
        teamState: fields.contains('team_state')
            ? row[4] == null
                ? null
                : TeamState?.values[(row[4] as int)]
            : null);
    if (row.length > 5) {
      var modelOpt = PlayerQuery().parseRow(row.skip(5).take(6).toList());
      modelOpt.ifPresent((m) {
        model = model.copyWith(slaves: [m]);
      });
    }
    if (row.length > 11) {
      var modelOpt = PlayerQuery().parseRow(row.skip(11).take(6).toList());
      modelOpt.ifPresent((m) {
        model = model.copyWith(master: m);
      });
    }
    return Optional.of(model);
  }

  @override
  Optional<Team> deserialize(List row) {
    return parseRow(row);
  }

  PlayerQuery get slaves {
    return _slaves;
  }

  PlayerQuery get master {
    return _master;
  }

  @override
  Future<List<Team>> get(QueryExecutor executor) {
    return super.get(executor).then((result) {
      return result.fold<List<Team>>([], (out, model) {
        var idx = out.indexWhere((m) => m.id == model.id);

        if (idx == -1) {
          return out..add(model);
        } else {
          var l = out[idx];
          return out
            ..[idx] = l.copyWith(
                slaves: List<_Player>.from(l.slaves)..addAll(model.slaves));
        }
      });
    });
  }

  @override
  Future<List<Team>> update(QueryExecutor executor) {
    return super.update(executor).then((result) {
      return result.fold<List<Team>>([], (out, model) {
        var idx = out.indexWhere((m) => m.id == model.id);

        if (idx == -1) {
          return out..add(model);
        } else {
          var l = out[idx];
          return out
            ..[idx] = l.copyWith(
                slaves: List<_Player>.from(l.slaves)..addAll(model.slaves));
        }
      });
    });
  }

  @override
  Future<List<Team>> delete(QueryExecutor executor) {
    return super.delete(executor).then((result) {
      return result.fold<List<Team>>([], (out, model) {
        var idx = out.indexWhere((m) => m.id == model.id);

        if (idx == -1) {
          return out..add(model);
        } else {
          var l = out[idx];
          return out
            ..[idx] = l.copyWith(
                slaves: List<_Player>.from(l.slaves)..addAll(model.slaves));
        }
      });
    });
  }
}

class TeamQueryWhere extends QueryWhere {
  TeamQueryWhere(TeamQuery query)
      : id = NumericSqlExpressionBuilder<int>(query, 'id'),
        createdAt = DateTimeSqlExpressionBuilder(query, 'created_at'),
        updatedAt = DateTimeSqlExpressionBuilder(query, 'updated_at'),
        teamColor = EnumSqlExpressionBuilder<TeamColor?>(
            query, 'team_color', (v) => v?.index as int),
        teamState = EnumSqlExpressionBuilder<TeamState?>(
            query, 'team_state', (v) => v?.index as int);

  final NumericSqlExpressionBuilder<int> id;

  final DateTimeSqlExpressionBuilder createdAt;

  final DateTimeSqlExpressionBuilder updatedAt;

  final EnumSqlExpressionBuilder<TeamColor?> teamColor;

  final EnumSqlExpressionBuilder<TeamState?> teamState;

  @override
  List<SqlExpressionBuilder> get expressionBuilders {
    return [id, createdAt, updatedAt, teamColor, teamState];
  }
}

class TeamQueryValues extends MapQueryValues {
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
  TeamColor? get teamColor {
    return TeamColor?.values[(values['team_color'] as int)];
  }

  set teamColor(TeamColor? value) => values['team_color'] = value?.index;
  TeamState? get teamState {
    return TeamState?.values[(values['team_state'] as int)];
  }

  set teamState(TeamState? value) => values['team_state'] = value?.index;
  void copyFrom(Team model) {
    createdAt = model.createdAt;
    updatedAt = model.updatedAt;
    teamColor = model.teamColor;
    teamState = model.teamState;
  }
}

class PlayerQuery extends Query<Player, PlayerQueryWhere> {
  PlayerQuery({Query? parent, Set<String>? trampoline})
      : super(parent: parent) {
    trampoline ??= <String>{};
    trampoline.add(tableName);
    _where = PlayerQueryWhere(this);
  }

  @override
  final PlayerQueryValues values = PlayerQueryValues();

  List<String> _selectedFields = [];

  PlayerQueryWhere? _where;

  @override
  Map<String, String> get casts {
    return {};
  }

  @override
  String get tableName {
    return 'players';
  }

  @override
  List<String> get fields {
    const _fields = [
      'id',
      'created_at',
      'updated_at',
      'name',
      'uuid',
      'player_state'
    ];
    return _selectedFields.isEmpty
        ? _fields
        : _fields.where((field) => _selectedFields.contains(field)).toList();
  }

  PlayerQuery select(List<String> selectedFields) {
    _selectedFields = selectedFields;
    return this;
  }

  @override
  PlayerQueryWhere? get where {
    return _where;
  }

  @override
  PlayerQueryWhere newWhereClause() {
    return PlayerQueryWhere(this);
  }

  Optional<Player> parseRow(List row) {
    if (row.every((x) => x == null)) {
      return Optional.empty();
    }
    var model = Player(
        id: fields.contains('id') ? row[0].toString() : null,
        createdAt: fields.contains('created_at') ? (row[1] as DateTime?) : null,
        updatedAt: fields.contains('updated_at') ? (row[2] as DateTime?) : null,
        name: fields.contains('name') ? (row[3] as String?) : null,
        uuid: fields.contains('uuid') ? (row[4] as String?) : null,
        playerState: fields.contains('player_state')
            ? row[5] == null
                ? null
                : PlayerState?.values[(row[5] as int)]
            : null);
    return Optional.of(model);
  }

  @override
  Optional<Player> deserialize(List row) {
    return parseRow(row);
  }
}

class PlayerQueryWhere extends QueryWhere {
  PlayerQueryWhere(PlayerQuery query)
      : id = NumericSqlExpressionBuilder<int>(query, 'id'),
        createdAt = DateTimeSqlExpressionBuilder(query, 'created_at'),
        updatedAt = DateTimeSqlExpressionBuilder(query, 'updated_at'),
        name = StringSqlExpressionBuilder(query, 'name'),
        uuid = StringSqlExpressionBuilder(query, 'uuid'),
        playerState = EnumSqlExpressionBuilder<PlayerState?>(
            query, 'player_state', (v) => v?.index as int);

  final NumericSqlExpressionBuilder<int> id;

  final DateTimeSqlExpressionBuilder createdAt;

  final DateTimeSqlExpressionBuilder updatedAt;

  final StringSqlExpressionBuilder name;

  final StringSqlExpressionBuilder uuid;

  final EnumSqlExpressionBuilder<PlayerState?> playerState;

  @override
  List<SqlExpressionBuilder> get expressionBuilders {
    return [id, createdAt, updatedAt, name, uuid, playerState];
  }
}

class PlayerQueryValues extends MapQueryValues {
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
  String? get name {
    return (values['name'] as String?);
  }

  set name(String? value) => values['name'] = value;
  String? get uuid {
    return (values['uuid'] as String?);
  }

  set uuid(String? value) => values['uuid'] = value;
  PlayerState? get playerState {
    return PlayerState?.values[(values['player_state'] as int)];
  }

  set playerState(PlayerState? value) => values['player_state'] = value?.index;
  void copyFrom(Player model) {
    createdAt = model.createdAt;
    updatedAt = model.updatedAt;
    name = model.name;
    uuid = model.uuid;
    playerState = model.playerState;
  }
}

class ActionQuery extends Query<Action, ActionQueryWhere> {
  ActionQuery({Query? parent, Set<String>? trampoline})
      : super(parent: parent) {
    trampoline ??= <String>{};
    trampoline.add(tableName);
    _where = ActionQueryWhere(this);
    leftJoin(_who = PlayerQuery(trampoline: trampoline, parent: this), 'id',
        'action_id',
        additionalFields: const [
          'id',
          'created_at',
          'updated_at',
          'name',
          'uuid',
          'player_state'
        ],
        trampoline: trampoline);
    leftJoin(_card = CardQuery(trampoline: trampoline, parent: this), 'id',
        'action_id',
        additionalFields: const ['id', 'created_at', 'updated_at', 'title'],
        trampoline: trampoline);
  }

  @override
  final ActionQueryValues values = ActionQueryValues();

  List<String> _selectedFields = [];

  ActionQueryWhere? _where;

  late PlayerQuery _who;

  late CardQuery _card;

  @override
  Map<String, String> get casts {
    return {};
  }

  @override
  String get tableName {
    return 'actions';
  }

  @override
  List<String> get fields {
    const _fields = ['id', 'created_at', 'updated_at'];
    return _selectedFields.isEmpty
        ? _fields
        : _fields.where((field) => _selectedFields.contains(field)).toList();
  }

  ActionQuery select(List<String> selectedFields) {
    _selectedFields = selectedFields;
    return this;
  }

  @override
  ActionQueryWhere? get where {
    return _where;
  }

  @override
  ActionQueryWhere newWhereClause() {
    return ActionQueryWhere(this);
  }

  Optional<Action> parseRow(List row) {
    if (row.every((x) => x == null)) {
      return Optional.empty();
    }
    var model = Action(
        id: fields.contains('id') ? row[0].toString() : null,
        createdAt: fields.contains('created_at') ? (row[1] as DateTime?) : null,
        updatedAt:
            fields.contains('updated_at') ? (row[2] as DateTime?) : null);
    if (row.length > 3) {
      var modelOpt = PlayerQuery().parseRow(row.skip(3).take(6).toList());
      modelOpt.ifPresent((m) {
        model = model.copyWith(who: m);
      });
    }
    if (row.length > 9) {
      var modelOpt = CardQuery().parseRow(row.skip(9).take(4).toList());
      modelOpt.ifPresent((m) {
        model = model.copyWith(card: m);
      });
    }
    return Optional.of(model);
  }

  @override
  Optional<Action> deserialize(List row) {
    return parseRow(row);
  }

  PlayerQuery get who {
    return _who;
  }

  CardQuery get card {
    return _card;
  }
}

class ActionQueryWhere extends QueryWhere {
  ActionQueryWhere(ActionQuery query)
      : id = NumericSqlExpressionBuilder<int>(query, 'id'),
        createdAt = DateTimeSqlExpressionBuilder(query, 'created_at'),
        updatedAt = DateTimeSqlExpressionBuilder(query, 'updated_at');

  final NumericSqlExpressionBuilder<int> id;

  final DateTimeSqlExpressionBuilder createdAt;

  final DateTimeSqlExpressionBuilder updatedAt;

  @override
  List<SqlExpressionBuilder> get expressionBuilders {
    return [id, createdAt, updatedAt];
  }
}

class ActionQueryValues extends MapQueryValues {
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
  void copyFrom(Action model) {
    createdAt = model.createdAt;
    updatedAt = model.updatedAt;
  }
}

class RuleQuery extends Query<Rule, RuleQueryWhere> {
  RuleQuery({Query? parent, Set<String>? trampoline}) : super(parent: parent) {
    trampoline ??= <String>{};
    trampoline.add(tableName);
    _where = RuleQueryWhere(this);
  }

  @override
  final RuleQueryValues values = RuleQueryValues();

  List<String> _selectedFields = [];

  RuleQueryWhere? _where;

  @override
  Map<String, String> get casts {
    return {};
  }

  @override
  String get tableName {
    return 'rules';
  }

  @override
  List<String> get fields {
    const _fields = ['id', 'created_at', 'updated_at', 'uuid'];
    return _selectedFields.isEmpty
        ? _fields
        : _fields.where((field) => _selectedFields.contains(field)).toList();
  }

  RuleQuery select(List<String> selectedFields) {
    _selectedFields = selectedFields;
    return this;
  }

  @override
  RuleQueryWhere? get where {
    return _where;
  }

  @override
  RuleQueryWhere newWhereClause() {
    return RuleQueryWhere(this);
  }

  Optional<Rule> parseRow(List row) {
    if (row.every((x) => x == null)) {
      return Optional.empty();
    }
    var model = Rule(
        id: fields.contains('id') ? row[0].toString() : null,
        createdAt: fields.contains('created_at') ? (row[1] as DateTime?) : null,
        updatedAt: fields.contains('updated_at') ? (row[2] as DateTime?) : null,
        uuid: fields.contains('uuid') ? (row[3] as String?) : null);
    return Optional.of(model);
  }

  @override
  Optional<Rule> deserialize(List row) {
    return parseRow(row);
  }
}

class RuleQueryWhere extends QueryWhere {
  RuleQueryWhere(RuleQuery query)
      : id = NumericSqlExpressionBuilder<int>(query, 'id'),
        createdAt = DateTimeSqlExpressionBuilder(query, 'created_at'),
        updatedAt = DateTimeSqlExpressionBuilder(query, 'updated_at'),
        uuid = StringSqlExpressionBuilder(query, 'uuid');

  final NumericSqlExpressionBuilder<int> id;

  final DateTimeSqlExpressionBuilder createdAt;

  final DateTimeSqlExpressionBuilder updatedAt;

  final StringSqlExpressionBuilder uuid;

  @override
  List<SqlExpressionBuilder> get expressionBuilders {
    return [id, createdAt, updatedAt, uuid];
  }
}

class RuleQueryValues extends MapQueryValues {
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
  String? get uuid {
    return (values['uuid'] as String?);
  }

  set uuid(String? value) => values['uuid'] = value;
  void copyFrom(Rule model) {
    createdAt = model.createdAt;
    updatedAt = model.updatedAt;
    uuid = model.uuid;
  }
}

// **************************************************************************
// JsonModelGenerator
// **************************************************************************

@generatedSerializable
class Room extends _Room {
  Room(
      {this.id,
      this.createdAt,
      this.updatedAt,
      List<_Card> cards = const [],
      List<_Team> teams = const [],
      List<_Action> history = const [],
      this.state,
      List<_Rule> rules = const []})
      : cards = List.unmodifiable(cards),
        teams = List.unmodifiable(teams),
        history = List.unmodifiable(history),
        rules = List.unmodifiable(rules);

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
  List<_Card> cards;

  @override
  List<_Team> teams;

  @override
  List<_Action> history;

  @override
  GameState? state;

  @override
  List<_Rule> rules;

  Room copyWith(
      {String? id,
      DateTime? createdAt,
      DateTime? updatedAt,
      List<_Card>? cards,
      List<_Team>? teams,
      List<_Action>? history,
      GameState? state,
      List<_Rule>? rules}) {
    return Room(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        cards: cards ?? this.cards,
        teams: teams ?? this.teams,
        history: history ?? this.history,
        state: state ?? this.state,
        rules: rules ?? this.rules);
  }

  @override
  bool operator ==(other) {
    return other is _Room &&
        other.id == id &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        ListEquality<_Card>(DefaultEquality<_Card>())
            .equals(other.cards, cards) &&
        ListEquality<_Team>(DefaultEquality<_Team>())
            .equals(other.teams, teams) &&
        ListEquality<_Action>(DefaultEquality<_Action>())
            .equals(other.history, history) &&
        other.state == state &&
        ListEquality<_Rule>(DefaultEquality<_Rule>())
            .equals(other.rules, rules);
  }

  @override
  int get hashCode {
    return hashObjects(
        [id, createdAt, updatedAt, cards, teams, history, state, rules]);
  }

  @override
  String toString() {
    return 'Room(id=$id, createdAt=$createdAt, updatedAt=$updatedAt, cards=$cards, teams=$teams, history=$history, state=$state, rules=$rules)';
  }

  Map<String, dynamic> toJson() {
    return RoomSerializer.toMap(this);
  }
}

@generatedSerializable
class Card extends _Card {
  Card({this.id, this.createdAt, this.updatedAt, this.title, this.team});

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
  String? title;

  @override
  _Team? team;

  Card copyWith(
      {String? id,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? title,
      _Team? team}) {
    return Card(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        title: title ?? this.title,
        team: team ?? this.team);
  }

  @override
  bool operator ==(other) {
    return other is _Card &&
        other.id == id &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.title == title &&
        other.team == team;
  }

  @override
  int get hashCode {
    return hashObjects([id, createdAt, updatedAt, title, team]);
  }

  @override
  String toString() {
    return 'Card(id=$id, createdAt=$createdAt, updatedAt=$updatedAt, title=$title, team=$team)';
  }

  Map<String, dynamic> toJson() {
    return CardSerializer.toMap(this);
  }
}

@generatedSerializable
class Team extends _Team {
  Team(
      {this.id,
      this.createdAt,
      this.updatedAt,
      List<_Player> slaves = const [],
      this.master,
      this.teamColor,
      this.teamState})
      : slaves = List.unmodifiable(slaves);

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
  List<_Player> slaves;

  @override
  _Player? master;

  @override
  TeamColor? teamColor;

  @override
  TeamState? teamState;

  Team copyWith(
      {String? id,
      DateTime? createdAt,
      DateTime? updatedAt,
      List<_Player>? slaves,
      _Player? master,
      TeamColor? teamColor,
      TeamState? teamState}) {
    return Team(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        slaves: slaves ?? this.slaves,
        master: master ?? this.master,
        teamColor: teamColor ?? this.teamColor,
        teamState: teamState ?? this.teamState);
  }

  @override
  bool operator ==(other) {
    return other is _Team &&
        other.id == id &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        ListEquality<_Player>(DefaultEquality<_Player>())
            .equals(other.slaves, slaves) &&
        other.master == master &&
        other.teamColor == teamColor &&
        other.teamState == teamState;
  }

  @override
  int get hashCode {
    return hashObjects(
        [id, createdAt, updatedAt, slaves, master, teamColor, teamState]);
  }

  @override
  String toString() {
    return 'Team(id=$id, createdAt=$createdAt, updatedAt=$updatedAt, slaves=$slaves, master=$master, teamColor=$teamColor, teamState=$teamState)';
  }

  Map<String, dynamic> toJson() {
    return TeamSerializer.toMap(this);
  }
}

@generatedSerializable
class Player extends _Player {
  Player(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.name,
      this.uuid,
      this.playerState});

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
  String? name;

  @override
  String? uuid;

  @override
  PlayerState? playerState;

  Player copyWith(
      {String? id,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? name,
      String? uuid,
      PlayerState? playerState}) {
    return Player(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        name: name ?? this.name,
        uuid: uuid ?? this.uuid,
        playerState: playerState ?? this.playerState);
  }

  @override
  bool operator ==(other) {
    return other is _Player &&
        other.id == id &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.name == name &&
        other.uuid == uuid &&
        other.playerState == playerState;
  }

  @override
  int get hashCode {
    return hashObjects([id, createdAt, updatedAt, name, uuid, playerState]);
  }

  @override
  String toString() {
    return 'Player(id=$id, createdAt=$createdAt, updatedAt=$updatedAt, name=$name, uuid=$uuid, playerState=$playerState)';
  }

  Map<String, dynamic> toJson() {
    return PlayerSerializer.toMap(this);
  }
}

@generatedSerializable
class Action extends _Action {
  Action({this.id, this.createdAt, this.updatedAt, this.who, this.card});

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
  _Player? who;

  @override
  _Card? card;

  Action copyWith(
      {String? id,
      DateTime? createdAt,
      DateTime? updatedAt,
      _Player? who,
      _Card? card}) {
    return Action(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        who: who ?? this.who,
        card: card ?? this.card);
  }

  @override
  bool operator ==(other) {
    return other is _Action &&
        other.id == id &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.who == who &&
        other.card == card;
  }

  @override
  int get hashCode {
    return hashObjects([id, createdAt, updatedAt, who, card]);
  }

  @override
  String toString() {
    return 'Action(id=$id, createdAt=$createdAt, updatedAt=$updatedAt, who=$who, card=$card)';
  }

  Map<String, dynamic> toJson() {
    return ActionSerializer.toMap(this);
  }
}

@generatedSerializable
class Rule extends _Rule {
  Rule({this.id, this.createdAt, this.updatedAt, this.uuid});

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
  String? uuid;

  Rule copyWith(
      {String? id, DateTime? createdAt, DateTime? updatedAt, String? uuid}) {
    return Rule(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        uuid: uuid ?? this.uuid);
  }

  @override
  bool operator ==(other) {
    return other is _Rule &&
        other.id == id &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.uuid == uuid;
  }

  @override
  int get hashCode {
    return hashObjects([id, createdAt, updatedAt, uuid]);
  }

  @override
  String toString() {
    return 'Rule(id=$id, createdAt=$createdAt, updatedAt=$updatedAt, uuid=$uuid)';
  }

  Map<String, dynamic> toJson() {
    return RuleSerializer.toMap(this);
  }
}

// **************************************************************************
// SerializerGenerator
// **************************************************************************

const RoomSerializer roomSerializer = RoomSerializer();

class RoomEncoder extends Converter<Room, Map> {
  const RoomEncoder();

  @override
  Map convert(Room model) => RoomSerializer.toMap(model);
}

class RoomDecoder extends Converter<Map, Room> {
  const RoomDecoder();

  @override
  Room convert(Map map) => RoomSerializer.fromMap(map);
}

class RoomSerializer extends Codec<Room, Map> {
  const RoomSerializer();

  @override
  RoomEncoder get encoder => const RoomEncoder();
  @override
  RoomDecoder get decoder => const RoomDecoder();
  static Room fromMap(Map map) {
    return Room(
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
        cards: map['cards'] is Iterable
            ? List.unmodifiable(((map['cards'] as Iterable).whereType<Map>())
                .map(CardSerializer.fromMap))
            : [],
        teams: map['teams'] is Iterable
            ? List.unmodifiable(((map['teams'] as Iterable).whereType<Map>())
                .map(TeamSerializer.fromMap))
            : [],
        history: map['history'] is Iterable
            ? List.unmodifiable(((map['history'] as Iterable).whereType<Map>())
                .map(ActionSerializer.fromMap))
            : [],
        state: map['state'] is GameState?
            ? (map['state'] as GameState?)
            : (map['state'] is int
                ? GameState?.values[map['state'] as int]
                : null),
        rules: map['rules'] is Iterable
            ? List.unmodifiable(((map['rules'] as Iterable).whereType<Map>()).map(RuleSerializer.fromMap))
            : []);
  }

  static Map<String, dynamic> toMap(_Room? model) {
    if (model == null) {
      return {};
    }
    return {
      'id': model.id,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String(),
      'cards': model.cards.map((m) => CardSerializer.toMap(m)).toList(),
      'teams': model.teams.map((m) => TeamSerializer.toMap(m)).toList(),
      'history': model.history.map((m) => ActionSerializer.toMap(m)).toList(),
      'state':
          model.state != null ? GameState.values.indexOf(model.state!) : null,
      'rules': model.rules.map((m) => RuleSerializer.toMap(m)).toList()
    };
  }
}

abstract class RoomFields {
  static const List<String> allFields = <String>[
    id,
    createdAt,
    updatedAt,
    cards,
    teams,
    history,
    state,
    rules
  ];

  static const String id = 'id';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';

  static const String cards = 'cards';

  static const String teams = 'teams';

  static const String history = 'history';

  static const String state = 'state';

  static const String rules = 'rules';
}

const CardSerializer cardSerializer = CardSerializer();

class CardEncoder extends Converter<Card, Map> {
  const CardEncoder();

  @override
  Map convert(Card model) => CardSerializer.toMap(model);
}

class CardDecoder extends Converter<Map, Card> {
  const CardDecoder();

  @override
  Card convert(Map map) => CardSerializer.fromMap(map);
}

class CardSerializer extends Codec<Card, Map> {
  const CardSerializer();

  @override
  CardEncoder get encoder => const CardEncoder();
  @override
  CardDecoder get decoder => const CardDecoder();
  static Card fromMap(Map map) {
    return Card(
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
        title: map['title'] as String?,
        team: map['team'] != null
            ? TeamSerializer.fromMap(map['team'] as Map)
            : null);
  }

  static Map<String, dynamic> toMap(_Card? model) {
    if (model == null) {
      return {};
    }
    return {
      'id': model.id,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String(),
      'title': model.title,
      'team': TeamSerializer.toMap(model.team)
    };
  }
}

abstract class CardFields {
  static const List<String> allFields = <String>[
    id,
    createdAt,
    updatedAt,
    title,
    team
  ];

  static const String id = 'id';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';

  static const String title = 'title';

  static const String team = 'team';
}

const TeamSerializer teamSerializer = TeamSerializer();

class TeamEncoder extends Converter<Team, Map> {
  const TeamEncoder();

  @override
  Map convert(Team model) => TeamSerializer.toMap(model);
}

class TeamDecoder extends Converter<Map, Team> {
  const TeamDecoder();

  @override
  Team convert(Map map) => TeamSerializer.fromMap(map);
}

class TeamSerializer extends Codec<Team, Map> {
  const TeamSerializer();

  @override
  TeamEncoder get encoder => const TeamEncoder();
  @override
  TeamDecoder get decoder => const TeamDecoder();
  static Team fromMap(Map map) {
    return Team(
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
        slaves: map['slaves'] is Iterable
            ? List.unmodifiable(((map['slaves'] as Iterable).whereType<Map>())
                .map(PlayerSerializer.fromMap))
            : [],
        master: map['master'] != null
            ? PlayerSerializer.fromMap(map['master'] as Map)
            : null,
        teamColor: map['team_color'] is TeamColor?
            ? (map['team_color'] as TeamColor?)
            : (map['team_color'] is int
                ? TeamColor?.values[map['team_color'] as int]
                : null),
        teamState: map['team_state'] is TeamState?
            ? (map['team_state'] as TeamState?)
            : (map['team_state'] is int
                ? TeamState?.values[map['team_state'] as int]
                : null));
  }

  static Map<String, dynamic> toMap(_Team? model) {
    if (model == null) {
      return {};
    }
    return {
      'id': model.id,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String(),
      'slaves': model.slaves.map((m) => PlayerSerializer.toMap(m)).toList(),
      'master': PlayerSerializer.toMap(model.master),
      'team_color': model.teamColor != null
          ? TeamColor.values.indexOf(model.teamColor!)
          : null,
      'team_state': model.teamState != null
          ? TeamState.values.indexOf(model.teamState!)
          : null
    };
  }
}

abstract class TeamFields {
  static const List<String> allFields = <String>[
    id,
    createdAt,
    updatedAt,
    slaves,
    master,
    teamColor,
    teamState
  ];

  static const String id = 'id';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';

  static const String slaves = 'slaves';

  static const String master = 'master';

  static const String teamColor = 'team_color';

  static const String teamState = 'team_state';
}

const PlayerSerializer playerSerializer = PlayerSerializer();

class PlayerEncoder extends Converter<Player, Map> {
  const PlayerEncoder();

  @override
  Map convert(Player model) => PlayerSerializer.toMap(model);
}

class PlayerDecoder extends Converter<Map, Player> {
  const PlayerDecoder();

  @override
  Player convert(Map map) => PlayerSerializer.fromMap(map);
}

class PlayerSerializer extends Codec<Player, Map> {
  const PlayerSerializer();

  @override
  PlayerEncoder get encoder => const PlayerEncoder();
  @override
  PlayerDecoder get decoder => const PlayerDecoder();
  static Player fromMap(Map map) {
    return Player(
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
        name: map['name'] as String?,
        uuid: map['uuid'] as String?,
        playerState: map['player_state'] is PlayerState?
            ? (map['player_state'] as PlayerState?)
            : (map['player_state'] is int
                ? PlayerState?.values[map['player_state'] as int]
                : null));
  }

  static Map<String, dynamic> toMap(_Player? model) {
    if (model == null) {
      return {};
    }
    return {
      'id': model.id,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String(),
      'name': model.name,
      'uuid': model.uuid,
      'player_state': model.playerState != null
          ? PlayerState.values.indexOf(model.playerState!)
          : null
    };
  }
}

abstract class PlayerFields {
  static const List<String> allFields = <String>[
    id,
    createdAt,
    updatedAt,
    name,
    uuid,
    playerState
  ];

  static const String id = 'id';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';

  static const String name = 'name';

  static const String uuid = 'uuid';

  static const String playerState = 'player_state';
}

const ActionSerializer actionSerializer = ActionSerializer();

class ActionEncoder extends Converter<Action, Map> {
  const ActionEncoder();

  @override
  Map convert(Action model) => ActionSerializer.toMap(model);
}

class ActionDecoder extends Converter<Map, Action> {
  const ActionDecoder();

  @override
  Action convert(Map map) => ActionSerializer.fromMap(map);
}

class ActionSerializer extends Codec<Action, Map> {
  const ActionSerializer();

  @override
  ActionEncoder get encoder => const ActionEncoder();
  @override
  ActionDecoder get decoder => const ActionDecoder();
  static Action fromMap(Map map) {
    return Action(
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
        who: map['who'] != null
            ? PlayerSerializer.fromMap(map['who'] as Map)
            : null,
        card: map['card'] != null
            ? CardSerializer.fromMap(map['card'] as Map)
            : null);
  }

  static Map<String, dynamic> toMap(_Action? model) {
    if (model == null) {
      return {};
    }
    return {
      'id': model.id,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String(),
      'who': PlayerSerializer.toMap(model.who),
      'card': CardSerializer.toMap(model.card)
    };
  }
}

abstract class ActionFields {
  static const List<String> allFields = <String>[
    id,
    createdAt,
    updatedAt,
    who,
    card
  ];

  static const String id = 'id';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';

  static const String who = 'who';

  static const String card = 'card';
}

const RuleSerializer ruleSerializer = RuleSerializer();

class RuleEncoder extends Converter<Rule, Map> {
  const RuleEncoder();

  @override
  Map convert(Rule model) => RuleSerializer.toMap(model);
}

class RuleDecoder extends Converter<Map, Rule> {
  const RuleDecoder();

  @override
  Rule convert(Map map) => RuleSerializer.fromMap(map);
}

class RuleSerializer extends Codec<Rule, Map> {
  const RuleSerializer();

  @override
  RuleEncoder get encoder => const RuleEncoder();
  @override
  RuleDecoder get decoder => const RuleDecoder();
  static Rule fromMap(Map map) {
    return Rule(
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
        uuid: map['uuid'] as String?);
  }

  static Map<String, dynamic> toMap(_Rule? model) {
    if (model == null) {
      return {};
    }
    return {
      'id': model.id,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String(),
      'uuid': model.uuid
    };
  }
}

abstract class RuleFields {
  static const List<String> allFields = <String>[
    id,
    createdAt,
    updatedAt,
    uuid
  ];

  static const String id = 'id';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';

  static const String uuid = 'uuid';
}
