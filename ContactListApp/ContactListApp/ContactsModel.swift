//
//  ContactsModel.swift
//  ContactListApp
//
//  Created by Flavius Bortas on 9/7/18.
//  Copyright © 2018 Flavius Bortas. All rights reserved.
//

import Foundation

class Contact {
    var name: String
    var phoneNumber: String
    var email: String
    
    init(name: String, phoneNumber: String, email: String) {
        self.name = name
        self.phoneNumber = phoneNumber
        self.email = email
    }
    
}

extension Contact {
    static var allContacts: [Contact] = [Contact(name: "Erika", phoneNumber: "(313) 618-8178", email: "erika@detroitlabs.com"),
                                  Contact(name: "Jen", phoneNumber: "(734) 664-3333", email: "jen.bloomer@detroitlabs.com"),
                                  Contact(name: "Leeann", phoneNumber: "(248) 709-1910", email: "leeann.drees@detroitlabs.com"),
                                  Contact(name: "Flavius", phoneNumber: "(586) 904-5400", email: "flavius.bortas@detroitlabs.com"),
                                  Contact(name: "Britney", phoneNumber: "(313) 633-3381", email: "britney.smith@detroitlabs.com"),
                                  Contact(name: "Kendall", phoneNumber: "(313) 377-4051", email: "kendall.poindexter@detroitlabs.com"),
                                  Contact(name: "Lauren", phoneNumber: "(201) 539-0552", email: "lauren.small@detroitlabs.com"),
                                  Contact(name: "Mitch", phoneNumber: "(810) 922-9416", email: "mitch.socia@dteroitlabs.com"),
                                  Contact(name: "Elle", phoneNumber: "(517) 862-7752", email: "elle.gover@detroitlabs.com"),
                                  Contact(name: "Jordan", phoneNumber: "(734) 945-2217", email: "jordan.jones@detroitlabs.com")]
}
