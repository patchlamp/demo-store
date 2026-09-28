-- The golden rows: what the demo's database holds after `demo reset` (every
-- night at 04:10). Fernhill Candle Co. is fictional: invented candles and
-- prices, 555 numbers, example.com addresses. Pickup hours Tuesday to
-- Saturday, closed Sunday and Monday, so "we're open Mondays now, 10 to 4"
-- is a real change. Prices are in cents.
INSERT INTO products (name, category, price_cents, description, sort) VALUES
  ('Cedar & Smoke', 'Candles, 8 oz jar', 2400, 'Cedarwood, a little woodsmoke, a little vetiver. About 50 hours.', 1),
  ('Morning Orchard', 'Candles, 8 oz jar', 2400, 'Green apple, pear skin and fresh-cut grass. About 50 hours.', 2),
  ('Salt Flats', 'Candles, 8 oz jar', 2400, 'Sea salt, sage and driftwood. About 50 hours.', 3),
  ('Brown Butter Bakery', 'Candles, 8 oz jar', 2600, 'Toasted sugar, vanilla bean, warm bread. About 50 hours.', 4),
  ('Canyon Rain', 'Candles, 8 oz jar', 2400, 'Wet stone, juniper and petrichor. About 50 hours.', 5),
  ('Fernhill Signature', 'Candles, 14 oz, two wicks', 3800, 'Fir needle, black tea and a touch of citrus. About 80 hours.', 6),
  ('Travel tin trio', 'Small things', 1800, 'Cedar & Smoke, Morning Orchard and Salt Flats in 4 oz tins.', 7),
  ('Wax melts, six cubes', 'Small things', 900, 'Any scent from the jar shelf; tell us which in the note.', 8),
  ('Wick trimmer', 'Small things', 1400, 'Brass, angled, keeps a flame short and clean.', 9),
  ('Long matches', 'Small things', 600, 'A box of 50 ten-inch matches, for deep jars.', 10),
  ('Pumpkin Chai', 'Seasonal', 2600, 'Clove, cardamom, roasted pumpkin. Autumn only.', 11),
  ('Snowed-In', 'Seasonal', 2600, 'Peppermint bark and white birch. Back in November.', 12);
UPDATE products SET status = 'sold out' WHERE name = 'Snowed-In';
INSERT INTO hours (weekday, opens, closes, note) VALUES
  (2, '10:00', '18:00', NULL),
  (3, '10:00', '18:00', NULL),
  (4, '10:00', '19:00', NULL),
  (5, '10:00', '19:00', NULL),
  (6, '09:00', '15:00', 'Saturday pour: watch a batch');
INSERT INTO orders (stripe_session_id, name, email, phone, items, summary, total_cents, note, mode, status) VALUES
  ('demo_seed_1', 'Sam Example', 'sam@example.com', '555-0142',
   '[{"id":1,"name":"Cedar & Smoke","qty":2,"price_cents":2400},{"id":10,"name":"Long matches","qty":1,"price_cents":600}]',
   '2 × Cedar & Smoke, 1 × Long matches', 5400, 'Picking up Friday after work.', 'test', 'paid'),
  ('demo_seed_2', 'Robin Sample', 'robin@example.com', NULL,
   '[{"id":7,"name":"Travel tin trio","qty":1,"price_cents":1800}]',
   '1 × Travel tin trio', 1800, 'A gift, can you wrap it?', 'test', 'ready');

-- Stock (B40): the rows `db add stock --from-sheet` imported from fernhill-stock.xlsx
-- (claude-tools/templates/tools/stock/). Six are below reorder.
INSERT INTO stock (item, kind, on_hand, reorder_at, supplier, unit_cost_cents, last_counted) VALUES
  ('Cedar & Smoke 8 oz', 'Candle', 14, 10, 'Poured here', 640, '2026-09-26'),
  ('Morning Orchard 8 oz', 'Candle', 6, 10, 'Poured here', 640, '2026-09-26'),
  ('Salt Flats 8 oz', 'Candle', 22, 10, 'Poured here', 640, '2026-09-26'),
  ('Brown Butter Bakery 8 oz', 'Candle', 9, 10, 'Poured here', 690, '2026-09-26'),
  ('Canyon Rain 8 oz', 'Candle', 11, 10, 'Poured here', 640, '2026-09-26'),
  ('Fernhill Signature 14 oz', 'Candle', 4, 6, 'Poured here', 1120, '2026-09-26'),
  ('Travel tin trio', 'Candle', 12, 8, 'Poured here', 510, '2026-09-26'),
  ('Pumpkin Chai 8 oz', 'Candle', 18, 10, 'Poured here', 690, '2026-09-26'),
  ('Soy wax (10 lb bag)', 'Supply', 3, 4, 'Example Wax Supply', 3200, '2026-09-25'),
  ('Cotton wicks (100)', 'Supply', 5, 2, 'Sample Wick Works', 950, '2026-09-25'),
  ('Amber jars 8 oz (12)', 'Supply', 7, 6, 'Placeholder Glass Co.', 2100, '2026-09-25'),
  ('Tins 4 oz (24)', 'Supply', 1, 2, 'Placeholder Glass Co.', 1800, '2026-09-25'),
  ('Wick trimmers', 'Retail', 6, 4, 'Sample Wick Works', 525, '2026-09-25'),
  ('Long matches (box)', 'Retail', 10, 12, 'Example Wax Supply', 180, '2026-09-25');
