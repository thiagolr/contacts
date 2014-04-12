//
//  ContactsMapViewController.h
//  Contacts
//
//  Created by ios4341 on 12/04/14.
//  Copyright (c) 2014 Venturus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Contact.h"

@interface ContactsMapViewController : UIViewController

@property (weak, atomic) NSMutableArray *contacts;

@property (weak, nonatomic) IBOutlet MKMapView *map;

@end
