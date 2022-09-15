package logic

import (
	"cloud-disk/core/helper"
	"cloud-disk/core/internal/svc"
	"cloud-disk/core/internal/types"
	"cloud-disk/core/models"
	"context"
	"errors"

	"github.com/zeromicro/go-zero/core/logx"
)

type UserFolderCreateLogic struct {
	logx.Logger
	ctx    context.Context
	svcCtx *svc.ServiceContext
}

func NewUserFolderCreateLogic(ctx context.Context, svcCtx *svc.ServiceContext) *UserFolderCreateLogic {
	return &UserFolderCreateLogic{
		Logger: logx.WithContext(ctx),
		ctx:    ctx,
		svcCtx: svcCtx,
	}
}

func (l *UserFolderCreateLogic) UserFolderCreate(req *types.UserFolderCreateRequest, userIdentity string) (resp *types.UserFolderCreateReply, err error) {
	ur := models.UserRepository{}
	has, err := l.svcCtx.Engine.Where("parent_id = ? AND name = ?",
		req.ParentId, req.Name).Get(&ur)
	if err != nil {
		return nil, err
	}
	if has {
		return nil, errors.New("名称已存在")
	}
	identity := helper.UUID()
	data := models.UserRepository{
		Identity:     identity,
		UserIdentity: userIdentity,
		ParentId:     req.ParentId,
		Name:         req.Name,
	}
	_, err = l.svcCtx.Engine.Insert(&data)
	if err != nil {
		return nil, err
	}
	resp = &types.UserFolderCreateReply{}
	resp.Identity = identity
	return
}
