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
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            contactList.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedContact = contactList[indexPath.row]
        
        self.performSegue(withIdentifier: "ShowCurrentContactDetails", sender: indexPath.row)
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let segueId: String? = segue.identifier
        
        switch segueId {
        case VcId.details.rawValue:
            guard let currentContactVc = segue.destination as? CurrentContactViewController else {return}
            
            currentContactVc.currentContact = selectedContact
            
        case VcId.add.rawValue:
            guard let createContactTableView = segue.destination as? CreateContactTableViewController  else {return}
            
            createContactTableView.delegate = self
        default:
            return
        }
    }
}


extension ContactsTableViewController: AddNewContactDelegate {
    func addContact(newContact: Contact) {
        contactList.append(newContact)
    }
}



