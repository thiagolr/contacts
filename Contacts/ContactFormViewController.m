//
//  FormularioContatoViewController.m
//  Contacts
//
//  Created by ios4341 on 29/03/14.
//  Copyright (c) 2014 Venturus. All rights reserved.
//

#import "ContactFormViewController.h"

@interface ContactFormViewController ()

@end

@implementation ContactFormViewController

- (id)init
{
    self = [super init];
    if (self) {        
        UIBarButtonItem* btn1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(finish)];
        
        UIBarButtonItem* btn2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(createContact)];
        
        self.navigationItem.title = @"Add Contact";
        self.navigationItem.leftBarButtonItem = btn1;
        self.navigationItem.rightBarButtonItem = btn2;
    }
    return self;
}

- (id)initWithContact:(Contact*)contact
{
    self = [super init];
    if (self) {
        UIBarButtonItem* btn1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(finish)];
        
        UIBarButtonItem* btn2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(editContact)];
        
        self.navigationItem.title = @"Edit Contact";
        self.navigationItem.leftBarButtonItem = btn1;
        self.navigationItem.rightBarButtonItem = btn2;
        
        self.contact = contact;
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
    
    if (self.contact) {
        self.name.text = self.contact.name;
        self.telephone.text = self.contact.telephone;
        self.email.text = self.contact.email;
        self.address.text = self.contact.address;
        self.site.text = self.contact.site;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (Contact*)getContact {
    if (!self.contact) {
        self.contact = [[Contact alloc] init];
    }
    
    self.contact.name = self.name.text;
    self.contact.telephone = self.telephone.text;
    self.contact.email = self.email.text;
    self.contact.address = self.address.text;
    self.contact.site = self.site.text;
    
    return self.contact;
}

- (void)createContact {
    Contact* contact = [self getContact];
    
    [self.contacts addObject:contact];
    NSLog(@"contact added: %@", contact);
    
    [self.view endEditing:YES];
    [self finish];
}

- (void)editContact {
    self.contact = [self getContact];
    
    NSLog(@"contact edited: %@", self.contact);
    
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
