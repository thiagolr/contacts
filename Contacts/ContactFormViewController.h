//
//  ContactFormViewController.h
//  Contacts
//
//  Created by ios4341 on 29/03/14.
//  Copyright (c) 2014 Venturus. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ContactListViewController.h"
#import "ContactFormViewControllerDelegate.h"
#import "Contact.h"

@interface ContactFormViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

- (id)initWithContact:(Contact*)contact;

- (IBAction)nextField:(UITextField*)currentField;
- (IBAction)selectPhoto:(id)sender;

@property (weak, atomic) id<ContactFormViewControllerDelegate> delegate;
@property (strong, atomic) Contact* contact;

@property (weak, nonatomic) IBOutlet UIButton *photo;
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *telephone;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *address;
@property (weak, nonatomic) IBOutlet UITextField *site;
@property (weak, nonatomic) IBOutlet UITextField *latitude;
@property (weak, nonatomic) IBOutlet UITextField *longitude;

@end
