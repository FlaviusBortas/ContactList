//
//  ContactsTableViewController.swift
//  ContactListApp
//
//  Created by Flavius Bortas on 9/7/18.
//  Copyright © 2018 Flavius Bortas. All rights reserved.
//

import UIKit

class ContactsTableViewController: UITableViewController {
    
    //MARK: - Properties
    
    var contactList = Contact.allContacts
    var selectedContact: Contact?
    
    //MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactItem", for: indexPath)
        cell.textLabel?.text = "\(contactList[indexPath.row].name)"

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedContact = contactList[indexPath.row]
      
        
        self.performSegue(withIdentifier: "ShowCurrentContactDetails", sender: indexPath.row)
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowCurrentContactDetails" {
            guard let currentContactVc = segue.destination as? CurrentContactViewController else {return}
            
            currentContactVc.currentContact = selectedContact
        }
    }
    
    
    
}
