//
//  ContactsMapViewController.m
//  Contacts
//
//  Created by ios4341 on 12/04/14.
//  Copyright (c) 2014 Venturus. All rights reserved.
//

#import "ContactsMapViewController.h"

@interface ContactsMapViewController ()

@end

@implementation ContactsMapViewController

- (id)init
{
    self = [super init];
    if (self) {
        self.navigationItem.title = @"Map";
        
        UIImage* tabImage = [UIImage imageNamed:@"contacts-map"];
        UITabBarItem* tabItem = [[UITabBarItem alloc] initWithTitle:@"Map" image:tabImage tag:0];
        self.tabBarItem = tabItem;        
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
    
    MKUserTrackingBarButtonItem* btn = [[MKUserTrackingBarButtonItem alloc] initWithMapView:self.map];
    self.navigationItem.rightBarButtonItem = btn;
    
    self.map.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.map addAnnotations:self.contacts];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.map removeAnnotations:self.contacts];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (MKAnnotationView*)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    static NSString* pool = @"pool";
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    }

    MKPinAnnotationView* pin = (MKPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:pool];
    if (!pin) {
        pin = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pool];
    }
    else {
        pin.annotation = annotation;
    }
    pin.pinColor = MKPinAnnotationColorRed;
    pin.canShowCallout = YES;
    
    Contact* contact = (Contact*) annotation;
    if (contact.photo) {
        UIImageView* photo = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
        photo.image = contact.photo;
        pin.leftCalloutAccessoryView = photo;
    }
    
    return pin;
}

@end
