CREATE TABLE tb_work_import_data (
    
    id INT AUTO_INCREMENT PRIMARY KEY,
    ca VARCHAR(50) NOT NULL,
    pea_no VARCHAR(50) NOT NULL,
    cus_name VARCHAR(50) NOT NULL,
    cus_id VARCHAR(50) NOT NULL,
    tel VARCHAR(50) NOT NULL,
    invoice_no VARCHAR(50) NOT NULL,
    bill_date VARCHAR(50) NOT NULL,
    write_id VARCHAR(50) NOT NULL,
    address VARCHAR(50) NOT NULL,
    new_period_date VARCHAR(50) NOT NULL,
    write_date VARCHAR(50) NOT NULL,
    total VARCHAR(50) NOT NULL,
    lat VARCHAR(50) NOT NULL,
    lng VARCHAR(50) NOT NULL,
    invoice_status VARCHAR(50) NOT NULL,
    noti_date VARCHAR(50) NOT NULL,
    update_date VARCHAR(50) NOT NULL,   
    work_date VARCHAR(50) NOT NULL,
    work_image VARCHAR(50) NOT NULL,
    work_image_lat VARCHAR(50) NOT NULL,
    work_image_lng VARCHAR(50) NOT NULL,
    worker_code VARCHAR(50) NOT NULL,
    worker_name VARCHAR(50) NOT NULL,
    user_id VARCHAR(50) NOT NULL,
    distance VARCHAR(50) NOT NULL
    
    
);
