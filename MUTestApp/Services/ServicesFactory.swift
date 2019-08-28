import Foundation

protocol ServicesFactory {
  
  var messagesService: MessagesNetworkService {get}
}

class ServicesFactoryImp: ServicesFactory {
  
  let isTestMode = false
  
  lazy var messagesService: MessagesNetworkService = {
    let service = MessagesNetworkServiceImp()
    
    if isTestMode {
      return MockMessagesNetworkService()
    }
    
    return service
  }()
}
