import Foundation

class MockMessagesNetworkService: MessagesNetworkService {
  let mockMessages: [Message] = [
    Message(date: "", body: "Test1 Desciption", from: Image(image: "", name: "Name 1")),
    Message(date: "", body: "Test2 Desciption", from: Image(image: "", name: "Name 2")),
    Message(date: "", body: "Test3 Desciption", from: Image(image: "", name: "Name 3")),
    Message(date: "", body: "Test4 Desciption", from: Image(image: "", name: "Name 4")),
    Message(date: "", body: "Test5 Desciption", from: Image(image: "", name: "Name 5")),
    Message(date: "", body: "Test6 Desciption", from: Image(image: "", name: "Name 6")),
    Message(date: "", body: "Test7 Desciption", from: Image(image: "", name: "Name 7"))
  
  ]
  
  enum State {
    case failted(MessagesNetworkServiceError)
    case success([Message])
  }
  
  var state: Result<[Message], MessagesNetworkServiceError>! {
    return .failure(.empty)
  }
  var newState: Result<[Message], MessagesNetworkServiceError>! {
//    return .success(mockMessages)
    return .failure(.serverError)
  }
  var callsCount = 0
  var newStateCallsCount = 3
  
  func fetchMessages(completion: @escaping Completion<[Message], MessagesNetworkServiceError>) {
    callsCount += 1
    var _state = state
    
    if newStateCallsCount == callsCount {
      _state = newState
    }
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
      completion(_state!)
    }
  }
}
