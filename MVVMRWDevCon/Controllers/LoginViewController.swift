//
//  LoginViewController.swift
//  MVVMRWDevCon
//
//  Created by Admin on 20/11/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var codeLabel: UILabel!
    
    private let viewModel: UserViewModel = UserViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.accessCode.bind { [unowned self] in
            self.codeLabel.text = $0
        }
        
        viewModel.username.bind { [unowned self] in
            debugPrint("Username Changed: \($0)")
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == usernameField {
            textField.text = viewModel.username.value
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == usernameField {
            textField.text = viewModel.protectedUserName
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameField {
            passwordField.becomeFirstResponder()
        } else {
            
        }
        
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
       
        if textField == usernameField {
           viewModel.updateUserName(string)
        } else if textField == passwordField {
            viewModel.updatePassword(string)
        }
        
        return true
    }
}

