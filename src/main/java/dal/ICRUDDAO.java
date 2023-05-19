package dal;


public interface ICRUDDAO<T> {
	T insert(T t) throws DALException;
	void delete(int id) throws DALException;
	void update(T t) throws DALException;
	T selectById(int id) throws DALException;
}
