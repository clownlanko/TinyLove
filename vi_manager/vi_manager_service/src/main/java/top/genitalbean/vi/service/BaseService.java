package top.genitalbean.vi.service;

import java.util.List;

public interface BaseService{
    <T> boolean insert(T t);
    <T>boolean delete(T e);
    <T> boolean update(T t);
    <T> List<T> query();
}
