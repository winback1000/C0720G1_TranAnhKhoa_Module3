package DAO;

import java.util.TreeMap;

public interface IGetTypeDAO {
    public TreeMap<Integer,String> getList();
    public void insertType(String name);
    public String selectType(int key);
    public void deleteType(int key);
    public boolean updateType(int key, String name);
    public TreeMap<Integer,String> searchType(String name);
}
