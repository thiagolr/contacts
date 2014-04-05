//
//  ContactList.h
//  Contacts
//
//  Created by ios4341 on 29/03/14.
//  Copyright (c) 2014 Venturus. All rights reserved.
//

#import <Foundation/Foundation.h>


#import "ContactFormViewControllerDelegate.h"
#import "Contact.h"

@interface ContactListViewController : UITableViewController <ContactFormViewControllerDelegate, UIActionSheetDelegate> {

    Contact* selectedContact;
    
}

@property (weak, atomic) NSMutableArray *contacts;

@property (strong, atomic) NSIndexPath* selected;

- (void) addContact:(Contact*)contact;

@end
