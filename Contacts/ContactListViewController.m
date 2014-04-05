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
