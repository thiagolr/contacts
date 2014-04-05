//
//  FormularioContatoViewController.h
//  Contacts
//
//  Created by ios4341 on 29/03/14.
//  Copyright (c) 2014 Venturus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contact.h"

@interface ContactFormViewController : UIViewController

- (id)initWithContact:(Contact*)contact;

- (IBAction)nextField:(UITextField*)currentField;

@property (weak, atomic) NSMutableArray *contacts;
@property (strong, atomic) Contact *contact;

@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *telephone;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *address;
@property (weak, nonatomic) IBOutlet UITextField *site;

@end
