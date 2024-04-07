import UIKit

class ViewController: UIViewController {
    
    let lockImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Lock Image")
        return image
    }()
    
    private let welcomeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        
        let welcomeLabel = UILabel()
        welcomeLabel.textColor = .label
        welcomeLabel.textAlignment = .left
        welcomeLabel.font = .systemFont(ofSize: 24, weight: .regular)
        welcomeLabel.text = "მოგესალმებით!"
        
        let descriptionLabel = UILabel()
        descriptionLabel.textColor = .label
        descriptionLabel.textAlignment = .left
        descriptionLabel.font = .systemFont(ofSize: 14, weight: .regular)
        descriptionLabel.text = "ამ აპლიკაციის გამოყენების საუკეთესო გზა თქვენს ანგარიშზე შესვლაა, თუ არ გაქვთ ანგარიში გააკეთეთ, თუ არ გსურთ გაკეთება დასტოვეთ აქაურობა და წაშალეთ აპლიკაცია."
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = UIColor(hex: "808080")
        
        stackView.addArrangedSubview(welcomeLabel)
        stackView.addArrangedSubview(descriptionLabel)

        
        return stackView
    }()
    
    private let authorizationStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        
        let authorizationLabel = UILabel()
        authorizationLabel.text = "ავტორიზაცია"
        authorizationLabel.textAlignment = .center
        authorizationLabel.font = .boldSystemFont(ofSize: 14)
        
        let separatorView = UIView()
        separatorView.backgroundColor = UIColor(hex: "33A5E5")
        separatorView.translatesAutoresizingMaskIntoConstraints = false

        stackView.addArrangedSubview(authorizationLabel)
        stackView.addArrangedSubview(separatorView)
        
        separatorView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        separatorView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 4.5).isActive = true
        return stackView
    }()
    
    private let nameStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        
        let nameLabel = UILabel()
        nameLabel.text = "სრული სახელი"
        nameLabel.textAlignment = .left
        nameLabel.font = .systemFont(ofSize: 12)
        
        let nameTextField = UITextField()
        nameTextField.borderStyle = .roundedRect
        nameTextField.placeholder = "მაგ: ქეთინო ფერი"
        nameTextField.attributedPlaceholder = NSAttributedString(
            string: nameTextField.placeholder ?? "",
            attributes: [
                .font: UIFont.systemFont(ofSize: 12)
            ]
        )
        
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(nameTextField)
        
        nameLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        
        return stackView
    }()

    private let mailStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        
        let mailLabel = UILabel()
        mailLabel.text = "ელ. ფოსტა"
        mailLabel.textAlignment = .left
        mailLabel.font = .systemFont(ofSize: 12)
        
        let mailTextField = UITextField()
        mailTextField.borderStyle = .roundedRect
        mailTextField.placeholder = "მაგ: kusuna@mail.ru"
        mailTextField.attributedPlaceholder = NSAttributedString(
            string: mailTextField.placeholder ?? "",
            attributes: [
                .font: UIFont.systemFont(ofSize: 12)
            ]
        )
        
        stackView.addArrangedSubview(mailLabel)
        stackView.addArrangedSubview(mailTextField)
        
        return stackView
    }()
    
    private let passwordStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        
        let passwordLabel = UILabel()
        passwordLabel.text = "პაროლი"
        passwordLabel.textAlignment = .left
        passwordLabel.font = .systemFont(ofSize: 12)

        
        let passwordTextField = UITextField()
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.placeholder = "მაგ: busuna123, jajanaIsMyKumiri2010"
        passwordTextField.attributedPlaceholder = NSAttributedString(
            string: passwordTextField.placeholder ?? "",
            attributes: [
                .font: UIFont.systemFont(ofSize: 12)
            ]
        )

        
        stackView.addArrangedSubview(passwordLabel)
        stackView.addArrangedSubview(passwordTextField)
        
        return stackView
    }()
    
    private lazy var loginMergedStackView: UIStackView = {
        // Lazy-ს გარეშე რატო არ მუშაობს ვერ ამიხსნით feedback-ში მოკლედ? ლოგიკურად ვერ მივყვები მგონია
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8

        stackView.addArrangedSubview(nameStackView)
        stackView.addArrangedSubview(mailStackView)
        stackView.addArrangedSubview(passwordStackView)
        return stackView
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor(hex: "33A5E5")
        button.tintColor = UIColor(hex: "FEFEFE")
        button.setTitle("შესვლა", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        
        return button
    }()
    
    private let separatorOrStackView: UIStackView = {
        //Can't do it meewn :(
        let stackView = UIStackView()
        stackView.axis = .horizontal
        
        stackView.distribution = .equalCentering
        stackView.alignment = .center

        let leftSeparatorView = UIView()
        leftSeparatorView.backgroundColor = UIColor(hex: "D9D9D9")
        leftSeparatorView.translatesAutoresizingMaskIntoConstraints = false
        
        let separatorLabel = UILabel()
        separatorLabel.text = "ან"
        separatorLabel.font = .systemFont(ofSize: 14)
        separatorLabel.textColor = UIColor(hex: "4C4E55")
        
        let rightSeparatorView = UIView()
        rightSeparatorView.backgroundColor = UIColor(hex: "D9D9D9")
        rightSeparatorView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(leftSeparatorView)
        stackView.addArrangedSubview(separatorLabel)
        stackView.addArrangedSubview(rightSeparatorView)
        
        //ვცდილობ რომ არ გამოვიყენო სტაკში ქონსთრეინთები მარა არ გამომდის სხვანაირად
        leftSeparatorView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        leftSeparatorView.trailingAnchor.constraint(equalTo: separatorLabel.leadingAnchor, constant: -11).isActive = true
        
        rightSeparatorView.leadingAnchor.constraint(equalTo: separatorLabel.trailingAnchor, constant: 11).isActive = true
        rightSeparatorView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        return stackView
    }()
    
    private var loginChoices: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        
        let title = NSMutableAttributedString()
        
        let googleButton = UIButton()
        googleButton.layer.cornerRadius = 10
        googleButton.backgroundColor = UIColor(hex: "F0F0F0")
        var googleTitle = NSMutableAttributedString()
        let googleSymbolAttachment = NSTextAttachment()
        googleSymbolAttachment.image = UIImage(systemName: "g.circle.fill")
        let googleSymbolString = NSAttributedString(attachment: googleSymbolAttachment)
        googleTitle.append(googleSymbolString)
        let googleButtonText = NSAttributedString(string: " გამოიყენეთ გუგლი", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)])
        googleTitle.append(googleButtonText)
        googleButton.setAttributedTitle(googleTitle, for: .normal)


        let facebookButton = UIButton()
        facebookButton.layer.cornerRadius = 10
        facebookButton.backgroundColor = UIColor(hex: "F0F0F0")
        var facebookTitle = NSMutableAttributedString()
        let facebookSymbolAttachment = NSTextAttachment()
        facebookSymbolAttachment.image = UIImage(systemName: "f.circle.fill")
        let facebookSymbolString = NSAttributedString(attachment: facebookSymbolAttachment)
        facebookTitle.append(facebookSymbolString)
        let facebookButtonText = NSAttributedString(string: " გამოიყენეთ ფეიზბურგი", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)])
        facebookTitle.append(facebookButtonText)
        facebookButton.setAttributedTitle(facebookTitle, for: .normal)
        
        stackView.addArrangedSubview(googleButton)
        stackView.addArrangedSubview(facebookButton)
        
        facebookButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        googleButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        return stackView
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(lockImageView)
        view.addSubview(welcomeStackView)
        view.addSubview(authorizationStackView)
        view.addSubview(loginMergedStackView)
        view.addSubview(loginButton)
        view.addSubview(separatorOrStackView)
        view.addSubview(loginChoices)
        setupUI()
    }
    
    // MARK: - Constraints
    private func setupUI() {
        
        self.lockImageView.translatesAutoresizingMaskIntoConstraints = false
        self.welcomeStackView.translatesAutoresizingMaskIntoConstraints = false
        self.authorizationStackView.translatesAutoresizingMaskIntoConstraints = false
        self.nameStackView.translatesAutoresizingMaskIntoConstraints = false
        self.loginMergedStackView.translatesAutoresizingMaskIntoConstraints = false
        self.loginButton.translatesAutoresizingMaskIntoConstraints = false
        self.separatorOrStackView.translatesAutoresizingMaskIntoConstraints = false
        self.loginChoices.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            lockImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            lockImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lockImageView.widthAnchor.constraint(equalToConstant: 90),
            lockImageView.heightAnchor.constraint(equalToConstant: 50),
            
            welcomeStackView.topAnchor.constraint(equalTo: lockImageView.bottomAnchor, constant: 30),
            welcomeStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            welcomeStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            authorizationStackView.topAnchor.constraint(equalTo: welcomeStackView.bottomAnchor, constant: 20),
            authorizationStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            authorizationStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            loginMergedStackView.topAnchor.constraint(equalTo: authorizationStackView.bottomAnchor, constant: 20),
            loginMergedStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginMergedStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            loginButton.topAnchor.constraint(equalTo: loginMergedStackView.bottomAnchor, constant: 16),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            loginButton.heightAnchor.constraint(equalToConstant: 46),
            
            separatorOrStackView.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 24),
            separatorOrStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            separatorOrStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            loginChoices.topAnchor.constraint(equalTo: separatorOrStackView.bottomAnchor, constant: 24),
            loginChoices.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginChoices.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}

#Preview() {
    ViewController()
}

// MARK: - Setup Hex color coding
extension UIColor {
    convenience init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
