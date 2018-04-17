# Aliyun OSS Emulator

## 关于
- *oss-emulator* 轻量级的OSS服务模拟器，提供与OSS服务相同的API接口。

## 使用场景
- 基于OSS应用的调试，甚至无网络环境下也可以调试基于OSS的应用；
- 基于OSS应用的性能测试，节省大量费用；

## 支持接口

- *oss-emulator* 支持 `put, get, list, copy, delete, multipart` 等数据操作API接口，支持部分Bucket操作接口。

### Bucket相关接口
- 支持
```
ListBuckets(GetService),PutBucket(CreateBucket),GetBucket,DeleteBucket,
GetBucketLocation,GetBucketInfo,PutBucketACL,GetBucketACL
```

- 不支持
```
PutBucketLogging,PutBucketWebsite,PutBucketReferer,PutBucketLifecycle,
GetBucketLogging,GetBucketWebsite,GetBucketReferer,GetBucketLifecycle,
DeleteBucketLogging,DeleteBucketWebsite,DeleteBucketLifecycle
```

### Object相关接口
- 支持
```
PutObject,CopyObject,AppendObject,GetObject,DeleteObject,DeleteMultipleObjects,
HeadObject,GetObjectMeta,PutObjectACL,GetObjectACL
```

- 不支持
```
PostObject,Callback,PutSymlink,GetSymlink,RestoreObject
```

### Multipart相关接口
- 支持
```
InitiateMultipartUpload,UploadPart,CompleteMultipartUpload
```

- 不支持
```
UploadPartCopy,AbortMultipartUpload,ListMultipartUpload,ListParts
```

## 运行

```
docker run -d -p 8080:8080 szewec/oss-emulator
```

指定文件保存路径
```
docker run -d -p 8080:8080 -v <your_store_path>:/root/oss-emulator/store szewec/oss-emulator
```

## 使用示例

### ossutil

- 方法一：直接在命令行中携带参数, 其中endpoint设置为oss-emulator的IP; AccessKeyId和AccessKeySecret如下, 也可以不填。 如：
```
    ossutil -e http://192.168.0.1:8080 -i  AccessKeyId -k AccessKeySecret ls oss://bucket
```

- 方法二：使用 `ossutil config` 命令配置参数，参数配置和 **方法一** 相同：
```
    ossutil config
```

> **提示：**
- ossutil文档请参考[官网](https://help.aliyun.com/document_detail/50452.html)
  
### Python SDK

- *Python SDK* 连接 oss-emulator 代码的如下, 其中endpoint设置为 oss-emulator 的IP, AccessKeyId和AccessKeySecret如下, 也可以不填。

```
    import oss2

    auth = oss2.Auth('AccessKeySecret', 'AccessKeySecret')
    bucket = oss2.Bucket(auth, 'http//:192.168.0.1:8080', 'MyBucketName')
    bucket.create_bucket()
```

> **提示：**
- Python SDK的说明文档请参考[官网](https://help.aliyun.com/document_detail/32026.html?spm=5176.doc32026.3.3.RQzyY1)
