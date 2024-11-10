package com.ly.service.Comment;

import com.ly.dao.Comment.CommentMapper;
import com.ly.pojo.Comment;
import com.ly.pojo.Emoji;
import com.ly.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class CommentServiceImpl implements CommentService{
    @Autowired
    private CommentMapper commentMapper;

    public void setCommentMapper(CommentMapper commentMapper) {
        this.commentMapper = commentMapper;
    }

    @Override
    public List<Emoji> allEmoji() {
        return commentMapper.allEmoji();
    }

    @Override
    public List<Comment> allComment() {
        return commentMapper.allComment();
    }

    @Override
    public int addComment(Comment comment) {
        return commentMapper.addComment(comment);
    }

    @Override
    public int deleteCommentById(int id) {
        return commentMapper.deleteCommentById(id);
    }

    @Override
    public int updateCommentPersonalName(Comment comment) {
        return commentMapper.updateCommentPersonalName(comment);
    }
}
