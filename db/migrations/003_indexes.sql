

CREATE INDEX room_search_gin ON rooms USING gin (search_vec);
CREATE INDEX room_name_trgm ON rooms USING gin (name gin_trgm_ops);
CREATE INDEX room_equipment_gin ON rooms USING gin (equipment gjsonb_path_ops);
CREATE INDEX room_tags_gin ON rooms USING gin (tags);
CREATE INDEX room_location_idx ON rooms (location_id);

CREATE INDEX bookings_user_start ON bookings (user_id, (lower(period)) DESC ) include (status, room_id);
CREATE INDEX bookings_pending ON bookings (created_at) where status = 'pending';
CREATE INDEX bookings_room_start ON bookings (room_id, (lower(period)));

CREATE INDEX audit_created_brin ON audit_logs USING brin (created_at);