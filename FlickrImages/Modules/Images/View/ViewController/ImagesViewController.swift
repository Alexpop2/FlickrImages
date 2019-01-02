import UIKit

class ImagesViewController: UIViewController {
    private var presenter: ImagesPresenterInput!
    @IBOutlet weak var tableView: UITableView!
    
    private let kImageTableViewCellNib = UINib(nibName: "ImageTableViewCell", bundle: nil)
    private let kImageTableViewCellReuseIdentifier = "kImageTableViewCellNib"
    
    private var dataSource = [Image]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.interactorInput.getImages()
        setUpUI()
    }
}

extension ImagesViewController: ImagesViewInput {
    func updateImages(images: [Image]) {
        dataSource = images
        tableView.reloadData()
    }
    
    var presenterInput: ImagesPresenterInput {
        get {
            return presenter
        }
        set {
            presenter = newValue
        }
    }
}

// MARK: - Set Up UI

extension ImagesViewController {
    private func setUpUI() {
        tableView.register(kImageTableViewCellNib,
                           forCellReuseIdentifier: kImageTableViewCellReuseIdentifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 150
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 150;
    }
}

// MARK: - UITableViewDataSource Implementation

extension ImagesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =
            tableView.dequeueReusableCell(withIdentifier: kImageTableViewCellReuseIdentifier,
                                          for: indexPath) as? ImageTableViewCell else {
                                            return UITableViewCell()
        }
        cell.viewModel = dataSource[indexPath.row]
        return cell
    }
    
    
}

// MARK: - UITableViewDelegate Implementation

extension ImagesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //performSegue(withIdentifier: "goToChat", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
