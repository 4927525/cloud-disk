package test

import (
	"bytes"
	"cloud-disk/core/define"
	"context"
	"fmt"
	"github.com/tencentyun/cos-go-sdk-v5"
	"net/http"
	"net/url"
	"os"
	"testing"
)

func TestFileUploadByFilepath(t *testing.T) {
	println(define.TencentSecretID, 1111111)
	// 存储桶名称，由bucketname-appid 组成，appid必须填入，可以在COS控制台查看存储桶名称。 https://console.cloud.tencent.com/cos5/bucket
	// 替换为用户的 region，存储桶region可以在COS控制台“存储桶概览”查看 https://console.cloud.tencent.com/ ，关于地域的详情见 https://cloud.tencent.com/document/product/436/6224 。
	u, _ := url.Parse("https://1-1257428686.cos.ap-nanjing.myqcloud.com")
	b := &cos.BaseURL{BucketURL: u}
	client := cos.NewClient(b, &http.Client{
		Transport: &cos.AuthorizationTransport{
			SecretID:  "xxx",
			SecretKey: "xxx",
		},
	})

	key := "cloud-disk/exampleobject.jpg"

	_, _, err := client.Object.Upload(
		context.Background(), key, "./img/1ff6a037-409d-445a-86cc-6dbca2b29c87.jpeg", nil,
	)
	if err != nil {
		t.Fatal(err)
	}
}

func TestFileUploadByReader(t *testing.T) {
	u, _ := url.Parse(define.CosBucket)
	b := &cos.BaseURL{BucketURL: u}
	client := cos.NewClient(b, &http.Client{
		Transport: &cos.AuthorizationTransport{
			// 通过环境变量获取密钥
			// 环境变量 SECRETID 表示用户的 SecretId，登录访问管理控制台查看密钥，https://console.cloud.tencent.com/cam/capi
			SecretID: define.TencentSecretID,
			// 环境变量 SECRETKEY 表示用户的 SecretKey，登录访问管理控制台查看密钥，https://console.cloud.tencent.com/cam/capi
			SecretKey: define.TencentSecretKey,
		},
	})

	key := "cloud-disk/exampleobject2.jpg"

	f, err := os.ReadFile("./img/1ff6a037-409d-445a-86cc-6dbca2b29c87.jpeg")
	if err != nil {
		return
	}
	_, err = client.Object.Put(
		context.Background(), key, bytes.NewReader(f), nil,
	)
	if err != nil {
		panic(err)
	}
}

// 分片上传初始化
func TestInitPartUpload(t *testing.T) {
	u, _ := url.Parse("https://1-1257428686.cos.ap-nanjing.myqcloud.com")
	b := &cos.BaseURL{BucketURL: u}
	client := cos.NewClient(b, &http.Client{
		Transport: &cos.AuthorizationTransport{
			SecretID:  "xxx",
			SecretKey: "xxx",
		},
	})
	key := "cloud-disk/exampleobject.jpeg"
	v, _, err := client.Object.InitiateMultipartUpload(context.Background(), key, nil)
	if err != nil {
		t.Fatal(err)
	}
	UploadID := v.UploadID // 16631562940f6b708fdacbf27be8d55661d679c1c604ce652554829feda9429bbf0f21870a
	fmt.Println(UploadID)
}

// 分片上传
func TestPartUpload(t *testing.T) {
	u, _ := url.Parse("https://1-1257428686.cos.ap-nanjing.myqcloud.com")
	b := &cos.BaseURL{BucketURL: u}
	client := cos.NewClient(b, &http.Client{
		Transport: &cos.AuthorizationTransport{
			SecretID:  "xxx",
			SecretKey: "xxx",
		},
	})
	key := "cloud-disk/exampleobject.jpeg"
	UploadID := "16631562940f6b708fdacbf27be8d55661d679c1c604ce652554829feda9429bbf0f21870a"
	f, err := os.ReadFile("0.chunk") // md5 : 0b2559433238a3db77c4e2516e22a09d
	if err != nil {
		t.Fatal(err)
	}
	// opt可选
	resp, err := client.Object.UploadPart(
		context.Background(), key, UploadID, 1, bytes.NewReader(f), nil,
	)
	if err != nil {
		t.Fatal(err)
	}
	PartETag := resp.Header.Get("ETag")
	fmt.Println(PartETag)
}

// 分片上传完成
func TestPartUploadComplete(t *testing.T) {
	u, _ := url.Parse("https://1-1257428686.cos.ap-nanjing.myqcloud.com")
	b := &cos.BaseURL{BucketURL: u}
	client := cos.NewClient(b, &http.Client{
		Transport: &cos.AuthorizationTransport{
			SecretID:  "xxx",
			SecretKey: "xxx",
		},
	})
	key := "cloud-disk/exampleobject.jpeg"
	UploadID := "16631562940f6b708fdacbf27be8d55661d679c1c604ce652554829feda9429bbf0f21870a"

	opt := &cos.CompleteMultipartUploadOptions{}
	opt.Parts = append(opt.Parts, cos.Object{
		PartNumber: 1, ETag: "0b2559433238a3db77c4e2516e22a09d"},
	)
	_, _, err := client.Object.CompleteMultipartUpload(
		context.Background(), key, UploadID, opt,
	)
	if err != nil {
		t.Fatal(err)
	}
}
