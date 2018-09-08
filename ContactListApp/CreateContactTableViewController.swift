//
//  CreateContactTableViewController.swift
//  ContactListApp
//
//  Created by Flavius Bortas on 9/8/18.
//  Copyright © 2018 Flavius Bortas. All rights reserved.
//

import UIKit

protocol AddNewContactDelegate: AnyObject {
    func addContact(newContact: Contact)
}

class CreateContactTableViewController: UITableViewController {
    
    //MARK: - UI Elements
    
    @IBOutlet weak var newContactNameTextField: UITextField!
    @IBOutlet weak var newContactPhoneTextField: UITextField!
    @IBOutlet weak var newContactEmailTextField: UITextField!
    
    //MARK: - Properties
    
    weak var delegate: AddNewContactDelegate?
    
    //MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newContactNameTextField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Actions
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func doneTapped(_ sender: UIBarButtonItem) {
        guard let  newContactNameText = newContactNameTextField.text, newContactNameText.isNotEmpty else {
            newContactNameTextField.becomeFirstResponder()
            return
        }
        
        guard let newContactPhoneText = newContactNameTextField.text, newContactPhoneText.isNotEmpty else {
            newContactPhoneTextField.becomeFirstResponder()
            return
        }
        
        guard let newContactEmailText = newContactEmailTextField.text, newContactEmailText.isNotEmpty else {
            newContactEmailTextField.becomeFirstResponder()
            return
        }
        
        let contact = Contact(name: newContactNameText, phoneNumber: newContactPhoneText, email: newContactEmailText)
        delegate?.addContact(newContact: contact)
        
        navigationController?.popViewController(animated: true)
    }
}

extension String {
    var isNotEmpty: Bool {
        return !self.isEmpty
    }
}
