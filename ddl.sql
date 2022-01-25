CREATE SCHEMA IF NOT EXISTS `crowdfunding` DEFAULT CHARACTER SET utf8;
USE `crowdfunding`;

CREATE TABLE IF NOT EXISTS `admin`
(
    `id`         INT         NOT NULL AUTO_INCREMENT,
    `user_id`    VARCHAR(20) NOT NULL,
    `email`      VARCHAR(50) NOT NULL,
    `password`   VARCHAR(20) NOT NULL,
    `mobile`     VARCHAR(20) NOT NULL,
    `created`    JSON        NOT NULL,
    `updated`    JSON        NOT NULL,
    `deleted_at` datetime,
    PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `member`
(
    `id`             INT          NOT NULL AUTO_INCREMENT,
    `email`          VARCHAR(100) NOT NULL,
    `password`       VARCHAR(20)  NOT NULL,
    `post_no`        VARCHAR(20),
    `address`        VARCHAR(50),
    `address_detail` VARCHAR(50),
    `mobile`         VARCHAR(20),
    `created`        JSON         NOT NULL,
    `updated`        JSON         NOT NULL,
    `deleted_at`     datetime,
    PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `retailer`
(
    `id`                           INT          NOT NULL AUTO_INCREMENT,
    `business_registration_number` VARCHAR(20)  NOT NULL COMMENT '사업자 번호',
    `email`                        VARCHAR(100) NOT NULL,
    `password`                     VARCHAR(20)  NOT NULL,
    `company_name`                 VARCHAR(20)  NOT NULL COMMENT '회사명',
    `mobile`                       VARCHAR(20)  NOT NULL,
    `created`                      JSON         NOT NULL,
    `updated`                      JSON         NOT NULL,
    `deleted_at`                   datetime,
    PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `purchasing_requisition`
(
    `id`                  INT         NOT NULL AUTO_INCREMENT,
    `registered_goods_id` INT COMMENT '등록된 물건',
    `quantity`            INT,
    `title`               VARCHAR(30) NOT NULL,
    `status`              VARCHAR(20) NOT NULL,
    `created`             JSON        NOT NULL,
    `updated`             JSON        NOT NULL,
    `deleted_at`          datetime,
    `agreed`              TINYINT(1)  NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `goods_inquiry`
(
    `id`           INT         NOT NULL AUTO_INCREMENT,
    `retailer_id`  INT,
    `image`        VARCHAR(40) COMMENT '썸네일',
    `contents`     LONGTEXT    NOT NULL COMMENT '내용',
    `status`       VARCHAR(20) NOT NULL,
    `price`        INT,
    `created`      JSON        NOT NULL,
    `updated`      JSON        NOT NULL,
    `deleted_at`   datetime,
    `goods_name`   VARCHAR(30) NOT NULL,
    `note`         TEXT,
    `category_id`  INT         NOT NULL,
    `company_name` VARCHAR(20) NOT NULL COMMENT '회사명',
    PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `registered_goods`
(
    `id`               INT         NOT NULL AUTO_INCREMENT,
    `goods_inquiry_id` INT         NOT NULL COMMENT '문의 ID',
    `retailer_id`      INT         NOT NULL,
    `name`             VARCHAR(30) NOT NULL COMMENT '제목',
    `logo`             VARCHAR(30) NOT NULL COMMENT '썸네일',
    `contents`         LONGTEXT    NOT NULL COMMENT '내용',
    `price`            INT,
    `quantity`         INT,
    `status`           VARCHAR(20) NOT NULL,
    `start_date`       VARCHAR(20) NOT NULL,
    `end_date`         VARCHAR(20) NOT NULL,
    `note`             TEXT,
    `title`            VARCHAR(30) NOT NULL,
    `category_id`      INT         NOT NULL,
    `created`          JSON        NOT NULL,
    `updated`          JSON        NOT NULL,
    `deleted_at`       datetime,
    PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `orders`
(
    `id`               INT         NOT NULL AUTO_INCREMENT,
    `member_id`        INT         NOT NULL,
    `quantity`         INT         NOT NULL COMMENT '수량',
    `price`            INT         NOT NULL COMMENT '가격',
    `post_no`          VARCHAR(10) NOT NULL COMMENT '우편번호',
    `address`          VARCHAR(50) NOT NULL COMMENT '주소',
    `address_detail`   VARCHAR(50) NOT NULL COMMENT '상세주소',
    `mobile`           VARCHAR(20) NULL COMMENT '핸드폰번호',
    `name`             VARCHAR(20) NOT NULL COMMENT '주문자이름',
    `order_num`        INT         NOT NULL COMMENT '주문번호',
    `status`           VARCHAR(20) NULL COMMENT '상태',
    third_party_agreed TINYINT     NOT NULL COMMENT '약관동의체크',
    `created`          JSON        NOT NULL,
    `updated`          JSON        NOT NULL,
    `deleted_at`       datetime,
    PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `address`
(
    `id`                 INT         NOT NULL AUTO_INCREMENT,
    `member_id`          int         NOT NULL,
    `name`               VARCHAR(20) NOT NULL COMMENT '사용자이름',
    `post_no`            VARCHAR(10) NOT NULL COMMENT '우편번호',
    `address`            VARCHAR(50) NOT NULL COMMENT '주소',
    `address_detail`     VARCHAR(50) NOT NULL COMMENT '상세주소',
    `is_default_address` TINYINT     NOT NULL COMMENT '기본주소체크',
    `created`            JSON        NOT NULL,
    `updated`            JSON        NOT NULL,
    `deleted_at`         datetime,
    PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `category`
(
    `id`         INT         NOT NULL AUTO_INCREMENT,
    `name`       VARCHAR(20) NOT NULL COMMENT '카테고리 이름',
    `created`    JSON        NOT NULL,
    `updated`    JSON        NOT NULL,
    `deleted_at` datetime,
    PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `terms`
(
    `id`           INT         NOT NULL AUTO_INCREMENT,
    `goods_id`     VARCHAR(50) NOT NULL,
    `order_id`     VARCHAR(20) NOT NULL,
    `company_name` VARCHAR(10) NOT NULL COMMENT '회사이름',
    `content`      text        NOT NULL COMMENT '약관내용',
    `created`      JSON        NOT NULL,
    `updated`      JSON        NOT NULL,
    `deleted_at`   datetime,

    PRIMARY KEY (`id`)
);

