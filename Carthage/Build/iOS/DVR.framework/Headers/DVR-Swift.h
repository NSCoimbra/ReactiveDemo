// Generated by Apple Swift version 2.0 (swiftlang-700.0.59 clang-700.0.72)
#pragma clang diagnostic push

#if defined(__has_include) && __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if defined(__has_include) && __has_include(<uchar.h>)
# include <uchar.h>
#elif !defined(__cplusplus) || __cplusplus < 201103L
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
#endif

typedef struct _NSZone NSZone;

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif

#if defined(__has_attribute) && __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if defined(__has_attribute) && __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if defined(__has_attribute) && __has_attribute(objc_subclassing_restricted) 
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if defined(__has_attribute) && __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name) enum _name : _type _name; enum SWIFT_ENUM_EXTRA _name : _type
#endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
#if defined(__has_feature) && __has_feature(modules)
@import Foundation;
@import Foundation.NSURLSession;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"

@interface NSHTTPURLResponse (SWIFT_EXTENSION(DVR))
@property (nonatomic, readonly, copy) NSDictionary<NSString *, id> * __nonnull dictionary;
@end


@interface NSMutableURLRequest (SWIFT_EXTENSION(DVR))
- (nonnull instancetype)initWithDictionary:(NSDictionary<NSString *, id> * __nonnull)dictionary;
@end


@interface NSURLRequest (SWIFT_EXTENSION(DVR))
@end


@interface NSURLRequest (SWIFT_EXTENSION(DVR))
@property (nonatomic, readonly, copy) NSDictionary<NSString *, id> * __nonnull dictionary;
@end


@interface NSURLResponse (SWIFT_EXTENSION(DVR))
@property (nonatomic, readonly, copy) NSDictionary<NSString *, id> * __nonnull dictionary;
@end

@class NSBundle;
@class NSURLSessionDataTask;
@class NSData;
@class NSError;
@class NSURLSessionDownloadTask;
@class NSURL;

SWIFT_CLASS("_TtC3DVR7Session")
@interface Session : NSURLSession
@property (nonatomic, copy) NSString * __nonnull outputDirectory;
@property (nonatomic, readonly, copy) NSString * __nonnull cassetteName;
@property (nonatomic, readonly) NSURLSession * __nonnull backingSession;
@property (nonatomic) BOOL recordingEnabled;
- (nonnull instancetype)initWithOutputDirectory:(NSString * __nonnull)outputDirectory cassetteName:(NSString * __nonnull)cassetteName testBundle:(NSBundle * __nonnull)testBundle backingSession:(NSURLSession * __nonnull)backingSession OBJC_DESIGNATED_INITIALIZER;
- (NSURLSessionDataTask * __nonnull)dataTaskWithRequest:(NSURLRequest * __nonnull)request;
- (NSURLSessionDataTask * __nonnull)dataTaskWithRequest:(NSURLRequest * __nonnull)request completionHandler:(void (^ __nonnull)(NSData * __nullable, NSURLResponse * __nullable, NSError * __nullable))completionHandler;
- (NSURLSessionDownloadTask * __nonnull)downloadTaskWithRequest:(NSURLRequest * __nonnull)request;
- (NSURLSessionDownloadTask * __nonnull)downloadTaskWithRequest:(NSURLRequest * __nonnull)request completionHandler:(void (^ __nonnull)(NSURL * __nullable, NSURLResponse * __nullable, NSError * __nullable))completionHandler;
- (void)invalidateAndCancel;
@end


SWIFT_CLASS("_TtC3DVR15SessionDataTask")
@interface SessionDataTask : NSURLSessionDataTask
@property (nonatomic, weak) Session * __null_unspecified session;
@property (nonatomic, readonly) NSURLRequest * __nonnull request;
@property (nonatomic, readonly, copy) void (^ __nullable completion)(NSData * __nullable, NSURLResponse * __nullable, NSError * __nullable);
- (nonnull instancetype)initWithSession:(Session * __nonnull)session request:(NSURLRequest * __nonnull)request completion:(void (^ __nullable)(NSData * __nullable, NSURLResponse * __nullable, NSError * __nullable))completion OBJC_DESIGNATED_INITIALIZER;
- (void)cancel;
- (void)resume;
@end


SWIFT_CLASS("_TtC3DVR19SessionDownloadTask")
@interface SessionDownloadTask : NSURLSessionDownloadTask
@property (nonatomic, weak) Session * __null_unspecified session;
@property (nonatomic, readonly) NSURLRequest * __nonnull request;
@property (nonatomic, readonly, copy) void (^ __nullable completion)(NSURL * __nullable, NSURLResponse * __nullable, NSError * __nullable);
- (nonnull instancetype)initWithSession:(Session * __nonnull)session request:(NSURLRequest * __nonnull)request completion:(void (^ __nullable)(NSURL * __nullable, NSURLResponse * __nullable, NSError * __nullable))completion OBJC_DESIGNATED_INITIALIZER;
- (void)cancel;
- (void)resume;
@end

@class NSObject;
@class NSCoder;

SWIFT_CLASS("_TtC3DVR15URLHTTPResponse")
@interface URLHTTPResponse : NSHTTPURLResponse
@property (nonatomic) NSURL * __nullable URL;
@property (nonatomic) NSInteger statusCode;
@property (nonatomic, copy) NSDictionary * __nonnull allHeaderFields;
- (nullable instancetype)initWithURL:(NSURL * __nonnull)url statusCode:(NSInteger)statusCode HTTPVersion:(NSString * __nullable)HTTPVersion headerFields:(NSDictionary<NSString *, NSString *> * __nullable)headerFields OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithURL:(NSURL * __nonnull)URL MIMEType:(NSString * __nullable)MIMEType expectedContentLength:(NSInteger)length textEncodingName:(NSString * __nullable)name OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


@interface URLHTTPResponse (SWIFT_EXTENSION(DVR))
- (nonnull instancetype)initWithDictionary:(NSDictionary<NSString *, id> * __nonnull)dictionary;
@end


SWIFT_CLASS("_TtC3DVR11URLResponse")
@interface URLResponse : NSURLResponse
@property (nonatomic) NSURL * __nullable URL;
- (nonnull instancetype)initWithURL:(NSURL * __nonnull)URL MIMEType:(NSString * __nullable)MIMEType expectedContentLength:(NSInteger)length textEncodingName:(NSString * __nullable)name OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


@interface URLResponse (SWIFT_EXTENSION(DVR))
- (nonnull instancetype)initWithDictionary:(NSDictionary<NSString *, id> * __nonnull)dictionary;
@end

#pragma clang diagnostic pop