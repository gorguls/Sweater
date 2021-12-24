INSERT INTO usr (id, username, password, active)
VALUES (1, 'admin', '$2a$08$ktiM44Gtqw8Jnp2NJKZ/IuhakMGTSBXLBKYvuc04teECKS3hRmEZa', true);

INSERT INTO user_role (user_id, roles)
VALUES  (1, 'ADMIN'),
        (1, 'USER');