import 'dart:async';
import "package:angel3_framework/angel3_framework.dart";
import "package:angel3_websocket/server.dart";

@Expose("/ws")
class MyController extends WebSocketController {
  // A reference to the WebSocket plug-in is required.
  MyController(AngelWebSocket ws) : super(ws);

  @override
  void onConnect(WebSocketContext socket) {
    socket.send('event1', 'event1_data');
    // On connect...
  }

  // Dependency injection works, too..
  @ExposeWs("read_message")
  void sendMessage(WebSocketContext socket, WebSocketAction action) async {
    socket.send("found_message", 'data');
  }

  // Event filtering
  @ExposeWs("foo")
  void foo() {
    broadcast(
      'event3',
      'event3_data',
      filter: (socket) async => socket.send('event2', 'event2_data'),
    );
  }
}
