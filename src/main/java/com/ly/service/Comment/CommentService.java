package com.ly.service.Comment;

import com.ly.pojo.Comment;
import com.ly.pojo.Emoji;
import com.ly.pojo.User;

import java.util.List;

public interface CommentService {
    //查询所有表情
    List<Emoji> allEmoji();
    //查询所有评论
    List<Comment> allComment();
    //发表评论，以当前登录的用户为准，登录时同时将自己的信息存入session，通过提取他的名字和头像在comment表里插入他的评论
    int addComment(Comment comment);
    //根据当前选中的评论id删除评论
    int deleteCommentById(int id);
    //personal页进行用户更新的同时，更新所有该用户发表的评论的用户名
    int updateCommentPersonalName(Comment comment);
}
