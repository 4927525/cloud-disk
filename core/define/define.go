package define

import (
	"github.com/dgrijalva/jwt-go"
	"os"
)

type UserClaim struct {
	Id       int
	Identity string
	Name     string
	jwt.StandardClaims
}

var JwtKey = "cloud-disk-key"
var TokenExpire = 3600
var RefreshTokenExpire = 7200
var MailPassword = os.Getenv("MailPassword")
var CodeLength = 6

// CodeExpire 验证码过期时间（s）
var CodeExpire = 300

// TencentSecretKey 腾讯云对象存储
var TencentSecretKey = os.Getenv("TencentSecretKey")
var TencentSecretID = os.Getenv("TencentSecretID")
var CosBucket = os.Getenv("CosBucket")

// PageSize 分页的默认参数
var PageSize = 10
var Datetime = "2006-01-02 15:04:05"
