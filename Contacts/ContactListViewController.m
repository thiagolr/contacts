//
//  ContactList.m
//  Contacts
//
//  Created by ios4341 on 29/03/14.
//  Copyright (c) 2014 Venturus. All rights reserved.
//

#import "ContactFormViewController.h"
#import "ContactListViewController.h"

@implementation ContactListViewController

- (id)init
{
    self = [super init];
    if (self) {
        UIBarButtonItem* btn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(showForm)];
                               
        self.navigationItem.title = @"Contacts";
        self.navigationItem.rightBarButtonItem = btn;
    }
    return self;
}

- (void)showForm {
    ContactFormViewController* form = [[ContactFormViewController alloc] init];
    [self.navigationController pushViewController:form animated:YES];
}

@end
