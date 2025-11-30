-- +goose Up
-- +goose StatementBegin

CREATE TABLE IF NOT EXISTS exchange_rates (
    from_currency VARCHAR(10) NOT NULL,
    to_currency   VARCHAR(10) NOT NULL,
    rate          DOUBLE PRECISION NOT NULL,

    PRIMARY KEY (from_currency, to_currency)
);

COMMENT ON TABLE exchange_rates IS 'Таблица курсов обмена между валютами';
COMMENT ON COLUMN exchange_rates.from_currency IS 'Валюта, из которой производится обмен';
COMMENT ON COLUMN exchange_rates.to_currency IS 'Валюта, в которую производится обмен';
COMMENT ON COLUMN exchange_rates.rate IS 'Курс обмена от from_currency к to_currency';

ALTER TABLE exchange_rates ADD CONSTRAINT fk_to_currency FOREIGN KEY (to_currency) REFERENCES currencies(code);
ALTER TABLE exchange_rates ADD CONSTRAINT fk_from_currency FOREIGN KEY (from_currency) REFERENCES currencies(code);

-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin

ALTER TABLE exchange_rates DROP CONSTRAINT IF EXISTS fk_to_currency;
ALTER TABLE exchange_rates DROP CONSTRAINT IF EXISTS fk_from_currency;

DROP TABLE IF EXISTS exchange_rates;

-- +goose StatementEnd
