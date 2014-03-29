//
//  FormularioContatoViewController.m
//  Contacts
//
//  Created by ios4341 on 29/03/14.
//  Copyright (c) 2014 Venturus. All rights reserved.
//

#import "ContactFormViewController.h"
#import "Contact.h"

@interface ContactFormViewController ()

@end

@implementation ContactFormViewController

- (id)init
{
    self = [super init];
    if (self) {
        self.contacts = [[NSMutableArray alloc] init];
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getFormData:(id)sender {
    
    Contact* contact = [[Contact alloc] init];
    contact.name = self.name.text;
    contact.telephone = self.telephone.text;
    contact.email = self.email.text;
    contact.address = self.address.text;
    contact.site = self.site.text;
    
    [self.contacts addObject:contact];
    
    [self.view endEditing:YES];
    
    NSLog(@"contact added: %@", contact);
    NSLog(@"contacts: %@", self.contacts);
}

- (IBAction)nextField:(UITextField *)currentField {
    [[self.view viewWithTag:(currentField.tag + 1)] becomeFirstResponder];
}

@end
