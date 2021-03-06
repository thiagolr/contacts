//
//  Contact.h
//  Contacts
//
//  Created by ios4341 on 29/03/14.
//  Copyright (c) 2014 Venturus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Contact : NSManagedObject <NSCoding, MKAnnotation>

@property (strong, atomic) UIImage* photo;
@property (strong, atomic) NSString* name;
@property (strong, atomic) NSString* telephone;
@property (strong, atomic) NSString* email;
@property (strong, atomic) NSString* address;
@property (strong, atomic) NSString* site;
@property (strong, atomic) NSNumber* latitude;
@property (strong, atomic) NSNumber* longitude;

@end
