use pc;
CREATE INDEX INGEX_PRODUCT_MODEL_MAKER ON product(model,maker);


drop index product.INGEX_PRODUCT_MODEL_MAKER;