import UIKit

class MessagesViewController: BaseViewController {
  // MARK: - Types
  enum MessagesViewState {
    case loading
    case empty
    case presenting([Message])
    case failed(String)
  }
  // MARK: - Constants
    
  // MARK: - IBOutlet
  @IBOutlet private weak var messagesTableView: UITableView!
  
  // MARK: - Public Properties
  var controller: MessagesController!
  
  // MARK: - Private Properties
  private var refreshControl: UIRefreshControl!
  private var messages: [Message] = []
  // MARK: - Initializers
    
  // MARK: - Life Circle
  override func viewDidLoad() {
    super.viewDidLoad()
    setupMessagesTableView()
    setupRefreshControl()
    setupView()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    reloadState()
  }
  
  // MARK: - Public methods
  
  // MARK: - IBAction
  
  // MARK: - Private Methods
  private func setupMessagesTableView() {
    let nib = UINib(nibName: "MessageTableViewCell", bundle: nil)
    messagesTableView.register(nib, forCellReuseIdentifier: "MessageTableViewCell")
    messagesTableView.estimatedRowHeight = 0
    messagesTableView.rowHeight = UITableView.automaticDimension
    messagesTableView.estimatedRowHeight = 44
  }
  
  private func setupRefreshControl() {
    refreshControl = UIRefreshControl()
    refreshControl.addTarget(
      self,
      action: #selector(refreshData),
      for: .valueChanged)
    messagesTableView.refreshControl = refreshControl
  }
  
  private func setupView() {
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(reloadState),
      name: UIApplication.didBecomeActiveNotification,
      object: nil)
  }
  
  private func render(state: MessagesViewState) {
    switch state {
    case .loading:
      let childVC = LoadingViewController()
      add(childVC)
    case .empty:
      let childVC = EmptyViewController()
      add(childVC)
    case .failed(let error):
      self.remove(type: LoadingViewController.self)
      self.remove(type: EmptyViewController.self)
      self.showAlert(with: "Alert", message: error, closeTitle: "Close")
    case .presenting(let newMessages):
      self.remove(type: LoadingViewController.self)
      self.remove(type: EmptyViewController.self)
      if self.messages == newMessages {
        return
      }
      self.messages = newMessages
      self.messagesTableView.reloadData()
    }
  }
  
  @objc
  private func refreshData() {
    controller.loadMessages { [weak self] state in
      self?.endRefresh()
      self?.render(state: state)
    }
  }
  
  private func endRefresh() {
    RunLoop.main.perform(inModes: [.default]) {
      self.refreshControl.endRefreshing()
    }
  }
  
  @objc
  private func reloadState() {
    render(state: .loading)
    controller.loadMessages { [weak self] state in
      self?.render(state: state)
    }
  }
}

// MARK: - UITableViewDataSource
extension MessagesViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return messages.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "MessageTableViewCell", for: indexPath) as? MessageTableViewCell else {
      fatalError("Can't get cell")
    }
    
    let model = messages[indexPath.row]
    cell.setup(with: model)
    return cell
  }
  
  
}

// MARK: - UITableViewDelegate
extension MessagesViewController: UITableViewDelegate {
}
