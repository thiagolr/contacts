//
//  Contact.m
//  Contacts
//
//  Created by ios4341 on 29/03/14.
//  Copyright (c) 2014 Venturus. All rights reserved.
//

#import "Contact.h"

@implementation Contact

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.photo = [aDecoder decodeObjectForKey:@"photo"];
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.telephone = [aDecoder decodeObjectForKey:@"telephone"];
        self.email = [aDecoder decodeObjectForKey:@"email"];
        self.address = [aDecoder decodeObjectForKey:@"address"];
        self.site = [aDecoder decodeObjectForKey:@"site"];
        self.latitude = [aDecoder decodeObjectForKey:@"latitude"];
        self.longitude = [aDecoder decodeObjectForKey:@"longitude"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder*)aCoder {
    [aCoder encodeObject:self.photo forKey:@"photo"];
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.telephone forKey:@"telephone"];
    [aCoder encodeObject:self.email forKey:@"email"];
    [aCoder encodeObject:self.address forKey:@"address"];
    [aCoder encodeObject:self.site forKey:@"site"];
    [aCoder encodeObject:self.latitude forKey:@"latitude"];
    [aCoder encodeObject:self.longitude forKey:@"longitude"];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ <%@>", self.name, self.email];
}

@end
