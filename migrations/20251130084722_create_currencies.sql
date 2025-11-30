-- +goose Up
-- +goose StatementBegin

CREATE TABLE IF NOT EXISTS currencies (
    code VARCHAR(10) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
);

COMMENT ON TABLE currencies IS 'Справочник валют';
COMMENT ON COLUMN currencies.code IS 'Уникальный код валюты (ISO)';
COMMENT ON COLUMN currencies.name IS 'Название валюты';

-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin

DROP TABLE IF EXISTS currencies;

-- +goose StatementEnd
