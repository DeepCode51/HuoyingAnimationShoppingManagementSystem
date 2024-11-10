package com.ly.service.Music;

import com.ly.dao.Music.MusicMapper;
import com.ly.pojo.Music;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class MusicServiceImpl implements MusicService{
    @Autowired
    private MusicMapper musicMapper;

    public void setMusicMapper(MusicMapper musicMapper) {
        this.musicMapper = musicMapper;
    }

    @Override
    public int addmusic(Music music) {
        return musicMapper.addmusic(music);
    }

    @Override
    public List<Music> allmusic() {
        return musicMapper.allmusic();
    }

    @Override
    public List<Music> selectOP() {
        return musicMapper.selectOP();
    }

    @Override
    public List<Music> selectED() {
        return musicMapper.selectED();
    }

    @Override
    public int deletemusicById(int id) {
        return musicMapper.deletemusicById(id);
    }

    @Override
    public int updatemusic(Music music) {
        return musicMapper.updatemusic(music);
    }

    @Override
    public Music querymusicById(int id) {
        return musicMapper.querymusicById(id);
    }
}
