import Foundation

typealias Handler = (MessagesViewController.MessagesViewState) -> Void

/// Protocol for business logic
protocol MessagesController: class {
  
  /// This function fetch messages
  ///
  /// - Parameter completion: Handler
  func loadMessages(completion: @escaping Handler)
}

/// Implementation for MessagesController
class MessagesControllerImp: MessagesController {
  // MARK: - Private properties
  private var currentMessages: [Message] = []
  private var messagesService: MessagesNetworkService!
  
  init(messagesService: MessagesNetworkService) {
    self.messagesService = messagesService
  }
  
  func loadMessages(completion: @escaping Handler) {
    messagesService.fetchMessages { result in
      switch result {
      case .failure(let error):
        switch error {
        case .empty:
          completion(.empty)
        case .noConnection:
          completion(.failed("No internet connection"))
        case .serverError:
          completion(.failed("No connection to server. Please, try again later"))
        }
      case .success(let messages):
        self.prepareMessages(messages: messages, completion: completion)
      }
    }
  }
  
  // MARK: - Private Methods
  private func prepareMessages(messages: [Message], completion: @escaping Handler) {
    let messages = messages.sorted { m1, m2 in
      guard let d1 = m1.dateValue, let d2 = m2.dateValue else {
        return true
      }
      return d1 > d2
    }
    completion(.presenting(messages))
  }
}


