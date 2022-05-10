import 'package:angel3_framework/angel3_framework.dart';
import 'package:angel3_orm/angel3_orm.dart';
import 'package:angel3_serialize/angel3_serialize.dart';
import 'package:angel3_static/angel3_static.dart';
import 'package:cursach_reports_backend/common/string_hash.dart';
import 'package:cursach_reports_backend/models.dart';
import 'package:cursach_reports_backend/src/models/user.dart';
import 'package:file/file.dart';
import 'package:logging/logging.dart';
import 'controllers/controllers.dart' as controllers;

/// Put your app routes here!
///
/// See the wiki for information about routing, requests, and responses:
/// * https://angel3-docs.dukefirehawk.com/guides/basic-routing
/// * https://angel3-docs.dukefirehawk.com/guides/requests-and-responses
AngelConfigurer configureServer(FileSystem fileSystem) {
  return (Angel app) async {
    // Typically, you want to mount controllers first, after any global middleware.
    await app.configure(controllers.configureServer);

    // Render `views/hello.jl` when a user visits the application root.
    // app.get('/', (req, res) => res.render('hello'));

    app.get('/user/:login', (req, res) async {
      throwMissingParam(req, 'login');
      throwMissingQuery(req, 'password');

      var login = req.params['login'] as String;
      var password = req.queryParameters['password'] as String;
      print(login + ' ' + password);
      var executor = req.container!.make<QueryExecutor>();
      var query = UserQuery()
        ..where!.login.equals(login)
        ..where!.password.equals(password.sha256Hash);

      final user = await query.get(executor);
      return {'success': user.isNotEmpty};
    });

    app.post('/user/', (req, res) async {
      await req.parseBody();

      throwMissingKey(req, 'login');
      throwMissingKey(req, 'password');

      var login = req.bodyAsMap['login'] as String;
      var password = req.bodyAsMap['password'] as String;

      print(login + ' ' + password);
      var executor = req.container!.make<QueryExecutor>();

      var query = UserQuery()
        ..values.login = login
        ..values.password = password.sha256Hash;
      var optional = await query.insert(executor);
      return {"success": optional.isPresent};
    });

    app.post('/report/', (req, res) async {
      print('REAL report post');
      await req.parseBody();

      throwMissingKey(req, 'subject');
      throwMissingKey(req, 'title');
      throwMissingKey(req, 'message');
      throwMissingKey(req, 'author');
      throwMissingKey(req, 'date');
      throwMissingKey(req, 'is_anonymous');

      var executor = req.container!.make<QueryExecutor>();
      var subject = req.bodyAsMap['subject'].toString();
      var title = req.bodyAsMap['title'].toString();
      var message = req.bodyAsMap['message'].toString();
      var author = req.bodyAsMap['author'].toString();
      var isAnonymous = req.bodyAsMap['is_anonymous'] as bool?;
      var date = req.bodyAsMap['date'];
      if (date is! int) {
        throw AngelHttpException.badRequest(message: 'date has to be int');
      }

      var query = ReportQuery()
        // ..values.id = Random().nextInt(0x7fffffff).toString()
        ..values.message = message
        ..values.author = author
        ..values.subject = subject
        ..values.title = title
        ..values.isAnonymous = isAnonymous
        ..values.date = DateTime.fromMillisecondsSinceEpoch(date);
      var optional = await query.insert(executor);
      return optional.value;
    });

    app.put('/report/', (req, res) async {
      print('REAL report put');
      await req.parseBody();

      throwMissingKey(req, 'subject');
      throwMissingKey(req, 'title');
      throwMissingKey(req, 'message');
      throwMissingKey(req, 'author');
      throwMissingKey(req, 'date');
      throwMissingKey(req, 'id');
      throwMissingKey(req, 'is_anonymous');

      var executor = req.container!.make<QueryExecutor>();
      var subject = req.bodyAsMap['subject'].toString();
      var title = req.bodyAsMap['title'].toString();
      var message = req.bodyAsMap['message'].toString();
      var author = req.bodyAsMap['author'].toString();
      var id = req.bodyAsMap['id'].toString();
      var isAnonymous = req.bodyAsMap['is_anonymous'] as bool?;
      var date = req.bodyAsMap['date'];
      if (date is! int) {
        throw AngelHttpException.badRequest(message: 'date has to be int');
      }

      var query = ReportQuery()
        ..values.id = id
        ..values.message = message
        ..values.author = author
        ..values.subject = subject
        ..values.title = title
        ..values.isAnonymous = isAnonymous
        ..values.date = DateTime.fromMillisecondsSinceEpoch(date);

      var optional = await query.update(executor);
      return optional.first;
    });

    app.get('/reports', (req, res) {
      print('REAL report get');
      var executor = req.container!.make<QueryExecutor>();
      var query = ReportQuery();
      return query.get(executor);
    });

    // Mount static server at web in development.
    // The `CachingVirtualDirectory` variant of `VirtualDirectory` also sends `Cache-Control` headers.
    //
    // In production, however, prefer serving static files through NGINX or a
    // similar reverse proxy.
    //
    // Read the following two sources for documentation:
    // * https://medium.com/the-angel-framework/serving-static-files-with-the-angel-framework-2ddc7a2b84ae
    // * https://pub.dev/packages/angel3_static
    if (!app.environment.isProduction) {
      var vDir = VirtualDirectory(
        app,
        fileSystem,
        source: fileSystem.directory('web'),
      );
      app.fallback(vDir.handleRequest);
    }

    // Throw a 404 if no route matched the request.
    // app.fallback((req, res) => throw AngelHttpException.notFound());

    // Set our application up to handle different errors.
    //
    // Read the following for documentation:
    // * https://angel3-docs.dukefirehawk.com/guides/error-handling

    var oldErrorHandler = app.errorHandler;
    app.errorHandler = (e, req, res) async {
      if (req.accepts('text/html', strict: true)) {
        if (e.statusCode == 404 && req.accepts('text/html', strict: true)) {
          await res
              .render('error', {'message': 'No file exists at ${req.uri}.'});
        } else {
          await res.render('error', {'message': e.message});
        }
      } else {
        return await oldErrorHandler(e, req, res);
      }
    };
  };
}

void throwMissingKey(RequestContext req, String key) {
  if (!req.bodyAsMap.containsKey(key)) {
    throw AngelHttpException.badRequest(message: 'Missing body key "$key".');
  }
}

void throwMissingParam(RequestContext req, String key) {
  if (!req.params.containsKey(key)) {
    throw AngelHttpException.badRequest(message: 'Missing param "$key".');
  }
}

void throwMissingQuery(RequestContext req, String key) {
  if (!req.queryParameters.containsKey(key)) {
    throw AngelHttpException.badRequest(message: 'Missing query "$key".');
  }
}
