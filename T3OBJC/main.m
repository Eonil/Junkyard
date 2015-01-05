//
//  main.m
//  T3OBJC
//
//  Created by Hoon H. on 2015/01/05.
//
//

#import <Foundation/Foundation.h>

@interface	Test1: NSObject
@end
@implementation Test1
{
@public
	NSString*	value;
}
- (instancetype)init:(NSString*)value1 {
	if (self = [super init]) {
		self->value	=	value1;
	}
	return	self;
}
@end



int main(int argc, const char * argv[]) {
	NSUInteger const	N	=	1024 * 1024 * 4;
	@autoreleasepool {
		NSArray*	a	=	@[
							  [[Test1 alloc] init:@"A"],
							  [[Test1 alloc] init:@"B"],
							  [[Test1 alloc] init:@"C"],
							  [[Test1 alloc] init:@"D"],
							  ];
		
		NSMutableString*	s	=	[[NSMutableString alloc] initWithCapacity:N * sizeof(unichar)];
		for (NSUInteger i=0; i<N; i++) {
			for (__unsafe_unretained Test1* t in a) {
				[s appendString:t->value];
			}
		}
		
		NSLog(@"utf16 length: %@", @([s length]));
		NSLog(@"%@", [s substringFromIndex:[s length]-1]);
	}
    return 0;
}


//int main(int argc, const char * argv[]) {
//	NSUInteger const	N	=	1024 * 1024 * 4;
//	@autoreleasepool {
//		NSArray*	a	=	@[
//							  [[Test1 alloc] init:@"A"],
//							  [[Test1 alloc] init:@"B"],
//							  [[Test1 alloc] init:@"C"],
//							  [[Test1 alloc] init:@"D"],
//							  ];
//		
//		NSMutableString*	s	=	[[NSMutableString alloc] initWithCapacity:N * sizeof(unichar)];
//		for (NSUInteger i=0; i<N; i++) {
//			for (Test1* t in a) {
//				NSString* const	ch1	=	t->value;
//				[s appendString:ch1];
//			}
//		}
//		
//		NSLog(@"utf16 length: %@", @([s length]));
//		NSLog(@"%@", [s substringFromIndex:[s length]-1]);
//	}
//	return 0;
//}
