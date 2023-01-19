//
//  ViewController.swift
//  PrimeiroProjetoViewCodeCurso
//
//  Created by Jefferson Valverde on 02/01/23.
//

import UIKit

class LoginVC: UIViewController {
    
    var loginScreen:LoginScreen?
    
    override func loadView() {
        loginScreen = LoginScreen()
        view = loginScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loginScreen?.delegate(delegate: self)
        loginScreen?.configTextFieldDelegate(delegate: self)
    }


}
extension LoginVC: LoginScreenProtocol {
    func tappedLoginButton() {
        print("Chegou na vc")
        let vc: HomeVC = HomeVC()
//        present(vc, animated: true)
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension LoginVC: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
        
        let email:String = loginScreen?.emailTexfield.text ?? ""
        let passwordTexfield: String = loginScreen?.passwordTexfield.text ?? ""
        
        if !email.isEmpty && !passwordTexfield.isEmpty {
            print("botao habilitado")
            loginScreen?.loginButton.isEnabled = true
            loginScreen?.loginButton.backgroundColor = .darkGray
            
        } else {
            print("Botao desabilitado")
            loginScreen?.loginButton.isEnabled = false
            loginScreen?.loginButton.backgroundColor = .darkGray.withAlphaComponent(0.6)
        }
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        textField.resignFirstResponder()
        return false
    }
    
}

