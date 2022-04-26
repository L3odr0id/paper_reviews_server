// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report.dart';

// **************************************************************************
// MigrationGenerator
// **************************************************************************

class ReportMigration extends Migration {
  @override
  void up(Schema schema) {
    schema.create('reports', (table) {
      table.serial('id').primaryKey();
      table.timeStamp('created_at');
      table.timeStamp('updated_at');
      table.varChar('subject', length: 255);
      table.varChar('message', length: 255);
      table.varChar('author', length: 255);
      table.timeStamp('date');
    });
  }

  @override
  void down(Schema schema) {
    schema.drop('reports');
  }
}

// **************************************************************************
// OrmGenerator
// **************************************************************************

class ReportQuery extends Query<Report, ReportQueryWhere> {
  ReportQuery({Query? parent, Set<String>? trampoline})
      : super(parent: parent) {
    trampoline ??= <String>{};
    trampoline.add(tableName);
    _where = ReportQueryWhere(this);
  }

  @override
  final ReportQueryValues values = ReportQueryValues();

  List<String> _selectedFields = [];

  ReportQueryWhere? _where;

  @override
  Map<String, String> get casts {
    return {};
  }

  @override
  String get tableName {
    return 'reports';
  }

  @override
  List<String> get fields {
    const _fields = [
      'id',
      'created_at',
      'updated_at',
      'subject',
      'message',
      'author',
      'date'
    ];
    return _selectedFields.isEmpty
        ? _fields
        : _fields.where((field) => _selectedFields.contains(field)).toList();
  }

  ReportQuery select(List<String> selectedFields) {
    _selectedFields = selectedFields;
    return this;
  }

  @override
  ReportQueryWhere? get where {
    return _where;
  }

  @override
  ReportQueryWhere newWhereClause() {
    return ReportQueryWhere(this);
  }

  Optional<Report> parseRow(List row) {
    if (row.every((x) => x == null)) {
      return Optional.empty();
    }
    var model = Report(
        id: fields.contains('id') ? row[0].toString() : null,
        createdAt: fields.contains('created_at') ? (row[1] as DateTime?) : null,
        updatedAt: fields.contains('updated_at') ? (row[2] as DateTime?) : null,
        subject: fields.contains('subject') ? (row[3] as String?) : null,
        message: fields.contains('message') ? (row[4] as String?) : null,
        author: fields.contains('author') ? (row[5] as String?) : null,
        date: fields.contains('date') ? (row[6] as DateTime?) : null);
    return Optional.of(model);
  }

  @override
  Optional<Report> deserialize(List row) {
    return parseRow(row);
  }
}

class ReportQueryWhere extends QueryWhere {
  ReportQueryWhere(ReportQuery query)
      : id = NumericSqlExpressionBuilder<int>(query, 'id'),
        createdAt = DateTimeSqlExpressionBuilder(query, 'created_at'),
        updatedAt = DateTimeSqlExpressionBuilder(query, 'updated_at'),
        subject = StringSqlExpressionBuilder(query, 'subject'),
        message = StringSqlExpressionBuilder(query, 'message'),
        author = StringSqlExpressionBuilder(query, 'author'),
        date = DateTimeSqlExpressionBuilder(query, 'date');

  final NumericSqlExpressionBuilder<int> id;

  final DateTimeSqlExpressionBuilder createdAt;

  final DateTimeSqlExpressionBuilder updatedAt;

  final StringSqlExpressionBuilder subject;

  final StringSqlExpressionBuilder message;

  final StringSqlExpressionBuilder author;

  final DateTimeSqlExpressionBuilder date;

  @override
  List<SqlExpressionBuilder> get expressionBuilders {
    return [id, createdAt, updatedAt, subject, message, author, date];
  }
}

class ReportQueryValues extends MapQueryValues {
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
  String? get subject {
    return (values['subject'] as String?);
  }

  set subject(String? value) => values['subject'] = value;
  String? get message {
    return (values['message'] as String?);
  }

  set message(String? value) => values['message'] = value;
  String? get author {
    return (values['author'] as String?);
  }

  set author(String? value) => values['author'] = value;
  DateTime? get date {
    return (values['date'] as DateTime?);
  }

  set date(DateTime? value) => values['date'] = value;
  void copyFrom(Report model) {
    createdAt = model.createdAt;
    updatedAt = model.updatedAt;
    subject = model.subject;
    message = model.message;
    author = model.author;
    date = model.date;
  }
}

// **************************************************************************
// JsonModelGenerator
// **************************************************************************

@generatedSerializable
class Report extends _Report {
  Report(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.subject,
      this.message,
      this.author,
      this.date});

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
  String? subject;

  @override
  String? message;

  @override
  String? author;

  @override
  DateTime? date;

  Report copyWith(
      {String? id,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? subject,
      String? message,
      String? author,
      DateTime? date}) {
    return Report(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        subject: subject ?? this.subject,
        message: message ?? this.message,
        author: author ?? this.author,
        date: date ?? this.date);
  }

  @override
  bool operator ==(other) {
    return other is _Report &&
        other.id == id &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.subject == subject &&
        other.message == message &&
        other.author == author &&
        other.date == date;
  }

  @override
  int get hashCode {
    return hashObjects(
        [id, createdAt, updatedAt, subject, message, author, date]);
  }

  @override
  String toString() {
    return 'Report(id=$id, createdAt=$createdAt, updatedAt=$updatedAt, subject=$subject, message=$message, author=$author, date=$date)';
  }

  Map<String, dynamic> toJson() {
    return ReportSerializer.toMap(this);
  }
}

// **************************************************************************
// SerializerGenerator
// **************************************************************************

const ReportSerializer reportSerializer = ReportSerializer();

class ReportEncoder extends Converter<Report, Map> {
  const ReportEncoder();

  @override
  Map convert(Report model) => ReportSerializer.toMap(model);
}

class ReportDecoder extends Converter<Map, Report> {
  const ReportDecoder();

  @override
  Report convert(Map map) => ReportSerializer.fromMap(map);
}

class ReportSerializer extends Codec<Report, Map> {
  const ReportSerializer();

  @override
  ReportEncoder get encoder => const ReportEncoder();
  @override
  ReportDecoder get decoder => const ReportDecoder();
  static Report fromMap(Map map) {
    return Report(
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
        subject: map['subject'] as String?,
        message: map['message'] as String?,
        author: map['author'] as String?,
        date: map['date'] != null
            ? (map['date'] is DateTime
                ? (map['date'] as DateTime)
                : DateTime.parse(map['date'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_Report? model) {
    if (model == null) {
      return {};
    }
    return {
      'id': model.id,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String(),
      'subject': model.subject,
      'message': model.message,
      'author': model.author,
      'date': model.date?.toIso8601String()
    };
  }
}

abstract class ReportFields {
  static const List<String> allFields = <String>[
    id,
    createdAt,
    updatedAt,
    subject,
    message,
    author,
    date
  ];

  static const String id = 'id';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';

  static const String subject = 'subject';

  static const String message = 'message';

  static const String author = 'author';

  static const String date = 'date';
}
