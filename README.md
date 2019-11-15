# StarShipNeo_DB
Database for StarShipNeo

## Tables
| Name | Comments | Links |
| --- | --- | --- |
| game_account | Information for user account: login, mail, password | / |
| game_coord | Coordinates for everything | sector_id == game_sector.id |
| game_language | Known languages | / |
| game_language_content | Strings used for display | lang_id == game_language.id |
| game_object | Object information | type_id == game_object_type.id |
| game_object_type | Known object types | / |
| game_sector | Space sectors with some options (circular, 2d) | / |
| game_ship | Ship information | type_id == game_ship_type.id, user_id == game_account.id, coord_id == game_coord.id |
| game_ship_baycontent | Content of cargo bay of ships (several lines for one ship) | object_id == game_object.id, ship_id == game_ship.id |
| game_ship_type | Known ship types | / |
