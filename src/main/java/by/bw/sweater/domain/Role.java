package by.bw.sweater.domain;

import org.springframework.security.core.GrantedAuthority;

public enum Role implements GrantedAuthority {
    USER, ADMIN, SUPERUSER;

    //Имплементируем GrantedAuthority, так как было несовпадение типа
    @Override
    public String getAuthority() {
        return name();
    }

}