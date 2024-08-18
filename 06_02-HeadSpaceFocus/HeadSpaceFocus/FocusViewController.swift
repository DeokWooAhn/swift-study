import UIKit

class FocusViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var button: UIButton!
    
    var curated: Bool = false
    
    var items: [Focus] = Focus.list

    typealias Item = Focus
    
    enum Section {
        case main
    }
    
    var datasource: UICollectionViewDiffableDataSource<Section, Item>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.layer.cornerRadius = 10

        datasource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FocusCell", for: indexPath) as? FocusCell else {
                return nil
            }
            cell.configure(item)
            return cell
        })
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(items, toSection: .main)
        datasource.apply(snapshot)
        
        collectionView.collectionViewLayout = layout()
        
        updateButtonTitle()
    }
    
    private func layout() -> UICollectionViewCompositionalLayout {
        
        let itmeSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
        
        let item = NSCollectionLayoutItem(layoutSize: itmeSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
        section.interGroupSpacing = 10
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    func updateButtonTitle() {
        let title = curated ? "See All" : "See Recommendation"
        button.setTitle(title, for: .normal)
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        curated.toggle()
        
        self.items = curated ? Focus.recommendations : Focus.list
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(items, toSection: .main)
        
        datasource.apply(snapshot)
    
        updateButtonTitle()
    }
}
