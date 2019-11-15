# StarShipNeo_DB
Database for StarShipNeo

## Tables
| Name | Comments | Links |
| --- | --- | --- |
| game_account | Information for user account: login, mail, password | / |
| game_align | Groups | / |
| game_coord | Coordinates for everything | sector_id == game_sector.id |
| game_debris | Debris information | object_id == game_object.id, coord_id == game_coord.id |
| game_language | Known languages | / |
| game_language_content | Strings used for display | lang_id == game_language.id |
| game_message | Message information | author_id == game_account.id |
| game_message_dest | Message destinatary (several lines for one message if several destinataries) | message_id == game_message.id, user_id == game_account.id |
| game_mission | Mission information | start_station_id == game_station.id, end_station_id == game_station.id, object_id == game_object.id, user_id == game_account.id |
| game_object | Object information | type_id == game_object_type.id |
| game_object_type | Known object types | / |
| game_random_firstname | To randomize NPC generation | / |
| game_sector | Space sectors with some options (circular, 2d) | / |
| game_ship | Ship information | type_id == game_ship_type.id, user_id == game_account.id, coord_id == game_coord.id |
| game_ship_baycontent | Content of cargo bay of ships (several lines for one ship) | object_id == game_object.id, ship_id == game_ship.id |
| game_ship_slotcontent | Content of equipment slots of ships (several lines for one ship) | slot_id == game_slot.id, object_id == game_object.id, ship_id == game_ship.id |
| game_ship_type | Known ship types | / |
| game_slot | Equipment slot information | type_id == game_slot_type.id |
| game_slot_type | Known ship equipment slots | / |
| game_station | Station information | type_id == game_station_type.id |
| game_station_type | Known station types | / |
