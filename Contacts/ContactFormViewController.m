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
        UIBarButtonItem* btn1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(finish)];
        
        UIBarButtonItem* btn2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(createContact)];
        
        self.navigationItem.title = @"Edit Contact";
        self.navigationItem.leftBarButtonItem = btn1;
        self.navigationItem.rightBarButtonItem = btn2;
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

- (Contact*)getContact {
    Contact* contact = [[Contact alloc] init];
    contact.name = self.name.text;
    contact.telephone = self.telephone.text;
    contact.email = self.email.text;
    contact.address = self.address.text;
    contact.site = self.site.text;
    
    return contact;
}

- (void)createContact {
    Contact* contact = [self getContact];
    
    [self.contacts addObject:contact];
    NSLog(@"contact added: %@", contact);
    
    [self.view endEditing:YES];
    [self finish];
}

- (IBAction)nextField:(UITextField *)currentField {
    [[self.view viewWithTag:(currentField.tag + 1)] becomeFirstResponder];
}

- (void)finish {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
