import Foundation

protocol ServicesFactory {
  
  var messagesService: MessagesNetworkService {get}
}

class ServicesFactoryImp: ServicesFactory {
  
  lazy var messagesService: MessagesNetworkService = {
    let service = MessagesNetworkServiceImp()
    
    return service
  }()
}
