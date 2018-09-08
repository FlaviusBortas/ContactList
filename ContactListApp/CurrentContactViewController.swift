//
//  CurrentContactViewController.swift
//  ContactListApp
//
//  Created by Flavius Bortas on 9/7/18.
//  Copyright © 2018 Flavius Bortas. All rights reserved.
//

import UIKit

class CurrentContactViewController: UIViewController {
    
    //MARK: - UI Elements
    
    @IBOutlet weak var currentContactName: UITextField!
    @IBOutlet weak var currentContactPhone: UITextField!
    @IBOutlet weak var currentContactEmail: UITextField!
    
    //MARK: - Properties
    
    var currentContact: Contact?
    
    //MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentContactName.text = currentContact?.name
        currentContactPhone.text = currentContact?.phoneNumber
        currentContactEmail.text = currentContact?.email
        
        currentContactName.isEnabled = false
        currentContactPhone.isEnabled = false
        currentContactEmail.isEnabled = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Actions
    
    @IBAction func editTapped(_ sender: UIBarButtonItem) {
        
        if sender.title == "Edit" {
            sender.title = "Done"
            
            currentContactName.isEnabled = true
            currentContactPhone.isEnabled = true
            currentContactEmail.isEnabled = true
            
            currentContactName.becomeFirstResponder()
            
        } else {
            currentContact?.name = currentContactName.text ?? ""
            currentContact?.phoneNumber = currentContactPhone.text ?? ""
            currentContact?.email = currentContactEmail.text ?? ""
            
            navigationController?.popViewController(animated: true)
        }
    }
}
