//
//  ContactFormViewControllerDelegate.h
//  Contacts
//
//  Created by ios4341 on 05/04/14.
//  Copyright (c) 2014 Venturus. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Contact.h"

@protocol ContactFormViewControllerDelegate <NSObject>

@required
- (void)addContact:(Contact*)contact;

@optional
- (void)editContact:(Contact*)contact;

@end
