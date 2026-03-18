CREATE TABLE IF NOT EXISTS orders (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id) ON DELETE SET NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2) NOT NULL CHECK (total_amount >= 0),
    status VARCHAR(20) DEFAULT 'pending',
    payment_method VARCHAR(20),
    delivery_address TEXT,
    CONSTRAINT valid_status CHECK (status IN ('pending', 'confirmed', 'preparing', 'completed', 'cancelled'))
);