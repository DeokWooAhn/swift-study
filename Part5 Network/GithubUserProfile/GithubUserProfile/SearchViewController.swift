import UIKit
import Combine
import Kingfisher

class UserProfileViewController: UIViewController {
    
    let network = NetworkService(configuration: .default)
    
    @Published private(set) var user: UserProfile?
    var subcriptions = Set<AnyCancellable>()
    
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var followerLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        embedSearchControl()
        bind()
    }
    
    private func setupUI() {
        thumbnail.layer.cornerRadius = 80
    }
    
    private func embedSearchControl() {
        self.navigationItem.title = "Search"
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "DeokWooAhn"
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        self.navigationItem.searchController = searchController
    }
    
    private func bind() {
        $user
            .receive(on: RunLoop.main)
            .sink { [unowned self] result in
                self.update(result)
            }.store(in: &subcriptions)
    }
    
    private func update(_ user: UserProfile?) {
        guard let user = user else {
            self.nameLabel.text = "n/a"
            self.loginLabel.text = "n/a"
            self.followerLabel.text = ""
            self.followingLabel.text = ""
            self.thumbnail.image = nil
            return
        }
        
        self.nameLabel.text = user.name
        self.loginLabel.text = user.login
        self.followerLabel.text = "follower: \(user.followers)"
        self.followingLabel.text = "following: \(user.following)"
        
        self.thumbnail.kf.setImage(with: user.avatarUrl)
    }
}

extension UserProfileViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let keyword = searchController.searchBar.text
    }
}

extension UserProfileViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let keyword = searchBar.text, !keyword.isEmpty else { return }
        
        //Resource
        //        let base = "http://api.github.com/"
        //        let path = "users/\(keyword)"
        //        let params: [String: String] = [:]
        //        let header: [String: String] = ["Content-Type": "application/json"]
        //
        //        var urlComponents = URLComponents(string: base + path)!
        //        let queryItems = params.map { (key: String, value: String) in
        //            return URLQueryItem(name: key, value: value)
        //        }
        //        urlComponents.queryItems = queryItems
        //
        //        var request = URLRequest(url: urlComponents.url!)
        //        header.forEach { (key: String, value: String) in
        //            request.addValue(value, forHTTPHeaderField: key)
        //        }
        
        let resource = Resource<UserProfile>(
            base: "http://api.github.com/",
            path: "users/\(keyword)",
            params: [:],
            header: ["Content-Type": "application/json"]
        )
        
        //Network Service
        network.load(resource)
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    self.user = nil
                case .finished: break
                }
            } receiveValue: { user in
                self.user = user
            }.store(in: &subcriptions)
        
        //        URLSession.shared
        //            .dataTaskPublisher(for: request)
        //            .tryMap { result -> Data in
        //                guard let response = result.response as? HTTPURLResponse,
        //                      (200..<300).contains(response.statusCode) else {
        //                    let response = result.response as? HTTPURLResponse
        //                    let statusCode = response?.statusCode ?? -1
        //                    throw NetworkError.responseError(statusCode: statusCode)
        //                }
        //                return result.data
        //            }
        //            .decode(type: UserProfile.self, decoder: JSONDecoder())
        //            .receive(on: RunLoop.main)
        //            .sink { completion in
        //                print("completion: \(completion)")
        //
        //                switch completion {
        //                case .failure(let error):
        //                    self.user = nil
        //                case .finished: break
        //                }
        //            } receiveValue: { user in
        //                self.user = user
        //            }.store(in: &subcriptions)
    }
}
