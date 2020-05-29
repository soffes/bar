import UIKit
import Static

class MenuViewController: TableViewController {

	// MARK: - Initializers

	convenience init() {
		self.init(style: .grouped)
	}

	// MARK: - UIViewController

	override func viewDidLoad() {
		super.viewDidLoad()

		title = "Menu"

		tableView.estimatedRowHeight = 100
		tableView.backgroundColor = .black
		tableView.separatorColor = UIColor(white: 0.2, alpha: 1)
        tableView.indicatorStyle = .white

        dataSource.sections = MenuGroup.all.map { group in
            let rows = group.cocktails.map { [weak self] cocktail in
                Row(text: cocktail.title, detailText: cocktail.subtitle, selection: {
                    self?.didSelectCocktail(cocktail)
                }, accessory: .disclosureIndicator, cellClass: CocktailCell.self)
            }
            return Section(header: .title(group.title), rows: rows)
        }
	}

	private func didSelectCocktail(_ cocktail: Cocktail) {
		let viewController = CocktailViewController(cocktail: cocktail)
		navigationController?.pushViewController(viewController, animated: true)
	}
}
