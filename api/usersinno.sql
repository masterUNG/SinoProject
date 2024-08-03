CREATE TABLE tb_user (
    
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    staffname VARCHAR(50) NOT NULL,
    staffsurname VARCHAR(50) NOT NULL,
    staffno VARCHAR(50) NOT NULL,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    branch_id VARCHAR(50) NOT NULL,
    user_level VARCHAR(50) NOT NULL,
    user_branch VARCHAR(50) NOT NULL,
    user_email VARCHAR(50) NOT NULL,
    pea_id VARCHAR(50) NOT NULL,
    user_type VARCHAR(50) NOT NULL,
    user_status VARCHAR(50) NOT NULL,
    leader VARCHAR(50) NOT NULL,
    user_date VARCHAR(50) NOT NULL,
    ref_user_id VARCHAR(50) NOT NULL,
    user_id_card VARCHAR(50) NOT NULL,
    user_phone VARCHAR(50) NOT NULL,
    user_address VARCHAR(50) NOT NULL,
    user_bank_name VARCHAR(50) NOT NULL,
    user_bank_number VARCHAR(50) NOT NULL,
    user_img VARCHAR(50) NOT NULL
    
    
);
