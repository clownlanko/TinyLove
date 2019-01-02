package top.genitalbean.vi.mapper;

import java.util.List;

public interface BaseRepository {
    <T> Integer insert(T t);
    <T>Integer delete(T e);
    <T> Integer update(T t);
    <T> List<T> query();
}
