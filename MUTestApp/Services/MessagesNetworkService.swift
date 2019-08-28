import Alamofire

/// Enum representing MessagesNetworkServiceError errors
///
/// - empty: An empty response from server
/// - noConnection: Mo connection with enternet
/// - serverError: An server occurred error
enum MessagesNetworkServiceError: Error {
  case empty
  case noConnection
  case serverError
}

/// Protocol for Messages Service
protocol MessagesNetworkService {
  
  /// This function handles messages fetch process
  ///
  /// - Parameter completion: Closure as Array of Message objects
  func fetchMessages(completion: @escaping Completion<[Message], MessagesNetworkServiceError>)
}

/// Implementation for Messages Service
class MessagesNetworkServiceImp: MessagesNetworkService {
  
  func fetchMessages(completion: @escaping Completion<[Message], MessagesNetworkServiceError>) {
    AF.request(Constants.endpointURL + "/mu-ios/testwork/messages.json").responseDecodable {  (response:DataResponse<MessagesResponse>) in
      switch response.result {
      case .failure(let error):
        print(error)
        if !Reachability.isInternetAvailable {
          completion(.failure(.noConnection))
        } else {
          completion(.failure(.serverError))
        }
      case .success(let data):
        completion(.success(data.messages))
      }
      
    }
  }
}
