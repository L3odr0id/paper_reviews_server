import 'dart:async';
import "package:angel3_framework/angel3_framework.dart";
import "package:angel3_websocket/server.dart";

@Expose("/ws/:message")
class MyController extends WebSocketController {
  // A reference to the WebSocket plug-in is required.
  MyController(AngelWebSocket ws) : super(ws);

  String roomId(WebSocketContext socker) {
    return socker.request.path.split('/').last;
  }

  @override
  void onConnect(WebSocketContext socket) {
    // socket.request.

    var message = roomId(socket);
    print('connected to $message');
    socket.send('event1', 'event1_data $message');
    // On connect...
  }

  // Dependency injection works, too..
  @ExposeWs("read_message")
  void sendMessage(WebSocketContext socket, WebSocketAction action) async {
    print('read' + action.data.toString());
    socket.send("found_message", 'data');
  }

  @override
  dynamic onData(data, WebSocketContext socket) {
    print('$data');
  }

  // Event filtering
  @ExposeWs("foo")
  void foo() {
    print('foo');
    broadcast(
      'event3',
      'event3_data',
      filter: (socket) async => socket.send('event2', 'event2_data'),
    );
  }
}
