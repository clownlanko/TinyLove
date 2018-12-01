package top.genitalbean.vi.mapper;

import java.util.List;

public interface BaseRepository<T> {
    Integer insert(T t);
    Integer update(T t);
    <E> Integer delete(E e);
    List<T> query();
}
