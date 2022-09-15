package test

import (
	"crypto/tls"
	"github.com/jordan-wright/email"
	"net/smtp"
	"testing"
)

func TestSendMail(t *testing.T) {
	e := email.NewEmail()
	e.From = "kevin <hzbskak@gmail.com>"
	e.To = []string{"2536366291@qq.com"}
	e.Subject = "邮箱验证码"
	e.Text = []byte("验证码")
	e.HTML = []byte("您的验证码是：<h1>123456</h1>")
	e.SendWithTLS("smtp.gmail.com:587", smtp.PlainAuth("", "test@gmail.com", "password123", "smtp.gmail.com"),
		&tls.Config{InsecureSkipVerify: true, ServerName: "smtp.gmail.com"})
}
