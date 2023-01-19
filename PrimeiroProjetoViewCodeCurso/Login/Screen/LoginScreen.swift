//
//  LoginScreen.swift
//  PrimeiroProjetoViewCodeCurso
//
//  Created by Jefferson Valverde on 03/01/23.
//

import UIKit

protocol LoginScreenProtocol: AnyObject {
    func tappedLoginButton()
}

class LoginScreen: UIView {
    
    private weak var delegate: LoginScreenProtocol?
    
    public func delegate(delegate: LoginScreenProtocol?) {
        self.delegate = delegate
        
    }
    
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.text = "Login"
        return label
    }()
    
    lazy var emailTexfield: UITextField = {
        let texf = UITextField()
        texf.translatesAutoresizingMaskIntoConstraints = false
        texf.autocorrectionType = .no
        texf.backgroundColor = .white
        texf.borderStyle = .roundedRect
        texf.keyboardType = .emailAddress
        texf.placeholder = "Digite seu email: "
        texf.textColor = .darkGray
        return texf
    }()
    
    lazy var passwordTexfield: UITextField = {
        let texf = UITextField()
        texf.translatesAutoresizingMaskIntoConstraints = false
        texf.autocorrectionType = .no
        texf.backgroundColor = .white
        texf.borderStyle = .roundedRect
        texf.keyboardType = .emailAddress
        texf.placeholder = "Digite sua senha: "
        texf.isSecureTextEntry = true
        texf.textColor = .darkGray
        return texf
    }()
    
    lazy var loginButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Logar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.isEnabled = false
        button.backgroundColor = .darkGray.withAlphaComponent(0.6)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedLoginButton(_ sender: UIButton) {
        print("Botao funcionando")
        delegate?.tappedLoginButton()
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemPink
        addElements()
        configConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(loginLabel)
        addSubview(emailTexfield)
        addSubview(passwordTexfield)
        addSubview(loginButton)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            loginLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            loginLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            emailTexfield.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 45),
            emailTexfield.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            emailTexfield.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            emailTexfield.heightAnchor.constraint(equalToConstant: 45),
            
            passwordTexfield.topAnchor.constraint(equalTo: emailTexfield.bottomAnchor, constant: 20),
            passwordTexfield.leadingAnchor.constraint(equalTo: emailTexfield.leadingAnchor),
            passwordTexfield.trailingAnchor.constraint(equalTo: emailTexfield.trailingAnchor),
            passwordTexfield.heightAnchor.constraint(equalTo: emailTexfield.heightAnchor),
            
            loginButton.topAnchor.constraint(equalTo: passwordTexfield.bottomAnchor, constant: 50),
            loginButton.leadingAnchor.constraint(equalTo: emailTexfield.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: emailTexfield.trailingAnchor),
            loginButton.heightAnchor.constraint(equalTo: emailTexfield.heightAnchor),
            
        ])
    }
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate) {
        emailTexfield.delegate = delegate
        passwordTexfield.delegate = delegate
    }
    
}
