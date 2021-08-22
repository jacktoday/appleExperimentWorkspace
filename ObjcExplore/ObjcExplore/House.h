//
//  House.h
//  ObjcExplore
//
//  Created by fulin on 21/8/21.
//

#import <Foundation/Foundation.h>
#import "Bedroom.h"

NS_ASSUME_NONNULL_BEGIN

@interface House : NSObject

//2006年Objective-C2.0
//strong, copy
//https://cloud.tencent.com/developer/article/1391111
@property (nonatomic, copy) NSString *address;
@property (nonatomic) int numberOfBedrooms;
@property (nonatomic) bool hasHotTub;

@property (nonatomic, weak) Bedroom *frontBedroom;
@property (nonatomic) Bedroom *backBedroom;


@end

NS_ASSUME_NONNULL_END
