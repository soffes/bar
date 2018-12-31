import UIKit

final class CocktailViewController: UIViewController {

	// MARK: - Properties

	let cocktail: Cocktail
    
	private let textView: UITextView = {
		let view = UITextView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.isEditable = false
        view.textContainerInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
		view.alwaysBounceVertical = true
		view.backgroundColor = .black
		return view
	}()


	// MARK: - Initializers

	required init(cocktail: Cocktail) {
		self.cocktail = cocktail
		super.init(nibName: nil, bundle: nil)

		title = cocktail.title
        
        if #available(iOS 11.0, *) {
            navigationItem.largeTitleDisplayMode = .never
        }
	}

	required init(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}


	// MARK: - UIViewController

	override func viewDidLoad() {
		super.viewDidLoad()

		view.backgroundColor = .black

		view.addSubview(textView)
        
        NSLayoutConstraint.activate([
            textView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            textView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
			guard let text = self?.cocktail.loadRecipe() else {
                return
            }
            
            DispatchQueue.main.async {
				let style = NSMutableParagraphStyle()
				style.lineHeightMultiple = 1.2

                self?.textView.attributedText = NSAttributedString(string: text, attributes: [
                    .paragraphStyle: style,
					.font: UIFont.systemFont(ofSize: 18, weight: .medium),
					.foregroundColor: UIColor.white
                ])
			}
		}
	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		textView.flashScrollIndicators()
	}
}
