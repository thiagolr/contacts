//
//  ContactList.m
//  Contacts
//
//  Created by ios4341 on 29/03/14.
//  Copyright (c) 2014 Venturus. All rights reserved.
//

#import "ContactFormViewController.h"
#import "ContactListViewController.h"
#import "Contact.h"

@implementation ContactListViewController

- (id)init
{
    self = [super init];
    if (self) {
        UIBarButtonItem* btnRight = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(showForm)];
        
        self.navigationItem.title = @"Contacts";
        self.navigationItem.rightBarButtonItem = btnRight;
        self.navigationItem.leftBarButtonItem = self.editButtonItem;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILongPressGestureRecognizer* lp =[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(showMenu:)];
    [self.tableView addGestureRecognizer:lp];
}

- (void)viewDidAppear:(BOOL)animated {
    if (self.selected) {
        [self.tableView selectRowAtIndexPath:self.selected animated:animated scrollPosition:UITableViewScrollPositionMiddle];
    }
    self.selected = nil;
}

- (void)addContact:(Contact *)contact {
    [self.contacts addObject:contact];
    self.selected = [NSIndexPath indexPathForRow:[self.contacts indexOfObject:contact] inSection:0];
}

- (void)editContact:(Contact *)contact {
    self.selected = [NSIndexPath indexPathForRow:[self.contacts indexOfObject:contact] inSection:0];
}

- (void)showMenu:(UIGestureRecognizer*)gesture {
    if (gesture.state == UIGestureRecognizerStateBegan) {
        CGPoint point = [gesture locationInView:self.tableView];
        NSIndexPath* ip = [self.tableView indexPathForRowAtPoint:point];
        selectedContact = self.contacts[ip.row];
        UIActionSheet* menu = [[UIActionSheet alloc] initWithTitle:selectedContact.name delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Call", @"Send e-mail", @"Show map", @"Go to site", nil];
        
        [menu showInView:self.view];
    }
}

- (void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 0:
            // [self call];
            NSLog(@"call: %@", selectedContact.telephone);
            break;
        case 1:
            // [self sendEmail];
            NSLog(@"send e-mail to: %@", selectedContact.email);
            break;
        case 2:
            // [self showMap];
            NSLog(@"show map: %@", selectedContact.address);
            break;
        case 3:
            // [self goToSite];
            NSLog(@"go to site: %@", selectedContact.site);
            break;
    }
}

- (void)showForm {
    ContactFormViewController* form = [[ContactFormViewController alloc] init];
    form.delegate = self;
    
    [self.navigationController pushViewController:form animated:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Contact* contact = self.contacts[indexPath.row];
    ContactFormViewController* form = [[ContactFormViewController alloc] initWithContact:contact];
    form.delegate = self;
    
    [self.navigationController pushViewController:form animated:YES];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.contacts removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    Contact* contact = [self.contacts objectAtIndex:sourceIndexPath.row];
    [self.contacts removeObjectAtIndex:sourceIndexPath.row];
    [self.contacts insertObject:contact atIndex:destinationIndexPath.row];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
    NSLog(@"contacts: %@", self.contacts);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.contacts count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* pool = @"contact";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:pool];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:pool];
    }
    
    Contact* c = [self.contacts objectAtIndex:indexPath.row];
    cell.textLabel.text = c.name;
    
    return cell;
}

@end
