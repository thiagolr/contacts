//
//  ContactFormViewController.m
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
        if (self.contact.photo) {
            [self.photo setBackgroundImage:self.contact.photo forState:UIControlStateNormal];
            self.photo.titleLabel.text = nil;
        }
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
    
    if (self.photo.imageView.image) {
        self.contact.photo = self.photo.imageView.image;
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
    
    [self.delegate addContact:contact];
    
    [self.view endEditing:YES];
    [self finish];
}

- (void)editContact {
    self.contact = [self getContact];
    
    if ([self.delegate respondsToSelector:@selector(editContact:)]) {
        [self.delegate editContact:self.contact];
    }
    
    [self.view endEditing:YES];
    [self finish];
}

- (IBAction)nextField:(UITextField *)currentField {
    [[self.view viewWithTag:(currentField.tag + 1)] becomeFirstResponder];
}

- (IBAction)selectPhoto:(id)sender {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
    }
    else {
        UIImagePickerController* picker = [[UIImagePickerController alloc] init];
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        picker.allowsEditing = YES;
        picker.delegate = self;
        [self presentViewController:picker animated:YES completion:nil];
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage* image = info[UIImagePickerControllerEditedImage];
    self.photo.titleLabel.text = nil;
    [self.photo setImage:image forState:UIControlStateNormal];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)finish {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
