package by.bw.sweater.repos;

import by.bw.sweater.domain.Message;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface MessageRepo extends CrudRepository<Message, Long> {
//    Руководство по JPA репозиториям:
//    https://docs.spring.io/spring-data/jpa/docs/1.5.0.RELEASE/reference/html/jpa.repositories.html#jpa.query-methods.query-creation
    List<Message> findByTag(String tag);
}
