<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

final class Version20240501000000 extends AbstractMigration
{
    public function getDescription(): string
    {
        return 'Initial sales order schema';
    }

    public function up(Schema $schema): void
    {
        $this->addSql('CREATE TABLE customer (id SERIAL PRIMARY KEY, name VARCHAR(255) NOT NULL, email VARCHAR(255) NOT NULL UNIQUE, phone VARCHAR(50) DEFAULT NULL)');
        $this->addSql('CREATE TABLE customer_address (id SERIAL PRIMARY KEY, customer_id INT NOT NULL, label VARCHAR(120) NOT NULL, line1 VARCHAR(255) NOT NULL, line2 VARCHAR(255) DEFAULT NULL, city VARCHAR(120) NOT NULL, state VARCHAR(120) NOT NULL, postal_code VARCHAR(20) NOT NULL, country VARCHAR(120) NOT NULL DEFAULT \"USA\")');
        $this->addSql('CREATE TABLE sku (id SERIAL PRIMARY KEY, code VARCHAR(60) NOT NULL UNIQUE, description VARCHAR(255) NOT NULL, unit_price NUMERIC(10, 2) NOT NULL, is_active BOOLEAN NOT NULL)');
        $this->addSql('CREATE TABLE sales_order (id SERIAL PRIMARY KEY, customer_id INT NOT NULL, shipping_address_id INT NOT NULL, order_date DATE NOT NULL, status VARCHAR(20) NOT NULL, notes TEXT DEFAULT NULL)');
        $this->addSql('CREATE TABLE sales_order_line (id SERIAL PRIMARY KEY, order_id INT NOT NULL, sku_id INT NOT NULL, quantity INT NOT NULL, unit_price NUMERIC(10, 2) NOT NULL)');
        $this->addSql('ALTER TABLE customer_address ADD CONSTRAINT FK_ADDRESS_CUSTOMER FOREIGN KEY (customer_id) REFERENCES customer (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE sales_order ADD CONSTRAINT FK_ORDER_CUSTOMER FOREIGN KEY (customer_id) REFERENCES customer (id) ON DELETE RESTRICT');
        $this->addSql('ALTER TABLE sales_order ADD CONSTRAINT FK_ORDER_ADDRESS FOREIGN KEY (shipping_address_id) REFERENCES customer_address (id) ON DELETE RESTRICT');
        $this->addSql('ALTER TABLE sales_order_line ADD CONSTRAINT FK_LINE_ORDER FOREIGN KEY (order_id) REFERENCES sales_order (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE sales_order_line ADD CONSTRAINT FK_LINE_SKU FOREIGN KEY (sku_id) REFERENCES sku (id) ON DELETE RESTRICT');
    }

    public function down(Schema $schema): void
    {
        $this->addSql('DROP TABLE sales_order_line');
        $this->addSql('DROP TABLE sales_order');
        $this->addSql('DROP TABLE sku');
        $this->addSql('DROP TABLE customer_address');
        $this->addSql('DROP TABLE customer');
    }
}
