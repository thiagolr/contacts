//
//  FormularioContatoViewController.m
//  Contacts
//
//  Created by ios4341 on 29/03/14.
//  Copyright (c) 2014 Venturus. All rights reserved.
//

#import "FormularioContatoViewController.h"
#import "Contact.h"

@interface FormularioContatoViewController ()

@end

@implementation FormularioContatoViewController

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
    NSMutableDictionary* contact = [[NSMutableDictionary alloc] init];
    [contact setObject:self.name.text forKey:@"name"];
    [contact setObject:self.telephone.text forKey:@"telephone"];
    [contact setObject:self.email.text forKey:@"email"];
    [contact setObject:self.address.text forKey:@"address"];
    [contact setObject:self.site.text forKey:@"site"];
    
    NSLog(@"contact added: %@", contact);
}

@end
