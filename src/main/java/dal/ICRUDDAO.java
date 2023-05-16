package dal;

public interface ICRUDDAO<T> {
	void insert(T t);
	void delete(int id);
	void update(T t);
}
